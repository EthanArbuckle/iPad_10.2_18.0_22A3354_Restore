@implementation BLSDisableAlwaysOnSwipeThroughAttribute

+ (id)disableSwipeThrough
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, 0x1E621D278, a4);
}

@end
