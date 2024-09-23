@implementation ReviewRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.ReviewRatingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ReviewRatingView"), CFSTR("accessibilityRating"), "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  -[ReviewRatingViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityRating"));
  return (id)UIAXStarRatingStringForRating();
}

@end
