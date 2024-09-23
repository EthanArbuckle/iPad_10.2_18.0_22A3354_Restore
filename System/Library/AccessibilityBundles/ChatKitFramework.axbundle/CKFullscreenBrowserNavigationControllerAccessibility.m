@implementation CKFullscreenBrowserNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKFullscreenBrowserNavigationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CKFullscreenBrowserNavigationController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKFullscreenBrowserNavigationControllerAccessibility;
  -[CKFullscreenBrowserNavigationControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CKFullscreenBrowserNavigationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKFullscreenBrowserNavigationControllerAccessibility;
  -[CKFullscreenBrowserNavigationControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CKFullscreenBrowserNavigationControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
