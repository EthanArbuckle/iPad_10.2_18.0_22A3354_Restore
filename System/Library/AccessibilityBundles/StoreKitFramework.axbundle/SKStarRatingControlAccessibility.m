@implementation SKStarRatingControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKStarRatingControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)accessibilityIncrement
{
  void *v2;
  float v3;
  float v4;

  -[SKStarRatingControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  if (v4 < 1.0)
    AXPerformSafeBlock();
}

uint64_t __58__SKStarRatingControlAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  double v1;

  v1 = *(double *)(a1 + 40);
  *(float *)&v1 = v1;
  return objc_msgSend(*(id *)(a1 + 32), "setValue:", v1);
}

- (void)accessibilityDecrement
{
  void *v2;
  float v3;
  float v4;

  -[SKStarRatingControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  if (v4 > 0.0)
    AXPerformSafeBlock();
}

uint64_t __58__SKStarRatingControlAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  double v1;

  v1 = *(double *)(a1 + 40);
  *(float *)&v1 = v1;
  return objc_msgSend(*(id *)(a1 + 32), "setValue:", v1);
}

- (id)accessibilityValue
{
  void *v2;

  -[SKStarRatingControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");

  return (id)UIAXStarRatingStringForRating();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("starRating.label"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKStarRatingControlAccessibility;
  return *MEMORY[0x24BDF73A0] | -[SKStarRatingControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
