@implementation VTUISiriEducationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VTUISiriEducationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUISiriEducationViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUISiriEducationViewController"), CFSTR("_playerViewController"), "AVPlayerViewController");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTUISiriEducationViewControllerAccessibility;
  -[VTUISiriEducationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[VTUISiriEducationViewControllerAccessibility _accessibilityHideVideoPlayer](self, "_accessibilityHideVideoPlayer");
}

- (void)_accessibilityHideVideoPlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[VTUISiriEducationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_playerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityElementsHidden:", 1);

  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTUISiriEducationViewControllerAccessibility;
  -[VTUISiriEducationViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[VTUISiriEducationViewControllerAccessibility _accessibilityHideVideoPlayer](self, "_accessibilityHideVideoPlayer");
}

@end
