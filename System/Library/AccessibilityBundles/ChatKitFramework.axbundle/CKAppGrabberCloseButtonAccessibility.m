@implementation CKAppGrabberCloseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAppGrabberCloseButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("close.button"));
}

@end
