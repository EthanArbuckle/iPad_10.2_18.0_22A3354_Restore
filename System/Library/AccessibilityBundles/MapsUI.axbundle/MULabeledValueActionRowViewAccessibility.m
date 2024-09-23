@implementation MULabeledValueActionRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MULabeledValueActionRowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MULabeledValueActionRowView"), CFSTR("_titleLabel"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MULabeledValueActionRowView"), CFSTR("_valueLabel"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MULabeledValueActionRowView"), CFSTR("_tertiaryLabel"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MULabeledValueActionRowView"), CFSTR("_actionPlatterView"), "MUCirclePlatterView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[MULabeledValueActionRowViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _valueLabel, _tertiaryLabel"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MULabeledValueActionRowViewAccessibility;
  v3 = -[MULabeledValueActionRowViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  -[MULabeledValueActionRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionPlatterView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73B0];
  if (!v4)
    v5 = 0;
  return v5 | v3;
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

  -[MULabeledValueActionRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionPlatterView"));
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
