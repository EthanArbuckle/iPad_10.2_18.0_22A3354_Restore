@implementation SmallBreakoutCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.SmallBreakoutCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.SmallBreakoutCollectionViewCell"), CFSTR("accessibilityDetailsView"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axDetailsView
{
  return (id)-[SmallBreakoutCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDetailsView"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SmallBreakoutCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SmallBreakoutCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return (id)-[SmallBreakoutCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityDetailsView"));
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v9.receiver = self;
  v9.super_class = (Class)SmallBreakoutCollectionViewCellAccessibility;
  -[SmallBreakoutCollectionViewCellAccessibility accessibilityCustomActions](&v9, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SmallBreakoutCollectionViewCellAccessibility _axDetailsView](self, "_axDetailsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityCustomActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v7);

  return v5;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SmallBreakoutCollectionViewCellAccessibility;
  -[SmallBreakoutCollectionViewCellAccessibility automationElements](&v11, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[SmallBreakoutCollectionViewCellAccessibility _axDetailsView](self, "_axDetailsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "automationElements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObjectsFromArray:", v9);

  return v7;
}

@end
