@implementation GDOSVariant

+ (BOOL)isInternalDevice
{
  return os_variant_allows_internal_security_policies();
}

@end
