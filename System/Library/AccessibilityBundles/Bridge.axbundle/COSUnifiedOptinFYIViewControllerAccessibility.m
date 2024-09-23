@implementation COSUnifiedOptinFYIViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSUnifiedOptinFYIViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityLabelForWatchView
{
  return accessibilityLocalizedString(CFSTR("watch.picture.field.of.icons"));
}

@end
