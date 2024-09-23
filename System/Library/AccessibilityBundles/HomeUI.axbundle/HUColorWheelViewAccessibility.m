@implementation HUColorWheelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUColorWheelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("HUQuickControlMagnifierView"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A8];
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[HUColorWheelViewAccessibility superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axFilterObjectsUsingBlock:", &__block_literal_global_4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "accessibilityActivationPoint");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

uint64_t __61__HUColorWheelViewAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234911848](CFSTR("HUQuickControlMagnifierView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  return accessibilityHomeUILocalizedString(CFSTR("controls.color.picker.label"));
}

- (id)accessibilityHint
{
  return accessibilityHomeUILocalizedString(CFSTR("controls.color.picker.hint"));
}

@end
