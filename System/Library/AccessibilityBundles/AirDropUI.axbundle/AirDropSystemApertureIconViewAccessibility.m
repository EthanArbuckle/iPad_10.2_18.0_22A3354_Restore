@implementation AirDropSystemApertureIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AirDropUI.AirDropSystemApertureIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end
