@implementation MICopyCurrentBuildVersion

void __MICopyCurrentBuildVersion_block_invoke()
{
  void *v0;
  id v1;
  id v2;
  void *v3;

  v0 = (void *)_CFCopySystemVersionDictionaryValue();
  objc_opt_class();
  v1 = v0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  v3 = (void *)MICopyCurrentBuildVersion_buildVersion;
  MICopyCurrentBuildVersion_buildVersion = (uint64_t)v2;

  if (!MICopyCurrentBuildVersion_buildVersion && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    MOLogWrite();
}

@end
