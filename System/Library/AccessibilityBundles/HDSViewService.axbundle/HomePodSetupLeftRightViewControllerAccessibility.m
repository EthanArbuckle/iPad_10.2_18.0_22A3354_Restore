@implementation HomePodSetupLeftRightViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HDSViewService.HomePodSetupLeftRightViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("HDSViewService.HomePodSetupLeftRightViewController"), CFSTR("leftButton"));
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("HDSViewService.HomePodSetupLeftRightViewController"), CFSTR("rightButton"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HomePodSetupLeftRightViewControllerAccessibility;
  -[HomePodSetupLeftRightViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[HomePodSetupLeftRightViewControllerAccessibility _accessibilityMarkupStereoButtons](self, "_accessibilityMarkupStereoButtons");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HomePodSetupLeftRightViewControllerAccessibility;
  -[HomePodSetupLeftRightViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HomePodSetupLeftRightViewControllerAccessibility _accessibilityMarkupStereoButtons](self, "_accessibilityMarkupStereoButtons");
}

- (void)_accessibilityMarkupStereoButtons
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HomePodSetupLeftRightViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("leftButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("left.stereo.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[HomePodSetupLeftRightViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("rightButton"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("right.stereo.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

}

@end
