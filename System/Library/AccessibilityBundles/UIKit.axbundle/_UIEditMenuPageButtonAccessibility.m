@implementation _UIEditMenuPageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIEditMenuPageButton");
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIEditMenuPageButton"), CFSTR("UIButton"));
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityViewIsVisible
{
  double v2;
  BOOL v4;
  objc_super v5;
  id v6;
  id v7;
  char v8;
  SEL v9;
  _UIEditMenuPageButtonAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = 0;
  objc_opt_class();
  v7 = (id)__UIAccessibilityCastAsClass();
  v6 = v7;
  objc_storeStrong(&v7, 0);
  objc_msgSend(v6, "alpha");
  v4 = v2 == 1.0;

  if (!v4)
    return 0;
  v5.receiver = v10;
  v5.super_class = (Class)_UIEditMenuPageButtonAccessibility;
  return -[_UIEditMenuPageButtonAccessibility _accessibilityViewIsVisible](&v5, sel__accessibilityViewIsVisible);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
