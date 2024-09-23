@implementation PHInCallRemoteAlertShellViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHInCallRemoteAlertShellViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestShouldUseWindowBounds
{
  return 1;
}

@end
