@implementation UIKeyboardDockItemButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardDockItemButton");
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
  unint64_t v4;
  SEL v5;
  UIKeyboardDockItemButtonAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardDockItemButtonAccessibility;
  v4 = -[UIKeyboardDockItemButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
  v4 |= *MEMORY[0x24BDFEE60];
  return v4 | *MEMORY[0x24BDFEEE0];
}

@end
