@implementation _UIBarCustomizationContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIBarCustomizationContainerView");
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
  objc_storeStrong(location, 0);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
