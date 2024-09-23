@implementation HKSwitchTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKSwitchTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKSwitchTableViewCell"), CFSTR("_switch"), "UISwitch");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[HKSwitchTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_switch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
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

  -[HKSwitchTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_switch"));
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

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[HKSwitchTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_switch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
