@implementation MLCPlatformInfo

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_1);
  return isInternalBuild_isInternalBuild;
}

uint64_t __34__MLCPlatformInfo_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isInternalBuild_isInternalBuild = result;
  return result;
}

+ (BOOL)gpuUsageUnsupported
{
  return objc_msgSend(a1, "gpuUsageUnsupportedIncludingLowPower:", 1);
}

+ (BOOL)gpuUsageUnsupportedIncludingLowPower:(BOOL)a3
{
  void *v3;
  BOOL v4;

  +[MLCDeviceGPU filteredGPUListIncludingLowPoweredBuiltin:](MLCDeviceGPU, "filteredGPUListIncludingLowPoweredBuiltin:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

+ (BOOL)multiGPUUsageUnsupported
{
  void *v3;
  BOOL v4;

  if ((objc_msgSend(a1, "gpuUsageUnsupported") & 1) != 0)
    return 1;
  +[MLCDeviceGPU filteredGPUListIncludingLowPoweredBuiltin:](MLCDeviceGPU, "filteredGPUListIncludingLowPoweredBuiltin:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MLCDeviceGPU multiGPUNotSupportedInFilteredGPUList:](MLCDeviceGPU, "multiGPUNotSupportedInFilteredGPUList:", v3);

  return v4;
}

+ (BOOL)aneUsageUnsupported
{
  return !+[MLCDeviceANE hasANE](MLCDeviceANE, "hasANE");
}

+ (id)buildVersion
{
  if (buildVersion_onceToken != -1)
    dispatch_once(&buildVersion_onceToken, &__block_literal_global_3);
  return (id)buildVersion_buildVersionStr;
}

void __31__MLCPlatformInfo_buildVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGGetStringAnswer();
  v1 = (void *)buildVersion_buildVersionStr;
  buildVersion_buildVersionStr = v0;

}

+ (id)osVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;

  v2 = (__CFString *)MGCopyAnswer();
  v3 = (__CFString *)MGCopyAnswer();
  if (v2)
    v4 = v2;
  else
    v4 = CFSTR("???");
  v5 = v4;
  if (v3)
    v6 = v3;
  else
    v6 = CFSTR("???");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ (%@)"), CFSTR("iOS"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    CFRelease(v2);
  if (v3)
    CFRelease(v3);

  return v8;
}

+ (id)bootArgs
{
  _BYTE *v2;
  __CFString *v3;
  size_t v5;

  v2 = malloc_type_calloc(1uLL, 0x400uLL, 0x6E9FF526uLL);
  v5 = 1023;
  if (sysctlbyname("kern.bootargs", v2, &v5, 0, 0))
  {
    v3 = &stru_1E9821EC0;
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

+ (id)mpsGraphConvolutionEnvVariable
{
  if (mpsGraphConvolutionEnvVariable_onceToken != -1)
    dispatch_once(&mpsGraphConvolutionEnvVariable_onceToken, &__block_literal_global_22);
  return (id)mpsGraphConvolutionEnvVariable_envVariable;
}

void __49__MLCPlatformInfo_mpsGraphConvolutionEnvVariable__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("MLC_GPU_USE_MPSGRAPHCONVOLUTION"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)mpsGraphConvolutionEnvVariable_envVariable;
  mpsGraphConvolutionEnvVariable_envVariable = v1;

}

+ (BOOL)gpuUseMPSGraphConvolution
{
  if (gpuUseMPSGraphConvolution_onceToken != -1)
    dispatch_once(&gpuUseMPSGraphConvolution_onceToken, &__block_literal_global_26);
  return gpuUseMPSGraphConvolution_useMPSGraphConvolution;
}

void __44__MLCPlatformInfo_gpuUseMPSGraphConvolution__block_invoke()
{
  void *v0;

  +[MLCPlatformInfo mpsGraphConvolutionEnvVariable](MLCPlatformInfo, "mpsGraphConvolutionEnvVariable");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  gpuUseMPSGraphConvolution_useMPSGraphConvolution = v0 != 0;

}

+ (id)seedEnvVariable
{
  if (seedEnvVariable_onceToken != -1)
    dispatch_once(&seedEnvVariable_onceToken, &__block_literal_global_28);
  return (id)seedEnvVariable_envVariable;
}

void __34__MLCPlatformInfo_seedEnvVariable__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("MLC_USE_RNG_SEED"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)seedEnvVariable_envVariable;
  seedEnvVariable_envVariable = v1;

}

+ (BOOL)isRNGSeeded
{
  if (isRNGSeeded_onceToken != -1)
    dispatch_once(&isRNGSeeded_onceToken, &__block_literal_global_31);
  return isSeeded;
}

void __30__MLCPlatformInfo_isRNGSeeded__block_invoke()
{
  void *v0;

  if (isSeeded)
  {
    isSeeded = 1;
  }
  else
  {
    +[MLCPlatformInfo seedEnvVariable](MLCPlatformInfo, "seedEnvVariable");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    isSeeded = v0 != 0;

  }
}

+ (int64_t)randomSeed
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__MLCPlatformInfo_randomSeed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (randomSeed_onceToken != -1)
    dispatch_once(&randomSeed_onceToken, block);
  return randomSeed;
}

void __29__MLCPlatformInfo_randomSeed__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[MLCPlatformInfo seedEnvVariable](MLCPlatformInfo, "seedEnvVariable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  randomSeed = objc_msgSend(v3, "longValue");

  +[MLCLog framework](MLCLog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2048;
    v9 = randomSeed;
    _os_log_impl(&dword_1D4999000, v4, OS_LOG_TYPE_INFO, "%@: Random seed requested. Found seed: %ld", (uint8_t *)&v6, 0x16u);

  }
}

+ (void)setRandomSeedTo:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MLCPlatformInfo_setRandomSeedTo___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (setRandomSeedTo__onceToken != -1)
    dispatch_once(&setRandomSeedTo__onceToken, block);
  v6 = a1;
  objc_sync_enter(v6);
  if (objc_msgSend(v6, "isRNGSeeded"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      v12 = 2048;
      v13 = randomSeed;
      _os_log_impl(&dword_1D4999000, v7, OS_LOG_TYPE_INFO, "%@: Overwriting the random seed number which has already been set to : %ld", buf, 0x16u);

    }
  }
  isSeeded = 1;
  randomSeed = objc_msgSend(v5, "longValue");
  objc_sync_exit(v6);

}

uint64_t __35__MLCPlatformInfo_setRandomSeedTo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "randomSeed");
}

+ (id)getRandomSeed
{
  id v2;
  void *v3;

  v2 = a1;
  objc_sync_enter(v2);
  if (objc_msgSend(v2, "isRNGSeeded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v2, "randomSeed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

+ (int)getMinGpuSocVersionForMicroBenchmark
{
  return 13;
}

+ (id)aneSubType
{
  if (aneSubType_onceToken != -1)
    dispatch_once(&aneSubType_onceToken, &__block_literal_global_34);
  return (id)aneSubType_aneSubType;
}

void __29__MLCPlatformInfo_aneSubType__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (AppleNeuralEngineLibrary_onceToken_0 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_0, &__block_literal_global_77);
  if (AppleNeuralEngineLibrary_frameworkLibrary_0 && softLinkClass_ANEDeviceInfo())
  {
    objc_msgSend(softLinkClass_ANEDeviceInfo(), "aneSubType");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)aneSubType_aneSubType;
  aneSubType_aneSubType = v0;

}

+ (int)aneSubTypeVersion
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  size_t v8;
  id v9;

  objc_msgSend(a1, "aneSubType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capitalizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("H"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[MLCLog framework](MLCLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[MLCPlatformInfo aneSubTypeVersion].cold.1(a2, (uint64_t)v4, v6);

    v7 = 0;
  }
  else
  {
    v8 = strlen((const char *)objc_msgSend(CFSTR("H"), "fileSystemRepresentation")) + v5;
    objc_msgSend(v4, "substringWithRange:", v8, objc_msgSend(v4, "length") - v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = atoi((const char *)objc_msgSend(v9, "fileSystemRepresentation"));

  }
  return v7;
}

+ (BOOL)isAneSubTypeVersionGreaterThanOrEqualTo:(unint64_t)a3
{
  return (int)objc_msgSend(a1, "aneSubTypeVersion") >= (int)a3;
}

+ (id)aneKeepPlistEnvVariable
{
  if (aneKeepPlistEnvVariable_onceToken != -1)
    dispatch_once(&aneKeepPlistEnvVariable_onceToken, &__block_literal_global_37);
  return (id)aneKeepPlistEnvVariable_envVariable;
}

void __42__MLCPlatformInfo_aneKeepPlistEnvVariable__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("MLC_ANE_KEEP_PLIST"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)aneKeepPlistEnvVariable_envVariable;
  aneKeepPlistEnvVariable_envVariable = v1;

}

+ (BOOL)isAnePlistKept
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MLCPlatformInfo_isAnePlistKept__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isAnePlistKept_onceToken != -1)
    dispatch_once(&isAnePlistKept_onceToken, block);
  return isAnePlistKept_isEnvVariableSet;
}

void __33__MLCPlatformInfo_isAnePlistKept__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "aneKeepPlistEnvVariable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  isAnePlistKept_isEnvVariableSet = v1 != 0;

}

+ (id)aneGraphPartitioningConfigEnvVariable
{
  if (aneGraphPartitioningConfigEnvVariable_onceToken != -1)
    dispatch_once(&aneGraphPartitioningConfigEnvVariable_onceToken, &__block_literal_global_40);
  return (id)aneGraphPartitioningConfigEnvVariable_envVariable;
}

void __56__MLCPlatformInfo_aneGraphPartitioningConfigEnvVariable__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("MLC_ANE_GRAPH_PARTITIONING_CONFIG"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)aneGraphPartitioningConfigEnvVariable_envVariable;
  aneGraphPartitioningConfigEnvVariable_envVariable = v1;

}

+ (BOOL)isAneGraphPartitioningConfigSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MLCPlatformInfo_isAneGraphPartitioningConfigSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isAneGraphPartitioningConfigSet_onceToken != -1)
    dispatch_once(&isAneGraphPartitioningConfigSet_onceToken, block);
  return isAneGraphPartitioningConfigSet_isEnvVariableSet;
}

void __50__MLCPlatformInfo_isAneGraphPartitioningConfigSet__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "aneGraphPartitioningConfigEnvVariable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  isAneGraphPartitioningConfigSet_isEnvVariableSet = v1 != 0;

}

+ (id)aneSaveGraphPartitioningConfig
{
  if (aneSaveGraphPartitioningConfig_onceToken != -1)
    dispatch_once(&aneSaveGraphPartitioningConfig_onceToken, &__block_literal_global_43);
  return (id)aneSaveGraphPartitioningConfig_envVariable;
}

void __49__MLCPlatformInfo_aneSaveGraphPartitioningConfig__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("MLC_ANE_SAVE_GRAPH_PARTITIONING_CONFIG"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)aneSaveGraphPartitioningConfig_envVariable;
  aneSaveGraphPartitioningConfig_envVariable = v1;

}

+ (BOOL)isAneSaveGraphPartitioningConfigSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MLCPlatformInfo_isAneSaveGraphPartitioningConfigSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isAneSaveGraphPartitioningConfigSet_onceToken != -1)
    dispatch_once(&isAneSaveGraphPartitioningConfigSet_onceToken, block);
  return isAneSaveGraphPartitioningConfigSet_isEnvVariableSet;
}

void __54__MLCPlatformInfo_isAneSaveGraphPartitioningConfigSet__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "aneSaveGraphPartitioningConfig");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  isAneSaveGraphPartitioningConfigSet_isEnvVariableSet = v1 != 0;

}

+ (void)aneSubTypeVersion
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v5;
  v8 = 2112;
  v9 = CFSTR("H");
  v10 = 2112;
  v11 = a2;
  _os_log_debug_impl(&dword_1D4999000, a3, OS_LOG_TYPE_DEBUG, "%@: substring %@ is not found in ANE subtype=%@", (uint8_t *)&v6, 0x20u);

}

@end
