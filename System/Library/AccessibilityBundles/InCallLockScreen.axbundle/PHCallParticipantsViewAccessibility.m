@implementation PHCallParticipantsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHCallParticipantsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCallParticipantsView"), CFSTR("callDisplayStyleManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ICSCallDisplayStyleManager"), CFSTR("callDisplayStyle"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCallParticipantsView"), CFSTR("singleCallLabelView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCallParticipantsView"), CFSTR("shouldIgnoreUpdates"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCallParticipantsView"), CFSTR("updateParticipantsAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSingleCallParticipantLabelView"), CFSTR("bannerButtonsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBannerButtonsView"), CFSTR("rightButton"), "@", 0);

}

- (void)updateParticipantsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  -[PHCallParticipantsViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("singleCallLabelView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)PHCallParticipantsViewAccessibility;
  -[PHCallParticipantsViewAccessibility updateParticipantsAnimated:](&v9, sel_updateParticipantsAnimated_, v3);
  if ((-[PHCallParticipantsViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldIgnoreUpdates")) & 1) == 0
    && !v5)
  {
    -[PHCallParticipantsViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("singleCallLabelView.bannerButtonsView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeUIViewForKey:", CFSTR("rightButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

void __66__PHCallParticipantsViewAccessibility_updateParticipantsAnimated___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], *(id *)(a1 + 32));
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  _BOOL4 v4;

  if (UIAccessibilityIsSwitchControlRunning())
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "assistiveTouchScannerSpeechEnabled") & 1) != 0)
      LOBYTE(v4) = 0;
    else
      v4 = !-[PHCallParticipantsViewAccessibility _accessibilityIsDisplayedInBanner](self, "_accessibilityIsDisplayedInBanner");

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)_accessibilityIsDisplayedInBanner
{
  void *v2;
  BOOL v3;

  -[PHCallParticipantsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("callDisplayStyleManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("callDisplayStyle")) == 0;

  return v3;
}

@end
