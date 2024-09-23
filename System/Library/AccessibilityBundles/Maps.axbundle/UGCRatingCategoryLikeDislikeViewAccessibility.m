@implementation UGCRatingCategoryLikeDislikeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UGCRatingCategoryLikeDislikeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UGCRatingCategoryLikeDislikeView"), CFSTR("_likeButton"), "UGCGlyphButtonView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UGCRatingCategoryLikeDislikeView"), CFSTR("_dislikeButton"), "UGCGlyphButtonView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UGCRatingCategoryLikeDislikeViewAccessibility;
  -[UGCRatingCategoryLikeDislikeViewAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[UGCRatingCategoryLikeDislikeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_likeButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("LIKE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  -[UGCRatingCategoryLikeDislikeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_dislikeButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("DISLIKE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  objc_msgSend(v6, "setAccessibilityTraits:", v5);
}

- (void)_setupSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UGCRatingCategoryLikeDislikeViewAccessibility;
  -[UGCRatingCategoryLikeDislikeViewAccessibility _setupSubviews](&v3, sel__setupSubviews);
  -[UGCRatingCategoryLikeDislikeViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
