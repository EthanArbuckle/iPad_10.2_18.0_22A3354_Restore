@implementation SFTraitBarTintStyleTrait

+ (NSString)name
{
  return (NSString *)CFSTR("com.apple.mobilesafari.bar-tint-style");
}

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)affectsColorAppearance
{
  return 1;
}

@end
