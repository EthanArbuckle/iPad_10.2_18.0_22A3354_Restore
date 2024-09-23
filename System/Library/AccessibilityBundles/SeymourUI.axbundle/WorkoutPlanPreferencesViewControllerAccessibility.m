@implementation WorkoutPlanPreferencesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.WorkoutPlanPreferencesViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.WorkoutPlanPreferencesViewController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WorkoutPlanPreferencesViewControllerAccessibility;
  -[WorkoutPlanPreferencesViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setIsAccessibilityElement:", 1);
    UIAXStringForAllChildren();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v6);

    objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  }

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WorkoutPlanPreferencesViewControllerAccessibility;
  -[WorkoutPlanPreferencesViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[WorkoutPlanPreferencesViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
