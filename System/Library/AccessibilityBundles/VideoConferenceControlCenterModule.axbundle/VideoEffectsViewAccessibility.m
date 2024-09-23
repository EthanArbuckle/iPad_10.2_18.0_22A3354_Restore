@implementation VideoEffectsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideoConferenceControlCenterModule.VideoEffectsView");
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
  return accessibilityLocalizedString(CFSTR("video.control.center.container.label"));
}

@end
