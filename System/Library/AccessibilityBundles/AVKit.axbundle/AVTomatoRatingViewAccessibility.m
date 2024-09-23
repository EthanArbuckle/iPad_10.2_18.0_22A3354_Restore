@implementation AVTomatoRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTomatoRatingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTomatoRatingView"), CFSTR("tomatoFreshness"), "Q", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[AVTomatoRatingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tomatoFreshness"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  if (v3 > 2)
  {
    v4 = 0;
  }
  else
  {
    accessibilityLocalizedString(off_250141420[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
