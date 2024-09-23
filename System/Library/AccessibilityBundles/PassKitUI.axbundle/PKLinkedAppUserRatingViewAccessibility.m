@implementation PKLinkedAppUserRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKLinkedAppUserRatingView");
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
  void *v2;
  void *v3;

  -[PKLinkedAppUserRatingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("userRating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  UIAXStarRatingStringForRating();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
