@implementation AlertDeliveryTypeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AlertDeliveryTypeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return 0;
}

@end
