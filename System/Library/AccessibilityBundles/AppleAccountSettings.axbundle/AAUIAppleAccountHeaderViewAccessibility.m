@implementation AAUIAppleAccountHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AAUIAppleAccountHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AAUIAppleAccountHeaderView"), CFSTR("initWithLabelInsets:"), "@", "{UIEdgeInsets=dddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AAUIAppleAccountHeaderView"), CFSTR("imageControl"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAUIAppleAccountHeaderViewAccessibility;
  -[AAUIAppleAccountHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[AAUIAppleAccountHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("AccountImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityValue:", v7);

  objc_msgSend(v3, "setAccessibilityRespondsToUserInteraction:", 1);
}

- (AAUIAppleAccountHeaderViewAccessibility)initWithLabelInsets:(UIEdgeInsets)a3
{
  AAUIAppleAccountHeaderViewAccessibility *v3;
  AAUIAppleAccountHeaderViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIAppleAccountHeaderViewAccessibility;
  v3 = -[AAUIAppleAccountHeaderViewAccessibility initWithLabelInsets:](&v6, sel_initWithLabelInsets_, a3.top, a3.left, a3.bottom, a3.right);
  v4 = v3;
  if (v3)
    -[AAUIAppleAccountHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

@end
