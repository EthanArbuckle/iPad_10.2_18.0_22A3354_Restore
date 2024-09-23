@implementation _UIKeyShortcutHUDCategoryHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyShortcutHUDCategoryHeaderCell");
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

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

- (id)accessibilityLabel
{
  return (id)UIAXStringForAllChildren();
}

@end
