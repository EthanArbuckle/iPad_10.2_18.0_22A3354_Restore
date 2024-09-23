@implementation MUPlatterViewAvailabilityTrait

+ (int64_t)defaultValue
{
  return 0;
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.MapsUI.MUPlatterViewAvailability");
}

+ (NSString)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
