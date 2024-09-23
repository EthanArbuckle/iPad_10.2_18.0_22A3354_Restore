@implementation ASCredentialProviderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASCredentialProviderViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("ASCredentialProviderViewController"), CFSTR("UIViewController"));
}

- (void)viewDidAppear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCredentialProviderViewControllerAccessibility;
  -[ASCredentialProviderViewControllerAccessibility viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  v4 = *MEMORY[0x24BDF7328];
  -[ASCredentialProviderViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

  -[ASCredentialProviderViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityViewIsModal:", 1);

}

@end
