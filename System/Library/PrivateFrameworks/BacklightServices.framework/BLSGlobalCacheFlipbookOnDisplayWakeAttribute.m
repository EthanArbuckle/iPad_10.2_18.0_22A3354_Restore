@implementation BLSGlobalCacheFlipbookOnDisplayWakeAttribute

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, 0x1E621D178, a4);
}

@end
