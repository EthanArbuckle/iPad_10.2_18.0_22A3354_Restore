@implementation AudioSettingsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AudioConferenceControlCenterModule.AudioSettingsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("audio.control.center.container.label"));
}

@end
