@implementation SBRemoteTransientOverlayHostViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBRemoteTransientOverlayHostViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SBRemoteTransientOverlayHostViewController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayHostViewControllerAccessibility;
  -[SBRemoteTransientOverlayHostViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SBRemoteTransientOverlayHostViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("viewIfLoaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 1);

}

- (SBRemoteTransientOverlayHostViewControllerAccessibility)initWithNibName:(id)a3 bundle:(id)a4
{
  SBRemoteTransientOverlayHostViewControllerAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRemoteTransientOverlayHostViewControllerAccessibility;
  v4 = -[SBRemoteTransientOverlayHostViewControllerAccessibility initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  -[SBRemoteTransientOverlayHostViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRemoteTransientOverlayHostViewControllerAccessibility;
  -[SBRemoteTransientOverlayHostViewControllerAccessibility viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[SBRemoteTransientOverlayHostViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
