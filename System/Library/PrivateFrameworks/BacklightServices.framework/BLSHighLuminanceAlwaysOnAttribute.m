@implementation BLSHighLuminanceAlwaysOnAttribute

+ (id)highLuminanceWhileInAlwaysOnForFBSScene:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFBSScene:", v4);

  return v5;
}

+ (id)highLuminanceWhileInAlwaysOnForFBSSceneIdentityToken:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSceneIdentityToken:", v4);

  return v5;
}

+ (id)highLuminanceWhileInAlwaysOn
{
  return objc_alloc_init(BLSGlobalHighLuminanceAlwaysOnAttribute);
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, 0x1E621D138, a4);
}

@end
