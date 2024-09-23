@implementation SKUIBarRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIBarRatingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIBarRatingView"), CFSTR("_ratingValue"), "f");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIBarRatingViewAccessibility;
  -[SKUIBarRatingViewAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SKUIBarRatingViewAccessibility;
    -[SKUIBarRatingViewAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilitySKUILocalizedString(CFSTR("bar.rating"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)accessibilityValue
{
  void *v2;
  float v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;

  -[SKUIBarRatingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ratingValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3 * 11.0;

  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilitySKUILocalizedString(CFSTR("BAR_RATING_VALUE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, vcvtps_s32_f32(v4), 11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
