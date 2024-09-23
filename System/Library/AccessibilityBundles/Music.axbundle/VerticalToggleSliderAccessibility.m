@implementation VerticalToggleSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicCoreUI.VerticalToggleSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.VerticalToggleSlider"), CFSTR("accessibilitySliderValue"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.VerticalToggleSlider"), CFSTR("accessibilityMinValue"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.VerticalToggleSlider"), CFSTR("accessibilityMaxValue"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.VerticalToggleSlider"), CFSTR("accessibilityToggleIsOn"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.VerticalToggleSlider"), CFSTR("accessibilityAutomaticallyDisablesOnMaxValue"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.VerticalToggleSlider"), CFSTR("accessibilitySetSliderValue:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.VerticalToggleSlider"), CFSTR("dragged:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[VerticalToggleSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityToggleIsOn"));
  v4 = *MEMORY[0x24BDF73A0];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (id)accessibilityValue
{
  char v3;
  void *v4;
  void *v5;

  v3 = -[VerticalToggleSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityToggleIsOn"));
  -[VerticalToggleSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("accessibilitySliderValue"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
    AXFormatNumberWithOptions();
  else
    accessibilityMusicLocalizedString(CFSTR("vertical.toggle.slider.off"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)accessibilityIncrement
{
  if (-[VerticalToggleSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityToggleIsOn")))-[VerticalToggleSliderAccessibility _accessibilityIncreaseSlider:](self, "_accessibilityIncreaseSlider:", 1);
}

- (void)accessibilityDecrement
{
  if (-[VerticalToggleSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityToggleIsOn")))-[VerticalToggleSliderAccessibility _accessibilityIncreaseSlider:](self, "_accessibilityIncreaseSlider:", 0);
}

- (void)_accessibilityIncreaseSlider:(BOOL)a3
{
  -[VerticalToggleSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("accessibilityMinValue"));
  -[VerticalToggleSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("accessibilityMaxValue"));
  -[VerticalToggleSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("accessibilitySliderValue"));
  AXPerformSafeBlock();
}

void __66__VerticalToggleSliderAccessibility__accessibilityIncreaseSlider___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "accessibilitySetSliderValue:", *(float *)(a1 + 40));
  if (*(float *)(a1 + 40) == *(float *)(a1 + 44))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("accessibilityAutomaticallyDisablesOnMaxValue")))
    {
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 32));
      v2 = *MEMORY[0x24BDF71E8];
      objc_msgSend(*(id *)(a1 + 32), "accessibilityLabel");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      accessibilityMusicLocalizedString(CFSTR("vertical.toggle.slider.off"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityMusicLocalizedString(CFSTR("vertical.toggle.button"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v2, v4);

    }
  }
}

- (void)_accessibilityAnnounceNewValue
{
  UIAccessibilityNotifications v3;
  void *v4;

  if (CFAbsoluteTimeGetCurrent() - *(double *)&_accessibilityAnnounceNewValue_LastOutput > 1.0)
  {
    v3 = *MEMORY[0x24BDF71E8];
    -[VerticalToggleSliderAccessibility _accessibilityAXAttributedValue](self, "_accessibilityAXAttributedValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v3, v4);

    _accessibilityAnnounceNewValue_LastOutput = CFAbsoluteTimeGetCurrent();
  }
}

- (void)dragged:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VerticalToggleSliderAccessibility;
  -[VerticalToggleSliderAccessibility dragged:](&v4, sel_dragged_, a3);
  -[VerticalToggleSliderAccessibility _accessibilityAnnounceNewValue](self, "_accessibilityAnnounceNewValue");
}

@end
