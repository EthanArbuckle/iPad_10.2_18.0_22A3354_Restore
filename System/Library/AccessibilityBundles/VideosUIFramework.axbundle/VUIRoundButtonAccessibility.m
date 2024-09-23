@implementation VUIRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIRoundButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIRoundButton"), CFSTR("textLabels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIRoundButton"), CFSTR("button"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIRoundButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[VUIRoundButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[VUIRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "axFilterObjectsUsingBlock:", &__block_literal_global_20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AXLabelForElements();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __49__VUIRoundButtonAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "accessibilityLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[VUIRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("button"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
