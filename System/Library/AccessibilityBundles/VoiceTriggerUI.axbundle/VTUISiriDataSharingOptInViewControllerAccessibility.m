@implementation VTUISiriDataSharingOptInViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VTUISiriDataSharingOptInViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("VTUISiriDataSharingOptInViewController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTUISiriDataSharingOptInViewControllerAccessibility;
  -[VTUISiriDataSharingOptInViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[VTUISiriDataSharingOptInViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTUISiriDataSharingOptInViewControllerAccessibility;
  -[VTUISiriDataSharingOptInViewControllerAccessibility viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[VTUISiriDataSharingOptInViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTUISiriDataSharingOptInViewControllerAccessibility;
  -[VTUISiriDataSharingOptInViewControllerAccessibility viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[VTUISiriDataSharingOptInViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 0);

}

@end
