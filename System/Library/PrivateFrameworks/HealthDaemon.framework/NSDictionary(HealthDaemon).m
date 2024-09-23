@implementation NSDictionary(HealthDaemon)

- (uint64_t)hd_validateMetadataKeysAndValuesWithClient:()HealthDaemon error:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  objc_msgSend(v6, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrivateMetadataAccess");

  objc_msgSend(v6, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "applicationSDKVersionToken");
  return objc_msgSend(a1, "hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:", v8, v10, a4);
}

@end
