@implementation HMAccessory

uint64_t __51__HMAccessory_HFAdditions__hf_isProgrammableSwitch__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isProgrammableSwitch");
}

id __48__HMAccessory_HFAdditions__hf_componentServices__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "hf_standardServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hf_owningBridgeAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_standardServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_35_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__HMAccessory_HFAdditions__hf_componentServices__block_invoke_3;
  v9[3] = &unk_1EA7283A0;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __47__HMAccessory_HFAdditions__hf_standardServices__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_standardServiceTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__HMAccessory_HFAdditions__hf_standardServices__block_invoke_2;
  v9[3] = &unk_1EA7283A0;
  v10 = v2;
  v6 = v2;
  objc_msgSend(v5, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __50__HMAccessory_HFAdditions__hf_siriEndpointProfile__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __66__HMAccessory_HFIncludedContextProtocol__hf_hasSetForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasSetForContextType:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__HMAccessory_HFIncludedContextProtocol___areAllSensorServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSensorService");
}

uint64_t __48__HMAccessory_HFAdditions__hf_componentServices__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_childServices");
}

uint64_t __45__HMAccessory_HFAdditions__hf_primaryService__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPrimaryService");
}

uint64_t __53__HMAccessory_HFAdditions__hf_areAllServicesInGroups__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isInGroup");
}

uint64_t __55__HMAccessory_HFAdditions__hf_irrigationSystemServices__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A50]);

  return v3;
}

uint64_t __43__HMAccessory_HFAdditions__hf_isPowerStrip__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9AA0]);

  return v3;
}

uint64_t __47__HMAccessory_HFAdditions__hf_standardServices__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

id __52__HMAccessory_HFAdditions__hf_owningBridgeAccessory__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_allBridgeAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HMAccessory_HFAdditions__hf_owningBridgeAccessory__block_invoke_2;
  v6[3] = &unk_1EA727840;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "na_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __60__HMAccessory_AbstractionAdditions__hf_accessoryLikeObjects__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;

  objc_msgSend(a2, "hf_rootAccessoryLikeHomeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == *(void **)(a1 + 32))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    +[HFAccessoryLikeObject _accessoryLikeObjectForObject:](HFAccessoryLikeObject, "_accessoryLikeObjectForObject:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v3, "hf_accessoryLikeObject");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    objc_msgSend(v4, "setWithObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "hf_accessoryLikeObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, WeakRetained, CFSTR("HomeKit+Abstraction.m"), 136, CFSTR("%@-%@: root HomeKit object (%@) does not confirm to HFAccessoryLikeObjectVendor or HFAccessoryLikeObjectContainer"), v13, v14, v3);

    v7 = 0;
  }
LABEL_6:

  return v7;
}

id __46__HMAccessory_HFAdditions__hf_visibleServices__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "hf_standardServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hf_componentServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setByRemovingObjectsFromSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __49__HMAccessory_HFAdditions__hf_bridgedAccessories__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __83__HMAccessory_HFIncludedContextProtocol__hf_anyNonSensorServiceIsOnForContextType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "hf_isSensorService") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "hf_shouldBeOnForContextType:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __52__HMAccessory_HFAdditions__hf_owningBridgeAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifiersForBridgedAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

id __51__HMAccessory_HFAdditions__hf_servicesBehindBridge__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "hf_bridgedAccessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_44_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__HMAccessory_AbstractionAdditions__hf_accessoryType__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "associatedServiceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "associatedServiceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __64__HMAccessory_AbstractionAdditions__hf_containedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristics");
}

void __51__HMAccessory_AbstractionAdditions__hf_moveToRoom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assignAccessory:toRoom:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);

}

id __59__HMAccessory_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_accessoryWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v3;
  v7 = v5;

  return v7;
}

void __51__HMAccessory_HFMediaAdditions__hf_identifyHomePod__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject logError:operationDescription:](v5, "logError:operationDescription:", v4, CFSTR("Identify for HomePod"));
  }
  else
  {
    HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Successfully sent identify message to accessory: %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

void __51__HMAccessory_HFMediaAdditions___pushSymptomUpdate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "symptoms");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "symptomsHandler:didUpdateSymptoms:", v3, v4);

  }
}

uint64_t __53__HMAccessory_HFMediaAdditions__hf_fakeDebugSymptoms__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_setGeneratedByHomeAppForDebuggingPurposes:", 1);
}

uint64_t __53__HMAccessory_HFAdditions__hf_requiresFirmwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  v2 = a2;
  if ((objc_msgSend(v2, "hf_isLegacyService") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "serviceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB99A0]);

    if ((v5 & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(v2, "characteristics");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "na_any:", &__block_literal_global_3_6);

    }
  }

  return v3;
}

uint64_t __53__HMAccessory_HFAdditions__hf_requiresFirmwareUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_allRequiredCharacteristicTypesForStandardServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
  {
    objc_msgSend(v2, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CB8780]) ^ 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __52__HMAccessory_HFAdditions__hf_isCeilingFanWithLight__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A70]);

  return v3;
}

uint64_t __52__HMAccessory_HFAdditions__hf_isCeilingFanWithLight__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isFan");
}

uint64_t __52__HMAccessory_HFAdditions__hf_isCeilingFanWithLight__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A70]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v2, "hf_isFan");

  return v4;
}

uint64_t __41__HMAccessory_HFAdditions__hf_isDoorbell__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A08]);

  return v3;
}

uint64_t __46__HMAccessory_HFAdditions__hf_isNetworkRouter__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isNetworkRouter");
}

uint64_t __55__HMAccessory_HFAdditions__hf_isNetworkRouterSatellite__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isNetworkRouterSatellite");
}

uint64_t __60__HMAccessory_HFAdditions__hf_isNotificationSupportedCamera__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = a2;
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_serviceOfType:", *MEMORY[0x1E0CB9A08]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_serviceOfType:", *MEMORY[0x1E0CB9A90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v2, "hf_supportsRecordingEvents");
  if (v4)
    v8 = 1;
  else
    v8 = v7;
  if (v6)
    return 1;
  else
    return v8;
}

uint64_t __77__HMAccessory_HFAdditions__hf_servicesWithBulletinBoardNotificationTurnedOff__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "bulletinBoardNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "bulletinBoardNotification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEnabled") ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __58__HMAccessory_HFAdditions__hf_canShowAsIndividualServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSensorService") ^ 1;
}

uint64_t __48__HMAccessory_HFAdditions__hf_isSensorAccessory__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSensorService");
}

void __52__HMAccessory_HFAdditions__hf_isMatterOnlyAccessory__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "BOOLForKey:", CFSTR("forceNativeMatter"));

}

void __59__HMAccessory_HFAdditions__hf_setShowAsIndividualServices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);

}

uint64_t __51__HMAccessory_HFAdditions__hf_linkedResidentDevice__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __48__HMAccessory_HFAdditions__hf_groupableServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsGroups");
}

uint64_t __45__HMAccessory_HFAdditions__hf_primaryService__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __45__HMAccessory_HFAdditions__hf_primaryService__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hf_standardServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

uint64_t __52__HMAccessory_HFAdditions__hf_hasInputSourceService__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A48]);

  return v3;
}

BOOL __48__HMAccessory_HFAdditions__hf_componentServices__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

uint64_t __58__HMAccessory_HFAdditions__hf_displayNamesForVisibleTiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_displayName");
}

uint64_t __48__HMAccessory_HFAdditions__hf_appPunchOutReason__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isLegacyService");
}

uint64_t __59__HMAccessory_HFAdditions__hf_numberOfProgrammableSwitches__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isProgrammableSwitch");
}

uint64_t __45__HMAccessory_HFAdditions__hf_serviceOfType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __57__HMAccessory_HFAdditions__hf_programmableSwitchServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isProgrammableSwitch");
}

void __66__HMAccessory_HFAdditions__hf_programmableSwitchNamespaceServices__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a2, "hf_labelNamespaceCharacteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB9A58]);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

uint64_t __51__HMAccessory_HFAdditions__hf_servicesBehindBridge__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "services");
}

id __59__HMAccessory_HFAdditions__hf_networkConfigurationProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

uint64_t __58__HMAccessory_HFAdditions__hf_hasManagedNetworkCredential__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasManagedNetworkCredential");
}

void __61__HMAccessory_HFAdditions__hf_getUserFriendlyDescriptionKey___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[38];
  _QWORD v30[39];

  v30[38] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB79F0];
  v29[0] = *MEMORY[0x1E0CB79E8];
  v29[1] = v0;
  v30[0] = CFSTR("AirConditioner");
  v30[1] = CFSTR("AirDehumidifier");
  v1 = *MEMORY[0x1E0CB7A00];
  v29[2] = *MEMORY[0x1E0CB79F8];
  v29[3] = v1;
  v30[2] = CFSTR("AirHeater");
  v30[3] = CFSTR("AirHumidifier");
  v2 = *MEMORY[0x1E0CB7A08];
  v29[4] = *MEMORY[0x1E0CB7A10];
  v29[5] = v2;
  v30[4] = CFSTR("AirPurifier");
  v30[5] = CFSTR("AirPort");
  v3 = *MEMORY[0x1E0CB7A20];
  v29[6] = *MEMORY[0x1E0CB7A18];
  v29[7] = v3;
  v30[6] = CFSTR("AppleTV");
  v30[7] = CFSTR("AudioReceiver");
  v4 = *MEMORY[0x1E0CB7A30];
  v29[8] = *MEMORY[0x1E0CB7A28];
  v29[9] = v4;
  v30[8] = CFSTR("Bridge");
  v30[9] = CFSTR("Door");
  v5 = *MEMORY[0x1E0CB7A40];
  v29[10] = *MEMORY[0x1E0CB7A38];
  v29[11] = v5;
  v30[10] = CFSTR("DoorLock");
  v30[11] = CFSTR("Fan");
  v6 = *MEMORY[0x1E0CB7A50];
  v29[12] = *MEMORY[0x1E0CB7A48];
  v29[13] = v6;
  v30[12] = CFSTR("Faucet");
  v30[13] = CFSTR("GarageDoorOpener");
  v7 = *MEMORY[0x1E0CB7A60];
  v29[14] = *MEMORY[0x1E0CB7A58];
  v29[15] = v7;
  v30[14] = CFSTR("HomePod");
  v30[15] = CFSTR("IPCamera");
  v8 = *MEMORY[0x1E0CB7A70];
  v29[16] = *MEMORY[0x1E0CB7A68];
  v29[17] = v8;
  v30[16] = CFSTR("Lightbulb");
  v30[17] = CFSTR("Other");
  v9 = *MEMORY[0x1E0CB7A80];
  v29[18] = *MEMORY[0x1E0CB7A78];
  v29[19] = v9;
  v30[18] = CFSTR("Outlet");
  v30[19] = CFSTR("ProgrammableSwitch");
  v10 = *MEMORY[0x1E0CB7A88];
  v30[20] = CFSTR("RangeExtender");
  v11 = *MEMORY[0x1E0CB7AF8];
  v29[20] = v10;
  v29[21] = v11;
  HFLocalizedWiFiStringKeyForKey(CFSTR("Router"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CB7A90];
  v30[21] = v12;
  v30[22] = CFSTR("SecuritySystem");
  v14 = *MEMORY[0x1E0CB7A98];
  v29[22] = v13;
  v29[23] = v14;
  v15 = *MEMORY[0x1E0CB7AA0];
  v30[23] = CFSTR("Sensor");
  v30[24] = CFSTR("ShowerHead");
  v16 = *MEMORY[0x1E0CB7AA8];
  v29[24] = v15;
  v29[25] = v16;
  v17 = *MEMORY[0x1E0CB7AB0];
  v30[25] = CFSTR("Speaker");
  v30[26] = CFSTR("Sprinkler");
  v18 = *MEMORY[0x1E0CB7AB8];
  v29[26] = v17;
  v29[27] = v18;
  v19 = *MEMORY[0x1E0CB7AC0];
  v30[27] = CFSTR("Switch");
  v30[28] = CFSTR("TargetController");
  v20 = *MEMORY[0x1E0CB7AC8];
  v29[28] = v19;
  v29[29] = v20;
  v21 = *MEMORY[0x1E0CB7AD8];
  v30[29] = CFSTR("Television");
  v30[30] = CFSTR("TelevisionSetTopBox");
  v22 = *MEMORY[0x1E0CB7AE0];
  v29[30] = v21;
  v29[31] = v22;
  v23 = *MEMORY[0x1E0CB7AE8];
  v30[31] = CFSTR("TelevisionStreamingStick");
  v30[32] = CFSTR("Thermostat");
  v24 = *MEMORY[0x1E0CB7AF0];
  v29[32] = v23;
  v29[33] = v24;
  v25 = *MEMORY[0x1E0CB7B00];
  v30[33] = CFSTR("VideoDoorbell");
  v30[34] = CFSTR("Window");
  v26 = *MEMORY[0x1E0CB7B08];
  v29[34] = v25;
  v29[35] = v26;
  v30[35] = CFSTR("WindowCovering");
  v30[36] = CFSTR("PowerStrip");
  v29[36] = CFSTR("3047A1A5-8BFC-4112-9888-21314F438FF3");
  v29[37] = CFSTR("9D302CDA-1467-4E19-ABC9-9ED36BE34508");
  v30[37] = CFSTR("Fan");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 38);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)_MergedGlobals_256;
  _MergedGlobals_256 = v27;

}

uint64_t __44__HMAccessory_HFAdditions___hf_categoryType__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A08]);

  return v3;
}

void __90__HMAccessory_HFAdditions__hf_onboardSiriEndpointIfNeededWithSettingKeyPath_settingValue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    HFLogForCategory(0x3CuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "Implicit Onboarding failed to apply onboarding selections with error: [%@]", (uint8_t *)&v6, 0xCu);
    }

  }
  HFLogForCategory(0x3CuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMSiriEndpointOnboardingResultAsString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Implicit Onboarding succeeded with result: [%@]", (uint8_t *)&v6, 0xCu);

  }
}

uint64_t __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchCHIPPairingsWithCompletion:", a2);
}

id __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "na_dictionaryWithKeyGenerator:", &__block_literal_global_150);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "home");
}

id __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory(0x2DuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@ failed due to %@", (uint8_t *)&v8, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __64__HMAccessory_HFAdditions__hf_minimumDescriptionsOfAccessories___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_minimumDescription");
}

uint64_t __70__HMAccessory_HFIncludedContextProtocol__hf_shouldBeOnForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_shouldBeOnForContextType:", *(_QWORD *)(a1 + 32));
}

uint64_t __70__HMAccessory_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(WeakRetained, "home");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "hf_currentUserIsRestrictedGuest");

    if ((v3 & 1) != 0)
      goto LABEL_12;
  }
  if ((objc_msgSend(WeakRetained, "hf_showAsIndividualServices") & 1) != 0)
    goto LABEL_12;
  if ((objc_msgSend(WeakRetained, "hf_isPureBridge") & 1) != 0)
    goto LABEL_12;
  if ((objc_msgSend(WeakRetained, "hf_isNetworkRouter") & 1) != 0)
    goto LABEL_12;
  objc_msgSend(WeakRetained, "hf_visibleServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_122);

  if (v5)
  {
    if (!objc_msgSend(WeakRetained, "hf_isNonServiceBasedAccessory"))
      goto LABEL_12;
  }
  objc_msgSend(WeakRetained, "mediaProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_14;
  objc_msgSend(WeakRetained, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_mediaSystemForAccessory:", WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(WeakRetained, "mediaProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isContainedWithinItemGroup");

    if ((v10 & 1) != 0)
      goto LABEL_12;
LABEL_14:
    v11 = 0;
    goto LABEL_13;
  }

LABEL_12:
  v11 = 1;
LABEL_13:

  return v11;
}

uint64_t __70__HMAccessory_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSensorService");
}

void __92__HMAccessory_HFIncludedContextProtocol__hf_updateValueForCurrentObjectOnly_forContextType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);

}

uint64_t __65__HMAccessory_HFHomeContainedObjectConformance__hf_isValidObject__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __69__HMAccessory_HFSoftwareUpdateAdditions__hf_softwareUpdateComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "hf_softwareUpdateVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_softwareUpdateVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

void __63__HMAccessory_HFApplicationData___hf_didUpdateApplicationData___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessoryDidUpdateApplicationData:", *(_QWORD *)(a1 + 32));

}

void __89__HMAccessory_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString **v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;

  v15 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasOptedToHH2") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "residentDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v8 = HFOperationUpdateApplicationDataResidentSync;
    if (!v7)
      v8 = HFOperationUpdateApplicationDataCloudSync;
  }
  else
  {

    v8 = HFOperationUpdateApplicationDataCloudSync;
  }
  v9 = *(unsigned __int8 *)(a1 + 56);
  v10 = *v8;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
    objc_msgSend(v11, "handleError:operationType:options:retryBlock:cancelBlock:", v15, v10, 0, 0, 0);
  else
    objc_msgSend(v11, "logError:operationDescription:", v15, v10);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "applicationData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_hf_didUpdateApplicationData:", v14);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __48__HMAccessory_HFReordering__hf_updateDateAdded___block_invoke(uint64_t a1, void *a2)
{
  return HFUpdateDateAddedForApplicationDataContainer(a2, *(void **)(a1 + 32));
}

uint64_t __48__HMAccessory_HFReordering__hf_updateDateAdded___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

@end
