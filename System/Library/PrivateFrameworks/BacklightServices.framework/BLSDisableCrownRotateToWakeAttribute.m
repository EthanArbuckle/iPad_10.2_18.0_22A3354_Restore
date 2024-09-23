@implementation BLSDisableCrownRotateToWakeAttribute

+ (id)disableCrownRotateToWake
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, CFSTR("com.apple.backlight.disable_crown_rotate_to_wake_assertion"), a4);
}

@end
