@implementation ProductRatingsCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ProductPageExtension.ProductRatingsCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ProductPageExtension.ProductRatingsCollectionViewCell"), CFSTR("productRatingView"), "Optional<ProductRatingsView>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ProductPageExtension.ProductRatingsView"), CFSTR("currentRatingLabel"), "DynamicLabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ProductPageExtension.ProductRatingsView"), CFSTR("currentRatingStarsView"), "RatingView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ProductPageExtension.ProductRatingsView"), CFSTR("ratingsCountLabel"), "DynamicLabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[ProductRatingsCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("productRatingView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("currentRatingLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);
  objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("currentRatingStarsView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v6);
  objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("ratingsCountLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v7);
  AXLabelForElements();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
