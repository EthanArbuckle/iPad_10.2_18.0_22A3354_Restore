@implementation CSProminentLabeledElementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSProminentLabeledElementView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSProminentLabeledElementView"), CFSTR("CSProminentTextElementView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSProminentLabeledElementView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSProminentTextElementView"), CFSTR("textLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CSProminentLabeledElementViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityViewIsVisible
{
  void *v3;
  double v4;
  double v5;
  objc_super v7;
  char v8;

  v8 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4;

  if (v5 > 0.0)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)CSProminentLabeledElementViewAccessibility;
  return -[CSProminentLabeledElementViewAccessibility _accessibilityViewIsVisible](&v7, sel__accessibilityViewIsVisible);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSProminentLabeledElementViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[CSProminentLabeledElementViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
