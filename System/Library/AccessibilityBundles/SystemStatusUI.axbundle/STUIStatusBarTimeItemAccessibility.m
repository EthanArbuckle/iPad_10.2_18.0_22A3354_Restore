@implementation STUIStatusBarTimeItemAccessibility

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarTimeItemAccessibility;
  -[STUIStatusBarTimeItemAccessibility applyUpdate:toDisplayItem:](&v7, sel_applyUpdate_toDisplayItem_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarTimeItemAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarTimeItemAccessibility;
  -[STUIStatusBarTimeItemAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[STUIStatusBarTimeItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("timeView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AccessibilityStatusBarStringIsTime"));
  -[STUIStatusBarTimeItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("shortTimeView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AccessibilityStatusBarStringIsTime"));
  -[STUIStatusBarTimeItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("pillTimeView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AccessibilityStatusBarStringIsPillTime"));
  -[STUIStatusBarTimeItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("dateView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AccessibilityStatusBarStringIsDate"));

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarTimeItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarTimeItem"), CFSTR("applyUpdate:toDisplayItem:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarTimeItem"), CFSTR("timeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarTimeItem"), CFSTR("pillTimeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarTimeItem"), CFSTR("shortTimeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarTimeItem"), CFSTR("dateView"), "@", 0);

}

- (STUIStatusBarTimeItemAccessibility)init
{
  STUIStatusBarTimeItemAccessibility *v2;
  STUIStatusBarTimeItemAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarTimeItemAccessibility;
  v2 = -[STUIStatusBarTimeItemAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[STUIStatusBarTimeItemAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
