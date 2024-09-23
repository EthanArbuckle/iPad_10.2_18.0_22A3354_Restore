@implementation CAMMessagesPhotosButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMMessagesPhotosButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("photo.library.button"));
}

@end
