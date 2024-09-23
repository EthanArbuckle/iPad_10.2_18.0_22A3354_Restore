@implementation AVMobileChromelessSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVMobileChromelessSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVMobileChromelessSlider"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessSlider"), CFSTR("continueTrackingWithTouch:withEvent:"), "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("AVMobileChromelessControlsViewController"), CFSTR("playerController"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessTimelineView"), CFSTR("trailingTimeText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessSlider"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessSlider"), CFSTR("accessibilityIncrement"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessSlider"), CFSTR("accessibilityDecrement"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerController"), CFSTR("seekByTimeInterval:"), "v", "d", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("time.position.scrubber"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeStringForKey:", CFSTR("trailingTimeText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("media.time.remaining"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_accessibilityAnnounceNewValue
{
  UIAccessibilityNotifications v2;
  id v3;

  v2 = *MEMORY[0x24BDF71E8];
  -[AVMobileChromelessSliderAccessibility _accessibilityAXAttributedValue](self, "_accessibilityAXAttributedValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessSliderAccessibility;
  v4 = -[AVMobileChromelessSliderAccessibility continueTrackingWithTouch:withEvent:](&v6, sel_continueTrackingWithTouch_withEvent_, a3, a4);
  AXPerformSafeBlock();
  return v4;
}

uint64_t __77__AVMobileChromelessSliderAccessibility_continueTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityAnnounceNewValue");
}

@end
