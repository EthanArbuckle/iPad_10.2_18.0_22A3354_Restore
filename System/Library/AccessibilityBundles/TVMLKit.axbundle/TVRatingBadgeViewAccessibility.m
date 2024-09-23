@implementation TVRatingBadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVRatingBadgeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRatingBadgeView"), CFSTR("ratingValue"), "d", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  float v4;
  float v5;
  double v6;
  void *v8;
  void *v10;
  objc_super v11;

  -[TVRatingBadgeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("ratingValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;
  v6 = v4;

  if (v5 < 0.0 || v5 > 1.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _AXAssert();

    v11.receiver = self;
    v11.super_class = (Class)TVRatingBadgeViewAccessibility;
    -[TVRatingBadgeViewAccessibility accessibilityLabel](&v11, sel_accessibilityLabel, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    UIAXStarRatingStringForRatingWithMaxRating();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

@end
