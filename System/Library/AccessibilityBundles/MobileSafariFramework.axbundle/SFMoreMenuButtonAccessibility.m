@implementation SFMoreMenuButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFMoreMenuButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilitySafariServicesLocalizedString(CFSTR("more.button"));
}

@end
