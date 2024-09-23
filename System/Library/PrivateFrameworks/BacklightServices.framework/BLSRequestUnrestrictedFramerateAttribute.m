@implementation BLSRequestUnrestrictedFramerateAttribute

+ (id)requestUnrestrictedFramerateForFBSScene:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFBSScene:", v4);

  return v5;
}

+ (id)requestUnrestrictedFramerateForFBSSceneIdentityToken:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSceneIdentityToken:", v4);

  return v5;
}

+ (id)requestUnrestrictedFramerate
{
  return objc_alloc_init(BLSRequestGlobalUnrestrictedFramerateAttribute);
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, 0x1E621D1B8, a4);
}

@end
