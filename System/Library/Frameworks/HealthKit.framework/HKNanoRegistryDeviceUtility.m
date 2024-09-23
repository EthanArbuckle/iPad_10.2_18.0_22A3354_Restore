@implementation HKNanoRegistryDeviceUtility

+ (unsigned)systemVersionForDevice:(id)a3
{
  id v3;
  id *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v4 = (id *)getNRDevicePropertySystemVersionSymbolLoc_ptr;
  v15 = (void *)getNRDevicePropertySystemVersionSymbolLoc_ptr;
  if (!getNRDevicePropertySystemVersionSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v4 = (id *)dlsym(v5, "NRDevicePropertySystemVersion");
    v13[3] = (uint64_t)v4;
    getNRDevicePropertySystemVersionSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v12, 8);
  if (!v4)
    +[HKNanoRegistryDeviceUtility systemVersionForDevice:].cold.1();
  v6 = *v4;
  objc_msgSend(v3, "valueForProperty:", v6, v12);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v8 = getNRRawVersionFromStringSymbolLoc_ptr;
  v15 = getNRRawVersionFromStringSymbolLoc_ptr;
  if (!getNRRawVersionFromStringSymbolLoc_ptr)
  {
    v9 = (void *)NanoRegistryLibrary_1();
    v8 = dlsym(v9, "NRRawVersionFromString");
    v13[3] = (uint64_t)v8;
    getNRRawVersionFromStringSymbolLoc_ptr = v8;
  }
  _Block_object_dispose(&v12, 8);
  if (!v8)
    +[HKNanoRegistryDeviceUtility systemVersionForDevice:].cold.2();
  v10 = ((uint64_t (*)(id))v8)(v7);

  return v10;
}

+ (id)modelNumberForDevice:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getNRDevicePropertyModelNumberSymbolLoc_ptr;
  v11 = getNRDevicePropertyModelNumberSymbolLoc_ptr;
  if (!getNRDevicePropertyModelNumberSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v4 = dlsym(v5, "NRDevicePropertyModelNumber");
    v9[3] = (uint64_t)v4;
    getNRDevicePropertyModelNumberSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
    +[HKNanoRegistryDeviceUtility modelNumberForDevice:].cold.1();
  objc_msgSend(v3, "valueForProperty:", *v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)productTypeForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  getNRDevicePropertyProductType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)regionInfoForDevice:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getNRDevicePropertyRegionInfoSymbolLoc_ptr;
  v11 = getNRDevicePropertyRegionInfoSymbolLoc_ptr;
  if (!getNRDevicePropertyRegionInfoSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v4 = dlsym(v5, "NRDevicePropertyRegionInfo");
    v9[3] = (uint64_t)v4;
    getNRDevicePropertyRegionInfoSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
    +[HKNanoRegistryDeviceUtility regionInfoForDevice:].cold.1();
  objc_msgSend(v3, "valueForProperty:", *v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)systemBuildVersionForDevice:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getNRDevicePropertySystemBuildVersionSymbolLoc_ptr;
  v11 = getNRDevicePropertySystemBuildVersionSymbolLoc_ptr;
  if (!getNRDevicePropertySystemBuildVersionSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v4 = dlsym(v5, "NRDevicePropertySystemBuildVersion");
    v9[3] = (uint64_t)v4;
    getNRDevicePropertySystemBuildVersionSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
    +[HKNanoRegistryDeviceUtility systemBuildVersionForDevice:].cold.1();
  objc_msgSend(v3, "valueForProperty:", *v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)deviceHousingColor:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getNRDevicePropertyDeviceHousingColorSymbolLoc_ptr;
  v11 = getNRDevicePropertyDeviceHousingColorSymbolLoc_ptr;
  if (!getNRDevicePropertyDeviceHousingColorSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v4 = dlsym(v5, "NRDevicePropertyDeviceHousingColor");
    v9[3] = (uint64_t)v4;
    getNRDevicePropertyDeviceHousingColorSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
    +[HKNanoRegistryDeviceUtility deviceHousingColor:].cold.1();
  objc_msgSend(v3, "valueForProperty:", *v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)activePairedDeviceModelNumber
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "activeNonFamilySetupDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelNumberForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (id)activePairedDeviceSystemBuildVersion
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "activeNonFamilySetupDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemBuildVersionForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)activePairedDeviceProductType
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "activeNonFamilySetupDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "productTypeForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (NSString)activePairedDeviceRegionInfo
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "activeNonFamilySetupDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "regionInfoForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (NSString)activePairedDeviceHousingColor
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "activeNonFamilySetupDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deviceHousingColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (id)electrocardiogramV2AvailableRegionsForDevice:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getNRDevicePropertyElectrocardiogramV2AvailableRegionsSymbolLoc_ptr;
  v11 = getNRDevicePropertyElectrocardiogramV2AvailableRegionsSymbolLoc_ptr;
  if (!getNRDevicePropertyElectrocardiogramV2AvailableRegionsSymbolLoc_ptr)
  {
    v5 = (void *)NanoRegistryLibrary_1();
    v4 = dlsym(v5, "NRDevicePropertyElectrocardiogramV2AvailableRegions");
    v9[3] = (uint64_t)v4;
    getNRDevicePropertyElectrocardiogramV2AvailableRegionsSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
    +[HKNanoRegistryDeviceUtility electrocardiogramV2AvailableRegionsForDevice:].cold.1();
  objc_msgSend(v3, "valueForProperty:", *v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isDeviceSeries4:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  getNRDevicePropertyProductType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "hasPrefix:", CFSTR("Watch4,"));
  return (char)v3;
}

+ (id)activeNonFamilySetupDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getNRPairedDeviceRegistryClass(), "activeDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)systemVersionForDevice:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertySystemVersion(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKNanoRegistryDeviceUtility.m"), 31, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

+ (void)systemVersionForDevice:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint32_t getNRRawVersionFromString(NSString *__strong)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKNanoRegistryDeviceUtility.m"), 22, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

+ (void)modelNumberForDevice:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyModelNumber(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKNanoRegistryDeviceUtility.m"), 27, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

+ (void)regionInfoForDevice:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyRegionInfo(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKNanoRegistryDeviceUtility.m"), 29, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

+ (void)systemBuildVersionForDevice:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertySystemBuildVersion(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKNanoRegistryDeviceUtility.m"), 30, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

+ (void)deviceHousingColor:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyDeviceHousingColor(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKNanoRegistryDeviceUtility.m"), 26, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

+ (void)electrocardiogramV2AvailableRegionsForDevice:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyElectrocardiogramV2AvailableRegions(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKNanoRegistryDeviceUtility.m"), 25, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

@end
