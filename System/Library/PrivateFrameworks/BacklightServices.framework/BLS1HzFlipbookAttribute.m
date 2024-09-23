@implementation BLS1HzFlipbookAttribute

+ (id)set1HzFlipbookForFBSScene:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFBSScene:", v4);

  return v5;
}

+ (id)set1HzFlipbooForFBSSceneIdentityToken:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSceneIdentityToken:", v4);

  return v5;
}

+ (id)set1HzFlipbook
{
  return objc_alloc_init(BLSGlobal1HzFlipbookAttribute);
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, 0x1E621D158, a4);
}

@end
