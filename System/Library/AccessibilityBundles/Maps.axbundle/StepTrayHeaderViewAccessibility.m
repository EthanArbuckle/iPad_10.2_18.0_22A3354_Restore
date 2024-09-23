@implementation StepTrayHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StepTrayHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("StepTrayHeaderView"), CFSTR("layoutProgress"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("StepTrayHeaderView"), CFSTR("_updateLayoutProgress"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("StepTrayHeaderView"), CFSTR("_chevronImageView"), "UIImageView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)StepTrayHeaderViewAccessibility;
  -[StepTrayHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[StepTrayHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_chevronImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "accessibilityTraits");
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDFEE60] | v5);
    objc_msgSend(v4, "setIsAccessibilityElement:", 1);
    AXMapKitLocString(CFSTR("BUTTON_EXPAND"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v6);

  }
}

- (void)_updateLayoutProgress
{
  void *v3;
  float v4;
  __CFString *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)StepTrayHeaderViewAccessibility;
  -[StepTrayHeaderViewAccessibility _updateLayoutProgress](&v7, sel__updateLayoutProgress);
  -[StepTrayHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_chevronImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[StepTrayHeaderViewAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("layoutProgress"));
    if (v4 < 1.0)
      v5 = CFSTR("BUTTON_EXPAND");
    else
      v5 = CFSTR("BUTTON_COLLAPSE");
    AXMapKitLocString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v6);

  }
}

@end
