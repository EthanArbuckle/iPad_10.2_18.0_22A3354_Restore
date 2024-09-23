@implementation HKActiveWatchRemoteFeatureAvailabilityDataSource

- (HKActiveWatchRemoteFeatureAvailabilityDataSource)init
{
  HKActiveWatchRemoteFeatureAvailabilityDataSource *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NRPairedDeviceRegistry *pairedDeviceRegistry;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)HKActiveWatchRemoteFeatureAvailabilityDataSource;
  v2 = -[HKActiveWatchRemoteFeatureAvailabilityDataSource init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getNRPairedDeviceRegistryClass_softClass_2;
    v13 = getNRPairedDeviceRegistryClass_softClass_2;
    if (!getNRPairedDeviceRegistryClass_softClass_2)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getNRPairedDeviceRegistryClass_block_invoke_2;
      v9[3] = &unk_1E37E8690;
      v9[4] = &v10;
      __getNRPairedDeviceRegistryClass_block_invoke_2((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v4, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    pairedDeviceRegistry = v2->_pairedDeviceRegistry;
    v2->_pairedDeviceRegistry = (NRPairedDeviceRegistry *)v5;

  }
  return v2;
}

- (id)_activeWatch
{
  void *v2;
  void *v3;

  -[HKActiveWatchRemoteFeatureAvailabilityDataSource pairedDeviceRegistry](self, "pairedDeviceRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)iOSVersion
{
  void *v5;
  int v6;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCompanionCapable");

  if (v6)
    return +[_HKBehavior currentOSVersionStruct](_HKBehavior, "currentOSVersionStruct");
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleWatch");

  if (v9
    && (-[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    -[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v12 = (id *)getNRDevicePropertySystemVersionSymbolLoc_ptr_0;
    v22 = (void *)getNRDevicePropertySystemVersionSymbolLoc_ptr_0;
    if (!getNRDevicePropertySystemVersionSymbolLoc_ptr_0)
    {
      v13 = (void *)NanoRegistryLibrary_2();
      v12 = (id *)dlsym(v13, "NRDevicePropertySystemVersion");
      v20[3] = (uint64_t)v12;
      getNRDevicePropertySystemVersionSymbolLoc_ptr_0 = (uint64_t)v12;
    }
    _Block_object_dispose(&v19, 8);
    if (!v12)
      -[HKActiveWatchRemoteFeatureAvailabilityDataSource iOSVersion].cold.1();
    v14 = *v12;
    objc_msgSend(v11, "valueForProperty:", v14, v19);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v16 = getNRRawVersionFromStringSymbolLoc_ptr_0;
    v22 = getNRRawVersionFromStringSymbolLoc_ptr_0;
    if (!getNRRawVersionFromStringSymbolLoc_ptr_0)
    {
      v17 = (void *)NanoRegistryLibrary_2();
      v16 = dlsym(v17, "NRRawVersionFromString");
      v20[3] = (uint64_t)v16;
      getNRRawVersionFromStringSymbolLoc_ptr_0 = v16;
    }
    _Block_object_dispose(&v19, 8);
    if (!v16)
      -[HKActiveWatchRemoteFeatureAvailabilityDataSource iOSVersion].cold.2();
    v18 = ((uint64_t (*)(id))v16)(v15);

    return -[HKActiveWatchRemoteFeatureAvailabilityDataSource _operatingSystemVersionForOSVersion:](self, "_operatingSystemVersionForOSVersion:", v18, v19);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = HKNSOperatingSystemVersionUnknown;
    retstr->var2 = 0;
  }
  return result;
}

- (id)iOSBuildVersion
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCompanionCapable");

  if (v4)
  {
    +[_HKBehavior currentOSBuild](_HKBehavior, "currentOSBuild");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isAppleWatch");

    if (v7
      && (-[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      -[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      getNRDevicePropertySystemBuildVersion();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForProperty:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchOSVersion
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  -[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v8 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    v15 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
    {
      v9 = (void *)NanoRegistryLibrary_2();
      v8 = dlsym(v9, "NRWatchOSVersionForRemoteDevice");
      v13[3] = (uint64_t)v8;
      getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = v8;
    }
    _Block_object_dispose(&v12, 8);
    if (!v8)
      -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchOSVersion].cold.1();
    v10 = ((uint64_t (*)(id))v8)(v7);

    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
    -[HKActiveWatchRemoteFeatureAvailabilityDataSource _operatingSystemVersionForOSVersion:](self, "_operatingSystemVersionForOSVersion:", v10, v12);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = HKNSOperatingSystemVersionUnknown;
    retstr->var2 = 0;
  }

  return result;
}

- (id)watchRegion
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v3 = (_QWORD *)getNRDevicePropertyRegionCodeSymbolLoc_ptr;
    v10 = getNRDevicePropertyRegionCodeSymbolLoc_ptr;
    if (!getNRDevicePropertyRegionCodeSymbolLoc_ptr)
    {
      v4 = (void *)NanoRegistryLibrary_2();
      v3 = dlsym(v4, "NRDevicePropertyRegionCode");
      v8[3] = (uint64_t)v3;
      getNRDevicePropertyRegionCodeSymbolLoc_ptr = (uint64_t)v3;
    }
    _Block_object_dispose(&v7, 8);
    if (!v3)
      -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchRegion].cold.1();
    objc_msgSend(v2, "valueForProperty:", *v3, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)watchRegionInfo
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v3 = (_QWORD *)getNRDevicePropertyRegionInfoSymbolLoc_ptr_0;
    v10 = getNRDevicePropertyRegionInfoSymbolLoc_ptr_0;
    if (!getNRDevicePropertyRegionInfoSymbolLoc_ptr_0)
    {
      v4 = (void *)NanoRegistryLibrary_2();
      v3 = dlsym(v4, "NRDevicePropertyRegionInfo");
      v8[3] = (uint64_t)v3;
      getNRDevicePropertyRegionInfoSymbolLoc_ptr_0 = (uint64_t)v3;
    }
    _Block_object_dispose(&v7, 8);
    if (!v3)
      -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchRegionInfo].cold.1();
    objc_msgSend(v2, "valueForProperty:", *v3, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)watchModelNumber
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = (_QWORD *)getNRDevicePropertyModelNumberSymbolLoc_ptr_0;
  v10 = getNRDevicePropertyModelNumberSymbolLoc_ptr_0;
  if (!getNRDevicePropertyModelNumberSymbolLoc_ptr_0)
  {
    v4 = (void *)NanoRegistryLibrary_2();
    v3 = dlsym(v4, "NRDevicePropertyModelNumber");
    v8[3] = (uint64_t)v3;
    getNRDevicePropertyModelNumberSymbolLoc_ptr_0 = (uint64_t)v3;
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
    -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchModelNumber].cold.1();
  objc_msgSend(v2, "valueForProperty:", *v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)watchBuildType
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = (_QWORD *)getNRDevicePropertyBuildTypeSymbolLoc_ptr;
  v10 = getNRDevicePropertyBuildTypeSymbolLoc_ptr;
  if (!getNRDevicePropertyBuildTypeSymbolLoc_ptr)
  {
    v4 = (void *)NanoRegistryLibrary_2();
    v3 = dlsym(v4, "NRDevicePropertyBuildType");
    v8[3] = (uint64_t)v3;
    getNRDevicePropertyBuildTypeSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
    -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchBuildType].cold.1();
  objc_msgSend(v2, "valueForProperty:", *v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)watchProductType
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = (_QWORD *)getNRDevicePropertyProductTypeSymbolLoc_ptr_0;
  v10 = getNRDevicePropertyProductTypeSymbolLoc_ptr_0;
  if (!getNRDevicePropertyProductTypeSymbolLoc_ptr_0)
  {
    v4 = (void *)NanoRegistryLibrary_2();
    v3 = dlsym(v4, "NRDevicePropertyProductType");
    v8[3] = (uint64_t)v3;
    getNRDevicePropertyProductTypeSymbolLoc_ptr_0 = (uint64_t)v3;
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
    -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchProductType].cold.1();
  objc_msgSend(v2, "valueForProperty:", *v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)watchOSBuildVersion
{
  void *v2;
  void *v3;
  void *v4;

  -[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getNRDevicePropertySystemBuildVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchAtrialFibrillationDetectionVersion
{
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HKActiveWatchRemoteFeatureAvailabilityDataSource _activeWatch](self, "_activeWatch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v7 = (_QWORD *)getNRDevicePropertyBackgroundAtrialFibrillationVersionSymbolLoc_ptr;
    v14 = getNRDevicePropertyBackgroundAtrialFibrillationVersionSymbolLoc_ptr;
    if (!getNRDevicePropertyBackgroundAtrialFibrillationVersionSymbolLoc_ptr)
    {
      v8 = (void *)NanoRegistryLibrary_2();
      v7 = dlsym(v8, "NRDevicePropertyBackgroundAtrialFibrillationVersion");
      v12[3] = (uint64_t)v7;
      getNRDevicePropertyBackgroundAtrialFibrillationVersionSymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v11, 8);
    if (!v7)
      -[HKActiveWatchRemoteFeatureAvailabilityDataSource watchAtrialFibrillationDetectionVersion].cold.1();
    objc_msgSend(v6, "valueForProperty:", *v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    HKSemanticVersionFromString(retstr, v9);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = HKSemanticVersionUnknown;
    retstr->var2 = 0;
  }

  return result;
}

- (id)currentDeviceClass
{
  void *v2;
  void *v3;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_operatingSystemVersionForOSVersion:(SEL)a3
{
  retstr->var0 = HIWORD(a4);
  retstr->var1 = BYTE1(a4);
  retstr->var2 = a4;
  return self;
}

- (NSString)onboardingCountryCode
{
  return self->_onboardingCountryCode;
}

- (void)setOnboardingCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NRPairedDeviceRegistry)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (void)setPairedDeviceRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_onboardingCountryCode, 0);
}

- (void)iOSVersion
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint32_t getNRRawVersionFromString(NSString *__strong)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKActiveWatchRemoteFeatureAvailabilityDataSource.m"), 37, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

- (void)watchOSVersion
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint32_t getNRWatchOSVersionForRemoteDevice(NRDevice *__strong)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKActiveWatchRemoteFeatureAvailabilityDataSource.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

- (void)watchRegion
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyRegionCode(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKActiveWatchRemoteFeatureAvailabilityDataSource.m"), 31, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

- (void)watchRegionInfo
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyRegionInfo(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKActiveWatchRemoteFeatureAvailabilityDataSource.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

- (void)watchModelNumber
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyModelNumber(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKActiveWatchRemoteFeatureAvailabilityDataSource.m"), 29, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

- (void)watchBuildType
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyBuildType(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKActiveWatchRemoteFeatureAvailabilityDataSource.m"), 28, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

- (void)watchProductType
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyProductType(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKActiveWatchRemoteFeatureAvailabilityDataSource.m"), 30, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

- (void)watchAtrialFibrillationDetectionVersion
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyBackgroundAtrialFibrillationVersion(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKActiveWatchRemoteFeatureAvailabilityDataSource.m"), 35, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

@end
