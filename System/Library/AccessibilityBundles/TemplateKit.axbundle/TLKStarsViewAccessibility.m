@implementation TLKStarsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TLKStarsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKStarsView"), CFSTR("starRating"), "d", 0);
}

- (id)accessibilityLabel
{
  -[TLKStarsViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("starRating"));
  return (id)UIAXStarRatingStringForRating();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
