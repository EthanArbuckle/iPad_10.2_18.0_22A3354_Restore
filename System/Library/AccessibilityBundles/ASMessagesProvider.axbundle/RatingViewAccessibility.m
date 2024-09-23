@implementation RatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.RatingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.RatingView"), CFSTR("accessibilityRating"), "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  -[RatingViewAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("accessibilityRating"));
  return (id)UIAXStarRatingStringForRating();
}

@end
