@implementation HealthExperienceUI_CellWithAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExperienceUI.CellWithAccessoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[HealthExperienceUI_CellWithAccessoryViewAccessibility _axSwitchView](self, "_axSwitchView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityValue");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HealthExperienceUI_CellWithAccessoryViewAccessibility;
    -[HealthExperienceUI_CellWithAccessoryViewAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[HealthExperienceUI_CellWithAccessoryViewAccessibility _axSwitchView](self, "_axSwitchView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "accessibilityTraits");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HealthExperienceUI_CellWithAccessoryViewAccessibility;
    v5 = -[HealthExperienceUI_CellWithAccessoryViewAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  -[HealthExperienceUI_CellWithAccessoryViewAccessibility _axSwitchView](self, "_axSwitchView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityActivationPoint");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HealthExperienceUI_CellWithAccessoryViewAccessibility;
    -[HealthExperienceUI_CellWithAccessoryViewAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)_axSwitchView
{
  return (id)-[HealthExperienceUI_CellWithAccessoryViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
}

@end
