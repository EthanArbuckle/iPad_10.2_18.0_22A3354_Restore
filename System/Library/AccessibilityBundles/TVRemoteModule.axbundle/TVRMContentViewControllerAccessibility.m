@implementation TVRMContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVRMContentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(CFSTR("apple.tv.remote.button.label"));
}

@end
