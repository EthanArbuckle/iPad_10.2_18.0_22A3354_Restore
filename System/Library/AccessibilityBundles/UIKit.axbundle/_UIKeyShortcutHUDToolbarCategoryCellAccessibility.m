@implementation _UIKeyShortcutHUDToolbarCategoryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyShortcutHUDToolbarCategoryCell");
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

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  _UIKeyShortcutHUDToolbarCategoryCellAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDToolbarCategoryCellAccessibility;
  return -[_UIKeyShortcutHUDToolbarCategoryCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0];
}

@end
