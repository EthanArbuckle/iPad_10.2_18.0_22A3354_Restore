@implementation ICBehaviorTrait

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
  return (NSString *)CFSTR("Behavior");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.mobilenotes.behavior");
}

@end
