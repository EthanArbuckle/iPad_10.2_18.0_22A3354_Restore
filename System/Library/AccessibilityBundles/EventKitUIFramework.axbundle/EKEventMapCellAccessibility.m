@implementation EKEventMapCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventMapCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("event.map"));
}

@end
