@implementation PKLinkedAppIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKLinkedAppIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKLinkedAppIconView"), CFSTR("_iconButton"), "WLEasyToHitCustomButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKLinkedAppIconView"), CFSTR("linkedApplication"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKLinkedAppIconView"), CFSTR("linkedApplicationDidChangeState:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKLinkedApplication"), CFSTR("displayName"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKLinkedAppIconViewAccessibility;
  -[PKLinkedAppIconViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[PKLinkedAppIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKLinkedAppIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("linkedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessibilityLabel:", v7);
  accessibilityLocalizedString(CFSTR("passbook.app.hint.open"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityHint:", v8);

}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[PKLinkedAppIconViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v5.receiver = self;
  v5.super_class = (Class)PKLinkedAppIconViewAccessibility;
  -[PKLinkedAppIconViewAccessibility linkedApplicationDidChangeState:](&v5, sel_linkedApplicationDidChangeState_, v4);

}

- (void)didMoveToWindow
{
  objc_super v3;

  -[PKLinkedAppIconViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v3.receiver = self;
  v3.super_class = (Class)PKLinkedAppIconViewAccessibility;
  -[PKLinkedAppIconViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
}

@end
