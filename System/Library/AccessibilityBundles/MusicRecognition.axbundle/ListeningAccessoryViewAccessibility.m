@implementation ListeningAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicRecognition.ListeningAccessoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("ACCESSIBILITY_RECOGNIZE_MUSIC_LISTENING_VIEW"));
}

@end
