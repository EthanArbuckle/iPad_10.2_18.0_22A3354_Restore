@implementation CAMZoomSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMZoomSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomSlider"), CFSTR("_hideZoomSlider:"), "v", "@", 0);
}

- (void)_hideZoomSlider:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)CAMZoomSliderAccessibility;
    -[CAMZoomSliderAccessibility _hideZoomSlider:](&v5, sel__hideZoomSlider_, v4);
  }

}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("zoom.slider.text"));
}

- (BOOL)_accessibilityIsVerticalAdjustableElement
{
  return 1;
}

@end
