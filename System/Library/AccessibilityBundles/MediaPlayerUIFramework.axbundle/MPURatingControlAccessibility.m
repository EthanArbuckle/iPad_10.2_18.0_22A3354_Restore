@implementation MPURatingControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPURatingControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPURatingControl"), CFSTR("rating"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPURatingControl"), CFSTR("setRating:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPURatingControl"), CFSTR("delegate"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityChangeValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  -[MPURatingControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rating"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  v7 = -0.2;
  if (v3)
    v7 = 0.2;
  v8 = v7 + v6;
  if (v8 >= 0.0 && v8 <= 1.0)
    AXPerformSafeBlock();
}

void __59__MPURatingControlAccessibility__accessibilityChangeValue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setRating:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ratingDidChangeForRatingControl:", *(_QWORD *)(a1 + 32));

}

- (void)accessibilityIncrement
{
  -[MPURatingControlAccessibility _accessibilityChangeValue:](self, "_accessibilityChangeValue:", 1);
}

- (void)accessibilityDecrement
{
  -[MPURatingControlAccessibility _accessibilityChangeValue:](self, "_accessibilityChangeValue:", 0);
}

- (id)accessibilityValue
{
  void *v2;

  -[MPURatingControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");

  return (id)UIAXStarRatingStringForRating();
}

- (id)accessibilityLabel
{
  return accessibilityMPUILocalizedString(CFSTR("starRating.label"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPURatingControlAccessibility;
  return *MEMORY[0x24BDF73A0] | -[MPURatingControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
