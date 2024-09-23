@implementation MXUtilities

+ (id)containerPath
{
  if (containerPath_onceToken != -1)
    dispatch_once(&containerPath_onceToken, &__block_literal_global);
  return (id)objc_msgSend((id)containerPath_systemContainerUrl, "path");
}

void __28__MXUtilities_containerPath__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = container_system_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    NSLog(CFSTR("System container path is %s"), v0);
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v1, 1, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)containerPath_systemContainerUrl;
    containerPath_systemContainerUrl = v2;

    free(v1);
  }
  else
  {
    NSLog(CFSTR("Error getting system container: %llu"), 1);
  }
}

+ (id)getServicesAllowlist
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__MXUtilities_getServicesAllowlist__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getServicesAllowlist_once_token != -1)
    dispatch_once(&getServicesAllowlist_once_token, block);
  return (id)getServicesAllowlist_d;
}

void __35__MXUtilities_getServicesAllowlist__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("services-privacy-allowdeny"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)getServicesAllowlist_d;
  getServicesAllowlist_d = v1;

}

+ (BOOL)verifySDKVersionForClient:(id)a3
{
  return 1;
}

+ (BOOL)isAppAnalyticsEnabled
{
  if (isAppAnalyticsEnabled_onceToken != -1)
    dispatch_once(&isAppAnalyticsEnabled_onceToken, &__block_literal_global_10);
  return isAppAnalyticsEnabled_appAnalyticsEnabled;
}

uint64_t __36__MXUtilities_isAppAnalyticsEnabled__block_invoke()
{
  uint64_t result;

  result = AppAnalyticsEnabled();
  isAppAnalyticsEnabled_appAnalyticsEnabled = result;
  return result;
}

+ (BOOL)isAppInstalledForBundleID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x24BDC1540];
  v4 = a3;
  v9 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v9);

  v6 = 0;
  if (!v9)
  {
    objc_msgSend(v5, "applicationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isInstalled");

  }
  return v6;
}

+ (id)osVersion
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)_CFCopySupplementalVersionDictionary();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProductName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProductVersion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProductBuildVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ (%@)"), v4, v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)regionFormat
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v15)
        +[MXUtilities regionFormat].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
      v6 = CFSTR("N/A");
    }

  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v7)
      +[MXUtilities regionFormat].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v6 = CFSTR("N/A");
  }

  return v6;
}

+ (id)modelIdentifier
{
  if (modelIdentifier_onceToken != -1)
    dispatch_once(&modelIdentifier_onceToken, &__block_literal_global_24);
  return (id)modelIdentifier_modelIdentifier;
}

void __30__MXUtilities_modelIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  size_t v2;
  _OWORD v3[4];
  int v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v4 = 0x100000006;
  memset(v3, 0, sizeof(v3));
  v2 = 64;
  sysctl(v4, 2u, v3, &v2, 0, 0);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v3, 1);
  v1 = (void *)modelIdentifier_modelIdentifier;
  modelIdentifier_modelIdentifier = v0;

}

+ (id)platformArchitecture
{
  if (platformArchitecture_onceToken != -1)
    dispatch_once(&platformArchitecture_onceToken, &__block_literal_global_25);
  return (id)platformArchitecture_architecture;
}

void __35__MXUtilities_platformArchitecture__block_invoke()
{
  uint64_t FamilyName;
  uint64_t v1;
  void *v2;

  if (!platformArchitecture_architecture)
  {
    MEMORY[0x22E2D8EBC]();
    FamilyName = CSArchitectureGetFamilyName();
    if (FamilyName)
    {
      v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", FamilyName);
      v2 = (void *)platformArchitecture_architecture;
      platformArchitecture_architecture = v1;

    }
  }
}

+ (void)regionFormat
{
  OUTLINED_FUNCTION_0(&dword_229EEF000, MEMORY[0x24BDACB70], a3, "Invalid Country Code", a5, a6, a7, a8, 0);
}

@end
