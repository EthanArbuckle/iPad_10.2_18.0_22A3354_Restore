@implementation TrackingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TrackingButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return 0;
}

@end
