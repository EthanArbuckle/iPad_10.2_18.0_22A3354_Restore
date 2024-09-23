@implementation GKRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKRatingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("GKRatingView"), CFSTR("_value"), "d");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[GKRatingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  UIAXStarRatingStringForRating();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
