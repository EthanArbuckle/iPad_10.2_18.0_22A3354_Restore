@implementation PKPaymentPreferenceCardCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentPreferenceCardCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentPreferenceCardCell"), CFSTR("_accessoryViewType"), "NSInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentPreferenceCardCell"), CFSTR("_actionSwitch"), "UISwitch");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if (-[PKPaymentPreferenceCardCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_accessoryViewType")) == 1)
  {
    -[PKPaymentPreferenceCardCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionSwitch"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityActivationPoint");
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentPreferenceCardCellAccessibility;
    -[PKPaymentPreferenceCardCellAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[PKPaymentPreferenceCardCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_accessoryViewType")) == 1)
  {
    -[PKPaymentPreferenceCardCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionSwitch"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPaymentPreferenceCardCellAccessibility;
    -[PKPaymentPreferenceCardCellAccessibility accessibilityValue](&v6, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;

  if (-[PKPaymentPreferenceCardCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_accessoryViewType")) == 1)return *MEMORY[0x24BEBB1A8];
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferenceCardCellAccessibility;
  return -[PKPaymentPreferenceCardCellAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
}

@end
