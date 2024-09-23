@implementation AEOSGestalt

- (BOOL)isInternalOS
{
  return os_variant_has_internal_ui();
}

@end
