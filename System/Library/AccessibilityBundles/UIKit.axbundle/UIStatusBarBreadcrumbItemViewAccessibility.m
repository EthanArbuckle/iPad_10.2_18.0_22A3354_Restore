@implementation UIStatusBarBreadcrumbItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarBreadcrumbItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UIStatusBarSystemNavigationItemView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = CFSTR("UIStatusBarBreadcrumbItemView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v3, v4);
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11[2];
  UIStatusBarBreadcrumbItemViewAccessibility *v12;

  v12 = self;
  v11[1] = (id)a2;
  v10 = 0;
  objc_opt_class();
  v7 = (id)-[UIStatusBarBreadcrumbItemViewAccessibility safeValueForKey:](v12, "safeValueForKey:", CFSTR("button"));
  v9 = (id)__UIAccessibilityCastAsClass();

  v8 = v9;
  objc_storeStrong(&v9, 0);
  v11[0] = v8;
  v3 = (void *)MEMORY[0x24BDD17C8];
  v5 = accessibilityLocalizedString(CFSTR("breadcrumb.return.to.app"));
  v4 = (id)objc_msgSend(v11[0], "accessibilityLabel");
  v6 = (id)objc_msgSend(v3, "stringWithFormat:", v5, v4);

  objc_storeStrong(v11, 0);
  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB180];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end
