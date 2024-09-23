@implementation SFTraitAlternateUserInterfaceStyle

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)CFSTR("alternateUserInterfaceStyle");
}

@end
