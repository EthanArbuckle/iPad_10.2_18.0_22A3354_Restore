@implementation _ANEStrings

+ (id)aggressivePowerSavingEntitlement
{
  return CFSTR("com.apple.aned.private.aggressivePowerSaving.allow");
}

+ (id)systemLibraryPath
{
  return CFSTR("/System/Library");
}

+ (id)noSandboxExtension
{
  return &stru_1E9516758;
}

+ (id)internalLibraryPath
{
  return CFSTR("/AppleInternal/Library");
}

+ (id)coreAnalyticsANEUsageKeyGroup
{
  return CFSTR("com.apple.ANEUsage");
}

+ (id)coreAnalyticsANEUsageDefaultReportedClient
{
  return CFSTR("ThirdPartyAppUsingANE");
}

+ (id)restrictedAccessEntitlement
{
  return CFSTR("com.apple.aned.private.allow");
}

+ (id)machServiceName
{
  return CFSTR("com.apple.appleneuralengine");
}

+ (id)userMachServiceName
{
  return CFSTR("com.apple.aneuserd");
}

+ (id)cacheDeleteServiceName
{
  return CFSTR("com.apple.aned.CacheDelete");
}

+ (id)aneuserdCacheDeleteServiceName
{
  return CFSTR("com.apple.aneuserd.CacheDelete");
}

+ (id)machServiceNamePrivate
{
  return CFSTR("com.apple.appleneuralengine.private");
}

+ (id)modelDataVaultDirectory
{
  return CFSTR("/var/mobile/Library/Caches/com.apple.aned");
}

+ (id)userModelDataVaultDirectory
{
  return CFSTR("/var/mobile/Library/Caches/com.apple.aned");
}

+ (id)buildSpecificModelDataVaultDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___ANEStrings_buildSpecificModelDataVaultDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buildSpecificModelDataVaultDirectory_onceToken != -1)
    dispatch_once(&buildSpecificModelDataVaultDirectory_onceToken, block);
  return (id)buildSpecificModelDataVaultDirectory__ANEBuildSpecificModelDataVaultDirectory;
}

+ (id)buildSpecificUserModelDataVaultDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___ANEStrings_buildSpecificUserModelDataVaultDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buildSpecificUserModelDataVaultDirectory_onceToken != -1)
    dispatch_once(&buildSpecificUserModelDataVaultDirectory_onceToken, block);
  return (id)buildSpecificUserModelDataVaultDirectory__ANEBuildSpecificUserModelDataVaultDirectory;
}

+ (id)inMemoryModelCacheName
{
  return CFSTR("InMemoryModelCache");
}

+ (id)modelAssetsCacheName
{
  return CFSTR("ModelAssetsCache");
}

+ (id)tempDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28___ANEStrings_tempDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tempDirectory_onceToken != -1)
    dispatch_once(&tempDirectory_onceToken, block);
  return (id)tempDirectory__ANETempDirectory;
}

+ (id)cloneDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29___ANEStrings_cloneDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cloneDirectory_onceToken != -1)
    dispatch_once(&cloneDirectory_onceToken, block);
  return (id)cloneDirectory__ANECloneDirectory;
}

+ (id)userTempDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32___ANEStrings_userTempDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userTempDirectory_onceToken != -1)
    dispatch_once(&userTempDirectory_onceToken, block);
  return (id)userTempDirectory__ANETempDirectory;
}

+ (id)userCloneDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33___ANEStrings_userCloneDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userCloneDirectory_onceToken != -1)
    dispatch_once(&userCloneDirectory_onceToken, block);
  return (id)userCloneDirectory__ANECloneDirectory;
}

+ (id)systemModelsCacheDirectory
{
  return CFSTR("com.apple.SHARED_SYSTEM_MODELS");
}

+ (id)errorDomainGeneric
{
  return CFSTR("com.apple.appleneuralengine");
}

+ (id)errorDomainCompiler
{
  return CFSTR("com.apple.appleneuralengine.compiler");
}

+ (id)errorDomainEspresso
{
  return CFSTR("com.apple.appleneuralengine.espresso");
}

+ (id)errorDomainVirtIO
{
  return CFSTR("com.apple.applevirtioneuralengine");
}

+ (id)compilerServiceAccessEntitlement
{
  return CFSTR("com.apple.ANECompilerService.allow");
}

+ (id)modelPurgeInAllPartitionsEntitlement
{
  return CFSTR("com.apple.private.modelPurgeInAllPartitions.allow");
}

+ (id)storageMaintainerAccessEntitlement
{
  return CFSTR("com.apple.private.ANEStorageMaintainer.allow");
}

+ (id)processModelShareAccessEntitlement
{
  return CFSTR("com.apple.aned.private.processModelShare.allow");
}

+ (id)secondaryANECompilerServiceAccessEntitlement
{
  return CFSTR("com.apple.aned.private.secondaryANECompilerServiceAccess.allow");
}

+ (id)adapterWeightsAccessEntitlement
{
  return CFSTR("com.apple.aned.private.adapterWeight.allow");
}

+ (id)adapterWeightsAccessEntitlementBypassBootArg
{
  return CFSTR("ane_skipAdapterWeightAccessCheck");
}

+ (id)modelBinaryName
{
  return CFSTR("model.hwx");
}

+ (id)modelSourceStoreName
{
  return CFSTR("model.src");
}

+ (id)modelCacheRetainName
{
  return CFSTR("model.retain");
}

+ (id)defaultCompilerOptionsFilename
{
  return CFSTR("net_options.plist");
}

+ (id)dataVaultStorageClass
{
  return CFSTR("ane_model_cache");
}

+ (id)defaultANECIRFileName
{
  return CFSTR("net.plist");
}

+ (id)defaultANECIROptionsFileName
{
  return CFSTR("compiler_options.plist");
}

+ (id)defaultMILFileName
{
  return CFSTR("model.mil");
}

+ (id)defaultWeightFileName
{
  return CFSTR("weight.bin");
}

+ (id)launchIOKitEvent
{
  return CFSTR("com.apple.aned.launch");
}

+ (id)launchUserIOKitEvent
{
  return CFSTR("com.apple.aneuserd.launch");
}

+ (id)ppsSubsystemForANE
{
  return CFSTR("ANE");
}

+ (id)ppsCategoryForANE
{
  return &unk_1E951E760;
}

+ (id)pps_defaultUserPathPrefix
{
  return CFSTR("/Users");
}

+ (id)pps_frameworkDir
{
  return CFSTR("/Frameworks");
}

+ (id)pps_privateFrameworkDir
{
  return CFSTR("/PrivateFrameworks");
}

+ (id)pps_varDir
{
  return CFSTR("/var");
}

+ (id)pps_tmpDir
{
  return CFSTR("/tmp");
}

+ (id)pps_internalDir
{
  return CFSTR("/AppleInternal");
}

+ (id)pps_applicationDir
{
  return CFSTR("/Applications");
}

+ (id)pps_catalogDir
{
  return CFSTR("/var/MobileAsset/AssetV2");
}

+ (id)pps_defaultSystemPathDir
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[11];

  v17[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "testing_inputDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "testing_modelDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v16;
  objc_msgSend(a1, "systemLibraryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  objc_msgSend(a1, "internalLibraryPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v6;
  objc_msgSend(a1, "pps_frameworkDir");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  objc_msgSend(a1, "pps_privateFrameworkDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v8;
  objc_msgSend(a1, "pps_varDir");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v9;
  objc_msgSend(a1, "pps_tmpDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v10;
  objc_msgSend(a1, "pps_internalDir");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v11;
  objc_msgSend(a1, "pps_applicationDir");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v12;
  objc_msgSend(a1, "pps_catalogDir");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)vm_tmpBaseDirectory
{
  return CFSTR("/var/tmp/com.apple.ane/");
}

+ (id)vm_forceValidationOnGuestBootArg
{
  return CFSTR("ane_vm_forceValidationOnGuest");
}

+ (id)testing_cacheDirectory
{
  return CFSTR("/var/tmp/com.apple.aned/Cache/");
}

+ (id)testing_cacheDirectoryWithSuffix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "testing_cacheDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@/"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)testing_cacheDirectoryWithSuffix:(id)a3 buildVersion:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "testing_cacheDirectoryWithSuffix:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)testing_tempDirectory:(id)a3
{
  return (id)objc_msgSend(CFSTR("/var/tmp/com.apple.aned/UnitTesting"), "stringByAppendingPathComponent:", a3);
}

+ (id)testing_cloneDirectory:(id)a3
{
  return (id)objc_msgSend(CFSTR("/var/tmp/com.apple.aned/UnitTestingClones"), "stringByAppendingPathComponent:", a3);
}

+ (id)testing_userCacheDirectory
{
  return CFSTR("/var/tmp/com.apple.aneuserd/Cache/");
}

+ (id)testing_userCacheDirectoryWithSuffix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "testing_userCacheDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@/"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)testing_userCacheDirectoryWithSuffix:(id)a3 buildVersion:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "testing_userCacheDirectoryWithSuffix:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)testing_userTempDirectory:(id)a3
{
  return (id)objc_msgSend(CFSTR("/var/tmp/com.apple.aneuserd/UnitTesting"), "stringByAppendingPathComponent:", a3);
}

+ (id)testing_userCloneDirectory:(id)a3
{
  return (id)objc_msgSend(CFSTR("/var/tmp/com.apple.aneuserd/UnitTestingClones"), "stringByAppendingPathComponent:", a3);
}

+ (id)testing_inputDirectory
{
  return CFSTR("/AppleInternal/Tests/AppleNeuralEngine/AppleNeuralEngine_tests.xctest");
}

+ (id)testing_modelDirectory
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  __CFString *v7;
  char v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(a1, "testing_inputDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Contents/Resources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v5, &v9))
    v6 = v9 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = CFSTR("TestModels");
  }
  else
  {
    objc_msgSend(CFSTR("Contents/Resources"), "stringByAppendingPathComponent:", CFSTR("TestModels"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)testing_modelDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "testing_modelDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)testing_zeroModelName
{
  if (testing_zeroModelName_onceToken != -1)
    dispatch_once(&testing_zeroModelName_onceToken, &__block_literal_global_2);
  return (id)testing_zeroModelName__ANETestZeroModelName;
}

+ (id)testing_ThreeSixtyModelName
{
  if (testing_ThreeSixtyModelName_onceToken != -1)
    dispatch_once(&testing_ThreeSixtyModelName_onceToken, &__block_literal_global_141);
  return (id)testing_ThreeSixtyModelName__ANETestThreeSixtyModelName;
}

+ (id)testing_modelNames
{
  if (testing_modelNames_onceToken != -1)
    dispatch_once(&testing_modelNames_onceToken, &__block_literal_global_144);
  return (id)testing_modelNames__ANETestModelNames;
}

+ (id)testing_encryptedModelNames
{
  if (testing_encryptedModelNames_onceToken != -1)
    dispatch_once(&testing_encryptedModelNames_onceToken, &__block_literal_global_151);
  return (id)testing_encryptedModelNames__ANETestEncryptedModelNames;
}

+ (id)testing_dataVaultStorageClass
{
  return CFSTR("testing_ane_model_cache");
}

+ (id)testing_external_modelPath
{
  return CFSTR("/System/Library/Frameworks/Vision.framework/bodynet_v1.0.espresso.net");
}

+ (id)testing_external_precompiledModelPath
{
  if (testing_external_precompiledModelPath_onceToken != -1)
    dispatch_once(&testing_external_precompiledModelPath_onceToken, &__block_literal_global_160);
  return (id)testing_external_precompiledModelPath__ANEExternalPrecompiledModelPath;
}

+ (BOOL)trimmedModelPath:(id)a3 trimmedPath:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = v6;
  v8 = v6 == 0;
  if (v6
    && (objc_msgSend(v6, "path"),
        v9 = (id)objc_claimAutoreleasedReturnValue(),
        *a4 = v9,
        objc_msgSend(a1, "pps_defaultUserPathPrefix"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v9) = objc_msgSend(v9, "hasPrefix:", v10),
        v10,
        (v9 & 1) == 0))
  {
    v11 = *a4;
    objc_msgSend(a1, "pps_applicationDir");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v11, "hasPrefix:", v12);

    v8 = v11 ^ 1;
    if (+[_ANEDeviceInfo isInternalBuild](_ANEDeviceInfo, "isInternalBuild"))
    {
      v13 = *a4;
      objc_msgSend(a1, "pps_defaultSystemPathDir");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", v15, CFSTR("0_"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1, "pps_defaultSystemPathDir");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    v18 = v17 - 1;
    if (v17 != 1)
    {
      do
      {
        v19 = *a4;
        objc_msgSend(a1, "pps_defaultSystemPathDir");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld_"), v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", v21, v22);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        --v18;
      }
      while (v18);
    }
  }
  else
  {
    *a4 = &stru_1E9516758;
  }

  return v8;
}

@end
