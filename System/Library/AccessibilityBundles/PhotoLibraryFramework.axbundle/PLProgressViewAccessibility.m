@implementation PLProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  double v3;
  BOOL v4;

  -[PLProgressViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("alpha"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3 > 0.0;

  return v4;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PLProgressViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_labelView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_axUpdateValueBasedOnPercentComplete:(float)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
  UIKitAccessibilityLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloatWithPercentage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "initWithFormat:", v5, v6);

  -[PLProgressViewAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", v7);
}

- (void)setPercentComplete:(float)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLProgressViewAccessibility;
  -[PLProgressViewAccessibility setPercentComplete:](&v8, sel_setPercentComplete_);
  v4 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
  UIKitAccessibilityLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloatWithPercentage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", v5, v6);

  -[PLProgressViewAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", v7);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLProgressViewAccessibility;
  -[PLProgressViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PLProgressViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("percentComplete"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  -[PLProgressViewAccessibility _axUpdateValueBasedOnPercentComplete:](self, "_axUpdateValueBasedOnPercentComplete:");

}

@end
