@implementation SUUIStarRatingControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIStarRatingControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (void)accessibilityDecrement
{
  void *v3;
  uint64_t v4;

  -[SUUIStarRatingControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("userRating"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[SUUIStarRatingControlAccessibility _axSetRating:](self, "_axSetRating:", v4 - 1);
}

- (void)accessibilityIncrement
{
  void *v3;
  uint64_t v4;

  -[SUUIStarRatingControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("userRating"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[SUUIStarRatingControlAccessibility _axSetRating:](self, "_axSetRating:", v4 + 1);
}

- (void)_axSetRating:(int64_t)a3
{
  AXPerformSafeBlock();
}

void __51__SUUIStarRatingControlAccessibility__axSetRating___block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "setUserRating:", *(_QWORD *)(a1 + 40));
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForControlEvents:", 4096);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("starRating.label"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SUUIStarRatingControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("userRating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "integerValue");
  UIAXStarRatingStringForRating();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -1.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

@end
