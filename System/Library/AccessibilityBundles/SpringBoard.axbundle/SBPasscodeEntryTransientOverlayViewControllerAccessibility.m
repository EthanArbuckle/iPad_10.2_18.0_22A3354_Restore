@implementation SBPasscodeEntryTransientOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBPasscodeEntryTransientOverlayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SBPasscodeEntryTransientOverlayViewController"), CFSTR("UIViewController"));
}

- (void)_axAnnotateView
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPasscodeEntryTransientOverlayViewControllerAccessibility;
  -[SBPasscodeEntryTransientOverlayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SBPasscodeEntryTransientOverlayViewControllerAccessibility _axAnnotateView](self, "_axAnnotateView");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPasscodeEntryTransientOverlayViewControllerAccessibility;
  -[SBPasscodeEntryTransientOverlayViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[SBPasscodeEntryTransientOverlayViewControllerAccessibility _axAnnotateView](self, "_axAnnotateView");
}

@end
