@implementation ModernTitleHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.ModernTitleHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ModernTitleHeaderView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ModernTitleHeaderView"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKitCollectionViews.ModernTitleHeaderView"), CFSTR("accessibilityHasContextAction"), "Bool");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ModernTitleHeaderView"), CFSTR("accessibilityHeaderButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKitCollectionViews.ModernTitleHeaderView"), CFSTR("titleButton"), "UIButton");

}

- (BOOL)isAccessibilityElement
{
  return -[ModernTitleHeaderViewAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("accessibilityHasContextAction")) ^ 1;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  objc_super v9;
  objc_super v10;

  -[ModernTitleHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isHidden") & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)ModernTitleHeaderViewAccessibility;
    v6 = *MEMORY[0x24BDF73C0] | -[ModernTitleHeaderViewAccessibility accessibilityTraits](&v10, sel_accessibilityTraits);
    v5 = *MEMORY[0x24BDF73B0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ModernTitleHeaderViewAccessibility;
    v5 = -[ModernTitleHeaderViewAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
    v6 = *MEMORY[0x24BDF73C0];
  }
  v7 = v6 | v5;

  return v7;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  objc_opt_class();
  -[ModernTitleHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ModernTitleHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityValue
{
  void *v3;
  objc_super v5;

  if (-[ModernTitleHeaderViewAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("accessibilityHasContextAction")))
  {
    accessibilityLocalizedString(CFSTR("filter"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ModernTitleHeaderViewAccessibility;
    -[ModernTitleHeaderViewAccessibility accessibilityValue](&v5, sel_accessibilityValue);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  char v11;

  if (-[ModernTitleHeaderViewAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("accessibilityHasContextAction")))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_opt_class();
    -[ModernTitleHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v6);

    accessibilityLocalizedString(CFSTR("filter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityValue:", v7);

    objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF73C0]);
    objc_msgSend(v3, "axSafelyAddObject:", v5);
    -[ModernTitleHeaderViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityHeaderButtons"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v8);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ModernTitleHeaderViewAccessibility;
    -[ModernTitleHeaderViewAccessibility accessibilityElements](&v10, sel_accessibilityElements);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
