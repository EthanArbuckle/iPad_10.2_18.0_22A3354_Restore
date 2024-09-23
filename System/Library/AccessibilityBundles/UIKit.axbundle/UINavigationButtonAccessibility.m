@implementation UINavigationButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UINavigationButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UINavigationButton");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("style"), "i", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)additionsSelf
{
  objc_opt_class();
  return (id)__UIAccessibilityCastAsSafeCategory();
}

- (id)accessibilityLabel
{
  objc_super v3;
  int v4;
  id location;
  id v6;
  id v7[2];
  UINavigationButtonAccessibility *v8;
  id v9;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = -[UINavigationButtonAccessibility additionsSelf](self, "additionsSelf");
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](v7[0])
    || ((v6 = (id)-[UINavigationButtonAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("originatingButtonItem")), (location = (id)objc_msgSend(v7[0], "_accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:", v6)) == 0)? (v4 = 0): (v9 = location, v4 = 1), objc_storeStrong(&location, 0), objc_storeStrong(&v6, 0), !v4))
  {
    v3.receiver = v8;
    v3.super_class = (Class)UINavigationButtonAccessibility;
    v9 = -[UINavigationButtonAccessibility accessibilityLabel](&v3, sel_accessibilityLabel);
    v4 = 1;
  }
  objc_storeStrong(v7, 0);
  return v9;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  id v4;
  BOOL IsNavigation;
  objc_super v6;
  objc_super v7;
  SEL v8;
  UINavigationButtonAccessibility *v9;

  v9 = self;
  v8 = a2;
  v4 = -[UINavigationButtonAccessibility additionsSelf](self, "additionsSelf");
  IsNavigation = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](v4);

  if (IsNavigation)
  {
    v6.receiver = v9;
    v6.super_class = (Class)UINavigationButtonAccessibility;
    return -[UINavigationButtonAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  }
  else
  {
    v3 = *MEMORY[0x24BDF73B0];
    v7.receiver = v9;
    v7.super_class = (Class)UINavigationButtonAccessibility;
    return v3 | -[UINavigationButtonAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  }
}

- (BOOL)_accessibilityUserTestingIsCancelButton
{
  objc_super v3;
  char v4;
  SEL v5;
  UINavigationButtonAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UINavigationButtonAccessibility;
  v4 = -[UINavigationButtonAccessibility _accessibilityUserTestingIsCancelButton](&v3, sel__accessibilityUserTestingIsCancelButton);
  if (!v4)
    v4 = -[UINavigationButtonAccessibility safeIntForKey:](v6, "safeIntForKey:", CFSTR("style")) == 3;
  return v4 & 1;
}

@end
