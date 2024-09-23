@implementation COSPasscodeAdvancedViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSPasscodeAdvancedViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityLabelForWatchView
{
  return accessibilityLocalizedString(CFSTR("watch.picture.passcode.long"));
}

@end
