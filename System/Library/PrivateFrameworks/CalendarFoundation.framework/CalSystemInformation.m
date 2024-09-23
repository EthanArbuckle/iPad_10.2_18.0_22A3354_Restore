@implementation CalSystemInformation

+ (id)systemBuildVersion
{
  if (systemBuildVersion_onceToken[0] != -1)
    dispatch_once(systemBuildVersion_onceToken, &__block_literal_global_38);
  return (id)systemBuildVersion_buildVersion;
}

void __42__CalSystemInformation_systemBuildVersion__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)_CFCopyServerVersionDictionary();
  if (!v0)
    v0 = (void *)_CFCopySystemVersionDictionary();
  v3 = v0;
  objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)systemBuildVersion_buildVersion;
  systemBuildVersion_buildVersion = v1;

}

+ (BOOL)isRunningAsSetupUser
{
  return 0;
}

@end
