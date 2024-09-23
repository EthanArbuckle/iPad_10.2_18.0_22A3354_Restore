@implementation C2DeviceInfo

+ (id)testName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "c2DefaultsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("C2MetricsTestName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)productVersion
{
  return _CKGetCachedGestaltValue(CFSTR("ProductVersion"));
}

+ (id)productType
{
  return _CKGetCachedGestaltValue(CFSTR("ProductType"));
}

+ (id)productName
{
  return _CKGetCachedGestaltValue(CFSTR("ProductName"));
}

+ (id)processVersion
{
  void *v2;
  void *v3;

  processInfoDict();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)processUUID
{
  if (C2MetricProcessUUID_onceToken != -1)
    dispatch_once(&C2MetricProcessUUID_onceToken, &__block_literal_global_15_1);
  return (id)C2MetricProcessUUID_processUUIDString;
}

+ (id)processName
{
  void *v2;
  void *v3;

  processInfoDict();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isAppleInternal
{
  return os_variant_has_internal_content();
}

+ (id)buildVersion
{
  return _CKGetCachedGestaltValue(CFSTR("BuildVersion"));
}

+ (BOOL)whitelistedForDisableAPWakeOnIdleConnections
{
  void *v2;
  char v3;

  if (entitlementsDict_onceToken != -1)
    dispatch_once(&entitlementsDict_onceToken, &__block_literal_global_23_0);
  objc_msgSend((id)entitlementsDict_entitlementsDict, "objectForKeyedSubscript:", CFSTR("application-identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isEqual:", CFSTR("com.apple.cloudd"));
  else
    v3 = 0;

  return v3;
}

@end
