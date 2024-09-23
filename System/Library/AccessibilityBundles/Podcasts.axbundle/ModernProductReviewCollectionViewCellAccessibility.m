@implementation ModernProductReviewCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.ModernProductReviewCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ModernProductReviewCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ModernProductReviewCollectionViewCell"), CFSTR("accessibilityRatingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ModernProductReviewCollectionViewCell"), CFSTR("accessibilityDateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ModernProductReviewCollectionViewCell"), CFSTR("accessibilityUsernameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ModernProductReviewCollectionViewCell"), CFSTR("accessibilityTextLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ModernProductReviewCollectionViewCell"), CFSTR("accessibilityReviewMoreButton"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[ModernProductReviewCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilityRatingView, accessibilityDateLabel, accessibilityUsernameLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ModernProductReviewCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ModernProductReviewCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityValue
{
  return (id)-[ModernProductReviewCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTextLabel"));
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)ModernProductReviewCollectionViewCellAccessibility;
  -[ModernProductReviewCollectionViewCellAccessibility automationElements](&v7, sel_automationElements);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[ModernProductReviewCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityReviewMoreButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v5);

  return v3;
}

@end
