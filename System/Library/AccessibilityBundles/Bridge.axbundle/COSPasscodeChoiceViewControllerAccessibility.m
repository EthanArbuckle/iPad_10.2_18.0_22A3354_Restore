@implementation COSPasscodeChoiceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSPasscodeChoiceViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityLabelForWatchView
{
  return accessibilityLocalizedString(CFSTR("watch.picture.passcode.four.digit"));
}

@end
