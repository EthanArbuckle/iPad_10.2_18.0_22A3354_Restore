@implementation MapsAppAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MapsApp");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return AXMapsLocString(CFSTR("APPLICATION_NAME"));
}

@end
