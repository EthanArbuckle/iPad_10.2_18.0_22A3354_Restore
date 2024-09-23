@implementation TabThumbnailCloseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TabThumbnailCloseButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilitySafariServicesLocalizedString(CFSTR("close.button"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("Close");
}

@end
