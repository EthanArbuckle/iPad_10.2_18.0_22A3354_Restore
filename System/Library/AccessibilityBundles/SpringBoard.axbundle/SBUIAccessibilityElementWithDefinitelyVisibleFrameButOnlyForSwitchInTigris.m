@implementation SBUIAccessibilityElementWithDefinitelyVisibleFrameButOnlyForSwitchInTigris

- (BOOL)_accessibilityHasVisibleFrame
{
  objc_super v4;

  if (UIAccessibilityIsSwitchControlRunning())
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SBUIAccessibilityElementWithDefinitelyVisibleFrameButOnlyForSwitchInTigris;
  return -[SBUIAccessibilityElementWithDefinitelyVisibleFrameButOnlyForSwitchInTigris _accessibilityHasVisibleFrame](&v4, sel__accessibilityHasVisibleFrame);
}

@end
