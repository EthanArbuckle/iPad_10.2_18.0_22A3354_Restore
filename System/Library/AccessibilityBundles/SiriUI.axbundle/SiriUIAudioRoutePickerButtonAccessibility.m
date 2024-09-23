@implementation SiriUIAudioRoutePickerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriUIAudioRoutePickerButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("assistant.audio.route.label"));
}

@end
