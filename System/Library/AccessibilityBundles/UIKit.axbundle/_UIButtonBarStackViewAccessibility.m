@implementation _UIButtonBarStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIButtonBarStackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIButtonBarStackView"), CFSTR("UIStackView"));
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

@end
