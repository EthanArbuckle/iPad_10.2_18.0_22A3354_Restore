@implementation MKInternal

+ (BOOL)isInternal
{
  objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String");
  return os_variant_has_internal_ui();
}

@end
