@implementation DetailCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.DetailCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.DetailCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.DetailCollectionViewCell"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.DetailCollectionViewCell"), CFSTR("accessibilityAccessoryView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[DetailCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilitySubtitleLabel"));
}

- (id)_axSwitch
{
  void *v2;
  void *v3;
  id v4;

  -[DetailCollectionViewCellAccessibility _axAccessoryView](self, "_axAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490F8D4](CFSTR("UISwitch"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_axAccessoryView
{
  return (id)-[DetailCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAccessoryView"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[DetailCollectionViewCellAccessibility _axSwitch](self, "_axSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DetailCollectionViewCellAccessibility _axAccessoryView](self, "_axAccessoryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
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
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  -[DetailCollectionViewCellAccessibility _axSwitch](self, "_axSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[DetailCollectionViewCellAccessibility _axSwitch](self, "_axSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityActivationPoint");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DetailCollectionViewCellAccessibility;
    -[DetailCollectionViewCellAccessibility accessibilityActivationPoint](&v13, sel_accessibilityActivationPoint);
    v6 = v9;
    v8 = v10;
  }

  v11 = v6;
  v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  -[DetailCollectionViewCellAccessibility _axSwitch](self, "_axSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[DetailCollectionViewCellAccessibility _axSwitch](self, "_axSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "accessibilityTraits");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DetailCollectionViewCellAccessibility;
    v5 = *MEMORY[0x24BDF73B0] | -[DetailCollectionViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  }

  return v5;
}

@end
