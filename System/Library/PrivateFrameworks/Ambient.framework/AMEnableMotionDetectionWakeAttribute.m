@implementation AMEnableMotionDetectionWakeAttribute

+ (id)enableMotionDetectionWake
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, CFSTR("com.apple.ambient.attribute.motion-detection-wake"), a4);
}

@end
