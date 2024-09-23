@implementation CAMImageWellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMImageWell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return -[CAMImageWellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_accessibilityViewIsVisible"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("GoToCameraRoll");
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("photos.button.text"));
}

@end
