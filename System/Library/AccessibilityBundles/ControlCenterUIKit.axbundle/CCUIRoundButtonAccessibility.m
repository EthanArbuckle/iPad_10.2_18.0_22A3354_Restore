@implementation CCUIRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIRoundButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CCUIRoundButton"), CFSTR("UIControl"));
}

- (BOOL)isAccessibilityElement
{
  double v2;

  -[CCUIRoundButtonAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("alpha"));
  return v2 > 0.1;
}

- (unint64_t)_accesibilityRawTraits
{
  void *v2;
  void *v3;
  unint64_t v4;
  int v5;
  uint64_t v6;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *MEMORY[0x24BDF73B0];
  if (v2)
  {
    v5 = objc_msgSend(v2, "isEnabled");
    v6 = *MEMORY[0x24BDF73E8];
    if (v5)
      v6 = 0;
    v4 |= v6;
    if (objc_msgSend(v3, "isSelected"))
      v4 |= *MEMORY[0x24BDF7400];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[CCUIRoundButtonAccessibility _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  else
    v5 = -[CCUIRoundButtonAccessibility _accesibilityRawTraits](self, "_accesibilityRawTraits");
  v6 = v5;

  return v6;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIRoundButtonAccessibility;
  -[CCUIRoundButtonAccessibility accessibilityCustomActions](&v5, sel_accessibilityCustomActions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXGuaranteedMutableArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();
  return v3;
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

@end
