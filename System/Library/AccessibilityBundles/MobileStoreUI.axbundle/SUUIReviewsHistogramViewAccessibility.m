@implementation SUUIReviewsHistogramViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIReviewsHistogramView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIReviewsHistogramView"), CFSTR("initWithClientContext:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIReviewsHistogramView"), CFSTR("setHistogramValues:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIReviewsHistogramView"), CFSTR("setUserRating:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIReviewsHistogramView"), CFSTR("_histogramImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIReviewsHistogramView"), CFSTR("_userRatingStarsView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIReviewsHistogramView"), CFSTR("_histogramValues"), "NSArray");

}

- (void)setTitle:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIReviewsHistogramViewAccessibility;
  -[SUUIReviewsHistogramViewAccessibility setTitle:](&v5, sel_setTitle_, a3);
  -[SUUIReviewsHistogramViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (void)setUserRating:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIReviewsHistogramViewAccessibility;
  -[SUUIReviewsHistogramViewAccessibility setUserRating:](&v8, sel_setUserRating_, a3);
  -[SUUIReviewsHistogramViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userRatingStarsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityValue:", v6);

  accessibilityLocalizedString(CFSTR("starRating.label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v7);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIReviewsHistogramViewAccessibility;
  -[SUUIReviewsHistogramViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[SUUIReviewsHistogramViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_histogramImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("histogram.star.rating"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[SUUIReviewsHistogramViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userRatingStarsView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);

}

- (void)setHistogramValues:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)SUUIReviewsHistogramViewAccessibility;
  -[SUUIReviewsHistogramViewAccessibility setHistogramValues:](&v20, sel_setHistogramValues_, a3);
  -[SUUIReviewsHistogramViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_histogramImageView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReviewsHistogramViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_histogramValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    v9 = &stru_2502A7C80;
    do
    {
      v10 = 0;
      v11 = v9;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10++);
        UIAXStarRatingStringForRating();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        AXFormatFloatWithPercentage();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v11 = v9;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16, v13, v14, CFSTR("__AXStringForVariablesSentinel"));
      v7 += v10;
    }
    while (v6);
  }
  else
  {
    v9 = &stru_2502A7C80;
  }
  objc_msgSend(v15, "setAccessibilityValue:", v9);

}

- (SUUIReviewsHistogramViewAccessibility)initWithClientContext:(id)a3
{
  SUUIReviewsHistogramViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIReviewsHistogramViewAccessibility;
  v3 = -[SUUIReviewsHistogramViewAccessibility initWithClientContext:](&v5, sel_initWithClientContext_, a3);
  -[SUUIReviewsHistogramViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
