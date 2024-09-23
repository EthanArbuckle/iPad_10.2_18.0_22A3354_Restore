@implementation _ANEDeviceInfo

+ (BOOL)isInternalBuild
{
  if (+[_ANEDeviceInfo isInternalBuild]::onceTokenIsInternalBuild != -1)
    dispatch_once(&+[_ANEDeviceInfo isInternalBuild]::onceTokenIsInternalBuild, &__block_literal_global);
  return +[_ANEDeviceInfo isInternalBuild]::isInternalBuild;
}

+ (unsigned)numANEs
{
  const __CFDictionary *v3;
  mach_port_t *v4;
  io_service_t MatchingService;
  io_object_t v6;
  const __CFDictionary *CFProperty;
  void *v8;
  const __CFDictionary *v10;
  io_service_t v11;
  io_object_t v12;
  const __CFAllocator *v13;
  const __CFDictionary *v14;
  CFMutableDictionaryRef MutableCopy;
  const __CFNumber *Value;
  const __CFNumber *v17;
  CFTypeID v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  unsigned int valuePtr;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!+[_ANEDeviceInfo hasANE](_ANEDeviceInfo, "hasANE"))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@: [_ANEDeviceInfo numANEs] No ANEs found on system"), v8);

    return 0;
  }
  valuePtr = 1;
  v3 = IOServiceMatching("H1xANELoadBalancer");
  v4 = (mach_port_t *)MEMORY[0x1E0CBBAA8];
  if (v3 && (MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v3)) != 0)
  {
    v6 = MatchingService;
    CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("DeviceProperties"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    IOObjectRelease(v6);
  }
  else
  {
    CFProperty = 0;
  }
  v10 = IOServiceMatching("H11ANEIn");
  if (v10 && (v11 = IOServiceGetMatchingService(*v4, v10)) != 0)
  {
    v12 = v11;
    v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v14 = (const __CFDictionary *)IORegistryEntryCreateCFProperty(v11, CFSTR("DeviceProperties"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    IOObjectRelease(v12);
    if (CFProperty)
      MutableCopy = CFProperty;
    else
      MutableCopy = v14;
    if (CFProperty && v14)
    {
      MutableCopy = CFDictionaryCreateMutableCopy(v13, 0, CFProperty);
      CFDictionaryApplyFunction(v14, (CFDictionaryApplierFunction)getANEDeviceProperties(__CFString const*)::{lambda(__CFDictionary const*,__CFDictionary const*)#1}::operator() const(__CFDictionary const*,__CFDictionary const*)::{lambda(void const*,void const*,void *)#1}::__invoke, MutableCopy);
      CFRelease(CFProperty);
      CFRelease(v14);
    }
    if (MutableCopy)
      goto LABEL_16;
  }
  else
  {
    MutableCopy = CFProperty;
    if (CFProperty)
    {
LABEL_16:
      Value = (const __CFNumber *)CFDictionaryGetValue(MutableCopy, CFSTR("ANEDevicePropertyNumANEs"));
      if (Value)
      {
        v17 = Value;
        v18 = CFGetTypeID(Value);
        if (v18 == CFNumberGetTypeID() && !CFNumberGetValue(v17, kCFNumberSInt32Type, &valuePtr))
        {
          +[_ANELog framework](_ANELog, "framework");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            +[_ANEDeviceInfo numANEs].cold.2();
          }

        }
      }
      if (!valuePtr)
      {
        +[_ANELog framework](_ANELog, "framework");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          +[_ANEDeviceInfo numANEs].cold.1();
        }

        valuePtr = 1;
      }
      CFRelease(MutableCopy);
      return valuePtr;
    }
  }
  +[_ANELog framework](_ANELog, "framework");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v22;
    _os_log_impl(&dword_1D3352000, v21, OS_LOG_TYPE_INFO, "%@: [_ANEDeviceInfo numANEs] Properties not found, default to 1 ANE", buf, 0xCu);

  }
  return 1;
}

+ (BOOL)hasANE
{
  void *v2;
  void *v3;
  void *v5;

  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
    {
      if (+[_ANEDeviceInfo hasANE]::onceTokenHasANE == -1)
        return +[_ANEDeviceInfo hasANE]::hasANE;
      v5 = &__block_literal_global_5;
    }
    else
    {
      if (+[_ANEDeviceInfo hasANE]::onceTokenHasANE == -1)
        return +[_ANEDeviceInfo hasANE]::hasANE;
      v5 = &__block_literal_global_6;
    }
    dispatch_once(&+[_ANEDeviceInfo hasANE]::onceTokenHasANE, v5);
    return +[_ANEDeviceInfo hasANE]::hasANE;
  }
  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANEDeviceInfo hasANE]::hasANE = objc_msgSend(v3, "hasANE");

  return +[_ANEDeviceInfo hasANE]::hasANE;
}

+ (unsigned)numANECores
{
  void *v3;
  unsigned int v4;
  int v5;
  NSObject *v7;

  +[_ANEDeviceInfo aneSubType](_ANEDeviceInfo, "aneSubType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[_ANEDeviceInfo numANEs](_ANEDeviceInfo, "numANEs");
  if ((objc_msgSend(v3, "isEqual:", CFSTR("h11")) & 1) != 0 || (objc_msgSend(v3, "isEqual:", CFSTR("h12")) & 1) != 0)
  {
    v5 = 8;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqual:", CFSTR("m9")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqual:", CFSTR("h13")) & 1) != 0
        || (objc_msgSend(v3, "isEqual:", CFSTR("h14")) & 1) != 0
        || (objc_msgSend(v3, "isEqual:", CFSTR("h15")) & 1) != 0
        || (objc_msgSend(v3, "isEqual:", CFSTR("h16")) & 1) != 0)
      {
        v5 = 16;
        goto LABEL_4;
      }
      if ((objc_msgSend(v3, "isEqual:", CFSTR("m11")) & 1) != 0)
      {
        v5 = 4;
        goto LABEL_4;
      }
      +[_ANELog framework](_ANELog, "framework");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        +[_ANEDeviceInfo numANECores].cold.1();
      }

    }
    v5 = 2;
  }
LABEL_4:

  return v5 * v4;
}

+ (id)aneSubType
{
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD block[4];
  void (**v17)(_QWORD, _QWORD);
  uint64_t v18;
  _QWORD v19[5];

  v3 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __28___ANEDeviceInfo_aneSubType__block_invoke;
  v19[3] = &__block_descriptor_40_e8_v16__0q8l;
  v19[4] = a2;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D824DCD4](v19);
  v5 = objc_msgSend(a1, "aneBoardType");
  +[_ANELog framework](_ANELog, "framework");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[_ANEDeviceInfo aneSubType].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __28___ANEDeviceInfo_aneSubType__block_invoke_36;
    block[3] = &unk_1E9515FC0;
    v17 = v4;
    v18 = v5;
    if (+[_ANEDeviceInfo aneSubType]::onceTokenSubType != -1)
      dispatch_once(&+[_ANEDeviceInfo aneSubType]::onceTokenSubType, block);

  }
  else
  {
    v4[2](v4, v5);
  }
  v14 = (id)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;

  return v14;
}

+ (BOOL)isExcessivePowerDrainWhenIdle
{
  return objc_msgSend(a1, "aneBoardType") == 96;
}

+ (int64_t)aneBoardType
{
  void *v2;
  void *v3;

  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEDeviceInfo aneBoardType]::boardType = objc_msgSend(v3, "aneBoardtype");

  }
  else
  {
    if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
      return 1;
    if (+[_ANEDeviceInfo aneBoardType]::onceTokenBoardType != -1)
      dispatch_once(&+[_ANEDeviceInfo aneBoardType]::onceTokenBoardType, &__block_literal_global_13);
  }
  return +[_ANEDeviceInfo aneBoardType]::boardType;
}

+ (id)aneSubTypeVariant
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  __int128 v13;
  const __CFString *v14;
  _QWORD v16[4];
  void *v17;
  uint64_t v18;

  v2 = objc_msgSend(a1, "aneBoardType");
  +[_ANELog framework](_ANELog, "framework");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[_ANEDeviceInfo aneSubType].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[2] = __35___ANEDeviceInfo_aneSubTypeVariant__block_invoke_42;
    v16[3] = &unk_1E9515FC0;
    v16[1] = 3221225472;
    v17 = &__block_literal_global_37;
    v18 = v2;
    if (+[_ANEDeviceInfo aneSubTypeVariant]::onceTokenSubVariantType == -1)
    {
      v11 = &__block_literal_global_37;
    }
    else
    {
      dispatch_once(&+[_ANEDeviceInfo aneSubTypeVariant]::onceTokenSubVariantType, v16);
      v11 = v17;
    }
  }
  else
  {
    *((_QWORD *)&v13 + 1) = v2;
    *(_QWORD *)&v13 = v2 - 64;
    v12 = v13 >> 4;
    if (v12 > 0xD)
      v14 = &stru_1E9516758;
    else
      v14 = off_1E9516040[v12];
    v11 = (void *)+[_ANEDeviceInfo aneSubTypeVariant]::aneSubTypeVariantStr;
    +[_ANEDeviceInfo aneSubTypeVariant]::aneSubTypeVariantStr = (uint64_t)v14;
  }

  return (id)+[_ANEDeviceInfo aneSubTypeVariant]::aneSubTypeVariantStr;
}

+ (id)aneSubTypeProductVariant
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  void *v14;
  uint64_t v15;

  v2 = objc_msgSend(a1, "aneBoardType");
  +[_ANELog framework](_ANELog, "framework");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[_ANEDeviceInfo aneSubType].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[2] = __42___ANEDeviceInfo_aneSubTypeProductVariant__block_invoke_44;
    v13[3] = &unk_1E9515FC0;
    v13[1] = 3221225472;
    v14 = &__block_literal_global_43;
    v15 = v2;
    if (+[_ANEDeviceInfo aneSubTypeProductVariant]::onceToken == -1)
    {
      v11 = &__block_literal_global_43;
    }
    else
    {
      dispatch_once(&+[_ANEDeviceInfo aneSubTypeProductVariant]::onceToken, v13);
      v11 = v14;
    }
  }
  else
  {
    v11 = (void *)+[_ANEDeviceInfo aneSubTypeProductVariant]::aneSubTypeProductVariantStr;
    +[_ANEDeviceInfo aneSubTypeProductVariant]::aneSubTypeProductVariantStr = (uint64_t)&stru_1E9516758;
  }

  return (id)+[_ANEDeviceInfo aneSubTypeProductVariant]::aneSubTypeProductVariantStr;
}

+ (BOOL)isVirtualMachine
{
  if (+[_ANEDeviceInfo isVirtualMachine]::onceToken != -1)
    dispatch_once(&+[_ANEDeviceInfo isVirtualMachine]::onceToken, &__block_literal_global_2);
  return +[_ANEDeviceInfo isVirtualMachine]::isVirtualMachine;
}

+ (id)aneArchitectureType
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aneArchitectureTypeStr");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)+[_ANEDeviceInfo aneArchitectureType]::aneArchitectureTypeStr;
    +[_ANEDeviceInfo aneArchitectureType]::aneArchitectureTypeStr = v4;

LABEL_7:
    v6 = (id)+[_ANEDeviceInfo aneArchitectureType]::aneArchitectureTypeStr;
    return v6;
  }
  if (!+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    if (+[_ANEDeviceInfo aneArchitectureType]::onceTokenArchitectureType != -1)
      dispatch_once(&+[_ANEDeviceInfo aneArchitectureType]::onceTokenArchitectureType, &__block_literal_global_9);
    goto LABEL_7;
  }
  v6 = 0;
  return v6;
}

+ (id)buildVersion
{
  if (+[_ANEDeviceInfo buildVersion]::onceToken != -1)
    dispatch_once(&+[_ANEDeviceInfo buildVersion]::onceToken, &__block_literal_global_45);
  return (id)+[_ANEDeviceInfo buildVersion]::buildVersionStr;
}

+ (id)productName
{
  if (+[_ANEDeviceInfo productName]::onceToken != -1)
    dispatch_once(&+[_ANEDeviceInfo productName]::onceToken, &__block_literal_global_48);
  return (id)+[_ANEDeviceInfo productName]::productNameStr;
}

+ (id)bootArgs
{
  _BYTE *v2;
  __CFString *v3;
  size_t v5;

  v2 = malloc_type_calloc(1uLL, 0x400uLL, 0x94C61774uLL);
  v5 = 1023;
  if (sysctlbyname("kern.bootargs", v2, &v5, 0, 0))
  {
    v3 = &stru_1E9516758;
  }
  else
  {
    v2[1023] = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  free(v2);
  return v3;
}

+ (BOOL)isBoolBootArgSetTrue:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  +[_ANEDeviceInfo bootArgs](_ANEDeviceInfo, "bootArgs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "rangeOfString:", v3) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=0"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rangeOfString:", v6) == 0x7FFFFFFFFFFFFFFFLL;

  }
  return v5;
}

+ (BOOL)precompiledModelChecksDisabled
{
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(a1, "bootArgs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("enforceModelSignatureChecks=0"));
  if (v4)
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@: boot-args has %@ - allow any path for Pre-compiled models"), v5, CFSTR("enforceModelSignatureChecks=0"));

  }
  return v4;
}

+ (void)aneSubType
{
  OUTLINED_FUNCTION_3_0(&dword_1D3352000, a2, a3, "anesubtype %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_10();
}

+ (void)numANEs
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, v3, (uint64_t)v3, "%@:  [_ANEDeviceInfo numANEs] Failed to get numANEs, default to 1 ANE", v4);

  OUTLINED_FUNCTION_2_0();
}

+ (void)numANECores
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, v3, (uint64_t)v3, "%@: Unknown aneSubType", v4);

  OUTLINED_FUNCTION_2_0();
}

@end
