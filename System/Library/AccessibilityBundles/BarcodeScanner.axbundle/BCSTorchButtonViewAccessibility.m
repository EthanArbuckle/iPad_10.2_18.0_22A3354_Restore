@implementation BCSTorchButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BCSTorchButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("BCSTorchButtonView"), CFSTR("_torchButton"), "UIButton");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("torch.button"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BCSTorchButtonViewAccessibility;
  v3 = -[BCSTorchButtonViewAccessibility accessibilityTraits](&v12, sel_accessibilityTraits);
  v4 = *MEMORY[0x24BEBB1A8];
  objc_opt_class();
  -[BCSTorchButtonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_torchButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (v4 | v3 | *MEMORY[0x24BDF73B0]) & ~*MEMORY[0x24BDF7400];
  v8 = objc_msgSend(v6, "isEnabled");
  v9 = *MEMORY[0x24BDF73E8];
  if (v8)
    v9 = 0;
  v10 = v9 | v7;

  return v10;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  objc_opt_class();
  -[BCSTorchButtonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_torchButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isSelected"))
    v5 = CFSTR("1");
  else
    v5 = CFSTR("0");
  v6 = v5;

  return v6;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("torch.hint"));
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  return 1;
}

@end
