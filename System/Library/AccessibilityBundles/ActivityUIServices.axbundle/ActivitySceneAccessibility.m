@implementation ActivitySceneAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ActivityUIServices.ActivityScene");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsSecure
{
  return 1;
}

@end
