@implementation AccountDetailCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.AccountDetailCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.AccountDetailCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.AccountDetailCollectionViewCell"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.AccountDetailCollectionViewCell"), CFSTR("accessibilityDisabled"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[AccountDetailCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilitySubtitleLabel"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AccountDetailCollectionViewCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[AccountDetailCollectionViewCellAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if (-[AccountDetailCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityDisabled")))return *MEMORY[0x24BDF73E8] | v3;
  else
    return v3 & ~*MEMORY[0x24BDF73E8];
}

@end
