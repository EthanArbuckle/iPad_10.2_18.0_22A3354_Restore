@implementation ProductRatingsCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.ProductRatingsCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
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
