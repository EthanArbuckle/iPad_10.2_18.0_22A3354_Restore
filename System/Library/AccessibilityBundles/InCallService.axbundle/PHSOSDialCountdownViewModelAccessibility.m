@implementation PHSOSDialCountdownViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHSOSDialCountdownViewModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSDialCountdownViewModel"), CFSTR("countdown"), "Q", 0);
}

- (unint64_t)countdown
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || UIAccessibilityIsAssistiveTouchRunning()
    || (_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    return 10;
  }
  v4.receiver = self;
  v4.super_class = (Class)PHSOSDialCountdownViewModelAccessibility;
  return -[PHSOSDialCountdownViewModelAccessibility countdown](&v4, sel_countdown);
}

- (id)_axAnnouncementString
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v2 = -[PHSOSDialCountdownViewModelAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("countdown"));
  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("sos.dial.countdown.announcement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("sos.hint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
