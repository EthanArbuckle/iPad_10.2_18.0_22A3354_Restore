@implementation PHActionSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHActionSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PHActionSlider"), CFSTR("_trackBackgroundView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHActionSlider"), CFSTR("trackText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHActionSlider"), CFSTR("trackMaskPath"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHActionSlider"), CFSTR("_slideCompleted:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHActionSlider"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSlidingButton"), CFSTR("type"), "i", 0);

}

- (id)accessibilityPath
{
  void *v3;
  UIBezierPath *v4;
  UIView *v5;
  void *v6;

  -[PHActionSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trackMaskPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();

  -[PHActionSliderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_trackBackgroundView"));
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityConvertPathToScreenCoordinates(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[PHActionSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trackText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHActionSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "safeIntForKey:", CFSTR("type")) == 8)
  {
    accessibilityLocalizedString(CFSTR("slide.to.power.off"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }

  return v3;
}

- (BOOL)accessibilityActivate
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __52__PHActionSliderAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_slideCompleted:", 1);
}

- (BOOL)_accessibilityScannerShouldUseActivateInPointMode
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end
