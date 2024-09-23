@implementation ToggleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.ToggleCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axChildSwitch
{
  return (id)-[ToggleCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[ToggleCellAccessibility _axChildSwitch](self, "_axChildSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ToggleCellAccessibility _axChildSwitch](self, "_axChildSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ToggleCellAccessibility;
    -[ToggleCellAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
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

  -[ToggleCellAccessibility _axChildSwitch](self, "_axChildSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ToggleCellAccessibility _axChildSwitch](self, "_axChildSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityActivationPoint");
    v6 = v5;
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ToggleCellAccessibility;
    -[ToggleCellAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  -[ToggleCellAccessibility _axChildSwitch](self, "_axChildSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ToggleCellAccessibility _axChildSwitch](self, "_axChildSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "accessibilityTraits");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ToggleCellAccessibility;
    return -[ToggleCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  }
}

@end
