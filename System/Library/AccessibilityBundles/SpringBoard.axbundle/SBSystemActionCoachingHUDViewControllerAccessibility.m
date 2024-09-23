@implementation SBSystemActionCoachingHUDViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSystemActionCoachingHUDViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemActionCoachingHUDViewController"), CFSTR("_coachingLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemActionCoachingHUDViewController"), CFSTR("_contentView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemActionCoachingHUDViewController"), CFSTR("_dimmingView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemActionCoachingHUDViewController"), CFSTR("_coachingLabelWrapperView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemActionCoachingHUDViewController"), CFSTR("viewDidLoad"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[SBSystemActionCoachingHUDViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_coachingLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  -[SBSystemActionCoachingHUDViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 0);
  -[SBSystemActionCoachingHUDViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dimmingView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityViewIsModal:", 0);
  -[SBSystemActionCoachingHUDViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_coachingLabelWrapperView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityViewIsModal:", 0);
  v7.receiver = self;
  v7.super_class = (Class)SBSystemActionCoachingHUDViewControllerAccessibility;
  -[SBSystemActionCoachingHUDViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionCoachingHUDViewControllerAccessibility;
  -[SBSystemActionCoachingHUDViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[SBSystemActionCoachingHUDViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
