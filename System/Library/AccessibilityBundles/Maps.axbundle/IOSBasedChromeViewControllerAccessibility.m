@implementation IOSBasedChromeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("IOSBasedChromeViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IOSBasedChromeViewController"), CFSTR("mapViewDidFinishLoadingMap:"), "v", "@", 0);
}

- (void)mapViewDidFinishLoadingMap:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOSBasedChromeViewControllerAccessibility;
  -[IOSBasedChromeViewControllerAccessibility mapViewDidFinishLoadingMap:](&v3, sel_mapViewDidFinishLoadingMap_, a3);
  UIAccessibilityPostNotification(0xBD4u, 0);
}

@end
