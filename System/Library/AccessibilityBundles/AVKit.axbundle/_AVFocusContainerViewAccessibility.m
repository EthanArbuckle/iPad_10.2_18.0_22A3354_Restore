@implementation _AVFocusContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_AVFocusContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityShouldIgnoreSoundForFailedMoveAttempt
{
  return 1;
}

- (BOOL)_accessibilityShouldIncludeMediaDescriptionsRotor
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[_AVFocusContainerViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("AVUnifiedPlayerPlaybackControlsViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_AVFocusContainerViewAccessibility;
    v4 = -[_AVFocusContainerViewAccessibility _accessibilityShouldIncludeMediaDescriptionsRotor](&v6, sel__accessibilityShouldIncludeMediaDescriptionsRotor);
  }

  return v4;
}

@end
