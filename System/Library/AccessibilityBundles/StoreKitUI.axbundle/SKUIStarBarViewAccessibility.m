@implementation SKUIStarBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIStarBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIStarBarView"), CFSTR("_numberOfStars"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIStarBarView"), CFSTR("_value"), "d");

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SKUIStarBarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_numberOfStars"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  UIAXStarRatingStringForRating();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SKUIStarBarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  AXFormatFloatWithPercentage();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
