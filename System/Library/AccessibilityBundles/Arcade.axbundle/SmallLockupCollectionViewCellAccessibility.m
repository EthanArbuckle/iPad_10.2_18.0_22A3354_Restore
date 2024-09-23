@implementation SmallLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.SmallLockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.SmallLockupCollectionViewCell"), CFSTR("accessibilityOrdinalLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.SmallLockupCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.SmallLockupCollectionViewCell"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.SmallLockupCollectionViewCell"), CFSTR("accessibilityPriceLabel"), "@", 0);

}

- (id)_axLockupView
{
  return (id)-[SmallLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLockupView"));
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  -[SmallLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAccessibilityElement");

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SmallLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  -[SmallLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");
  v4 = *MEMORY[0x24BDF7410] | v3;

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;

  -[SmallLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySupplementaryFooterViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityScrollParentForComparingByXAxis
{
  return (id)-[SmallLockupCollectionViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[SmallLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234906688](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
