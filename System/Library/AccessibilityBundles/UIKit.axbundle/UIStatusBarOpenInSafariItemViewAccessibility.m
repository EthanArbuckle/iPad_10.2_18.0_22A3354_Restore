@implementation UIStatusBarOpenInSafariItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarOpenInSafariItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIStatusBarOpenInSafariItemView"), CFSTR("destinationText"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[UIStatusBarOpenInSafariItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("destinationText"), a2, self);
}

- (id)accessibilityHint
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v5 = (id)accessibilityUIKitLocalizedString();
  v4 = (id)-[UIStatusBarOpenInSafariItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("destinationText"));
  v6 = (id)objc_msgSend(v3, "stringWithFormat:", v5, v4);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarOpenInSafariItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarOpenInSafariItemViewAccessibility;
  return -[UIStatusBarOpenInSafariItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0];
}

@end
