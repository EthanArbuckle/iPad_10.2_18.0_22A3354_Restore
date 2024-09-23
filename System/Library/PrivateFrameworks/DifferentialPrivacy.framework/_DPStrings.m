@implementation _DPStrings

+ (id)machServiceName
{
  return CFSTR("com.apple.dprivacyd");
}

+ (id)databaseDirectoryPath
{
  if (databaseDirectoryPath_onceToken != -1)
    dispatch_once(&databaseDirectoryPath_onceToken, &__block_literal_global_6);
  return (id)databaseDirectoryPath__DPDatabaseDirectoryPath;
}

+ (id)reportsDirectoryPath
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34___DPStrings_reportsDirectoryPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reportsDirectoryPath_onceToken != -1)
    dispatch_once(&reportsDirectoryPath_onceToken, block);
  return (id)reportsDirectoryPath__DPReportsDirectoryPath;
}

+ (id)transparencyLogDirectoryPath
{
  if (transparencyLogDirectoryPath_onceToken != -1)
    dispatch_once(&transparencyLogDirectoryPath_onceToken, &__block_literal_global_8_0);
  return (id)transparencyLogDirectoryPath__DPTransparencyLogDirectoryPath;
}

+ (id)tokensDirectoryPath
{
  if (tokensDirectoryPath_onceToken != -1)
    dispatch_once(&tokensDirectoryPath_onceToken, &__block_literal_global_11);
  return (id)tokensDirectoryPath__DPDediscoTokensDirectoryPath;
}

+ (id)keyNamesPath
{
  if (keyNamesPath_onceToken != -1)
    dispatch_once(&keyNamesPath_onceToken, &__block_literal_global_16);
  return (id)keyNamesPath__DPKeyNamesPlist;
}

+ (id)keyPropertiesPath
{
  if (keyPropertiesPath_onceToken != -1)
    dispatch_once(&keyPropertiesPath_onceToken, &__block_literal_global_19);
  return (id)keyPropertiesPath__DPKeyPropertiesPlist;
}

+ (id)budgetPropertiesPath
{
  if (budgetPropertiesPath_onceToken != -1)
    dispatch_once(&budgetPropertiesPath_onceToken, &__block_literal_global_22);
  return (id)budgetPropertiesPath__DPBudgetPropertiesPlist;
}

+ (id)algorithmParametersPath
{
  if (algorithmParametersPath_onceToken != -1)
    dispatch_once(&algorithmParametersPath_onceToken, &__block_literal_global_25);
  return (id)algorithmParametersPath__DPAlgorithmParametersPlist;
}

+ (id)namespaceParametersPath
{
  if (namespaceParametersPath_onceToken != -1)
    dispatch_once(&namespaceParametersPath_onceToken, &__block_literal_global_28);
  return (id)namespaceParametersPath__DPNamespaceParametersPlist;
}

+ (id)dataTypeParametersPath
{
  if (dataTypeParametersPath_onceToken != -1)
    dispatch_once(&dataTypeParametersPath_onceToken, &__block_literal_global_31);
  return (id)dataTypeParametersPath__DPDataTypeParametersPlist;
}

+ (id)defaultBudgetKey
{
  return CFSTR("com.apple.DifferentialPrivacy.default");
}

+ (id)errorDomain
{
  return CFSTR("com.apple.DifferentialPrivacy");
}

+ (id)ipsDirectoryPath
{
  return CFSTR("/var/mobile/Library/Logs/CrashReporter");
}

+ (id)systemBlacklistDirectoryPath
{
  return CFSTR("/System/Library/DifferentialPrivacy/Configuration/Blacklists/");
}

+ (id)runtimeBlacklistDirectoryPath
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___DPStrings_runtimeBlacklistDirectoryPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (runtimeBlacklistDirectoryPath_onceToken != -1)
    dispatch_once(&runtimeBlacklistDirectoryPath_onceToken, block);
  return (id)runtimeBlacklistDirectoryPath__DPBlacklistRuntimeDirectoryPath;
}

+ (id)bitValueMapDirectoryPath
{
  return CFSTR("/System/Library/DifferentialPrivacy/Configuration/BitValueMaps/");
}

+ (id)submissionServiceAccessEntitlement
{
  return CFSTR("com.apple.DPSubmissionService.allow");
}

+ (id)unitTestOutputDirectoryPath
{
  return CFSTR("/tmp/");
}

+ (id)unitTestDatabaseDirectoryPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "unitTestOutputDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)unitTestReportsDirectoryPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "unitTestDatabaseDirectoryPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, CFSTR("Reports"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)unitTestSystemBlacklistDirectoryPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "unitTestOutputDirectoryPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/SystemBlacklist/%@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)unitTestRuntimeBlacklistDirectoryPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "unitTestOutputDirectoryPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/RuntimeBlacklist/%@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)unitTestBitValueMapDirectoryPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "unitTestOutputDirectoryPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/BitValueMaps/%@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)dataValueStorageClass
{
  return CFSTR("dprivacyd_storage");
}

+ (id)submissionServiceDomainName
{
  return CFSTR("com.apple.DPSubmissionService");
}

+ (id)tokenRefreshHoursKeyName
{
  return CFSTR("tokenRefreshHours");
}

@end
