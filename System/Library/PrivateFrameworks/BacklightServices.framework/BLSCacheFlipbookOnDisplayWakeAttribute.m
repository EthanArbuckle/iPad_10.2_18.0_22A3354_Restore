@implementation BLSCacheFlipbookOnDisplayWakeAttribute

+ (id)cacheFlipbookForFBSScene:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFBSScene:", v4);

  return v5;
}

+ (id)cacheFlipbookForFBSSceneIdentityToken:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSceneIdentityToken:", v4);

  return v5;
}

+ (id)cacheFlipbook
{
  return objc_alloc_init(BLSGlobalCacheFlipbookOnDisplayWakeAttribute);
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, 0x1E621D178, a4);
}

@end
