@implementation MenuCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.MenuCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MenuCell"), CFSTR("titleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MenuCell"), CFSTR("accessibilityIsDimmed"), "B", 0);

}

- (id)_axChildSwitch
{
  return (id)-[MenuCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[MenuCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("titleText"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[MenuCellAccessibility _axChildSwitch](self, "_axChildSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MenuCellAccessibility _axChildSwitch](self, "_axChildSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MenuCellAccessibility;
    -[MenuCellAccessibility accessibilityValue](&v7, sel_accessibilityValue);
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

  -[MenuCellAccessibility _axChildSwitch](self, "_axChildSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MenuCellAccessibility _axChildSwitch](self, "_axChildSwitch");
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
    v11.super_class = (Class)MenuCellAccessibility;
    -[MenuCellAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MenuCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[MenuCellAccessibility accessibilityTraits](&v10, sel_accessibilityTraits);
  -[MenuCellAccessibility _axChildSwitch](self, "_axChildSwitch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF7428];
  if (!v4)
    v5 = 0;
  v6 = v3 | v5;
  v7 = -[MenuCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsDimmed"));
  v8 = *MEMORY[0x24BDF73E8];
  if (!v7)
    v8 = 0;
  return v6 | v8;
}

@end
