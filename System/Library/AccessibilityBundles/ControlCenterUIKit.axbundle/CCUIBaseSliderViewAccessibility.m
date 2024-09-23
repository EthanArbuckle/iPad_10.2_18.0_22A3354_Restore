@implementation CCUIBaseSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIBaseSliderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CCUIBaseSliderView"), CFSTR("UIControl"));
}

- (id)_accessibilityAbsoluteValue
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[CCUIBaseSliderViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (BOOL)isAccessibilityElement
{
  double v2;

  -[CCUIBaseSliderViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("alpha"));
  return v2 > 0.1;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  int v7;
  uint64_t v8;

  -[CCUIBaseSliderViewAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *MEMORY[0x24BDF73A0] | v3;
  if (v4)
  {
    v7 = objc_msgSend(v4, "isEnabled");
    v8 = *MEMORY[0x24BDF73E8];
    if (v7)
      v8 = 0;
    v6 |= v8;
    if (objc_msgSend(v5, "isSelected"))
      v6 |= *MEMORY[0x24BDF7400];
  }

  return v6;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIBaseSliderViewAccessibility;
  -[CCUIBaseSliderViewAccessibility accessibilityCustomActions](&v5, sel_accessibilityCustomActions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXGuaranteedMutableArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();
  return v3;
}

@end
