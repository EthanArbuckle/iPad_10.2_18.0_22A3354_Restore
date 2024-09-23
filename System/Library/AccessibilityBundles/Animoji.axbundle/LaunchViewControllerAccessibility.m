@implementation LaunchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LaunchViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LaunchViewController"), CFSTR("videoController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LaunchViewController"), CFSTR("bottomVideoController"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LaunchViewControllerAccessibility;
  -[LaunchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[LaunchViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("videoController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  accessibilityJellyfishLocalizedString(CFSTR("splash.video"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  objc_opt_class();
  -[LaunchViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bottomVideoController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIsAccessibilityElement:", 1);
  accessibilityJellyfishLocalizedString(CFSTR("splash.bottom.video"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

  -[LaunchViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityViewIsModal:", 1);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LaunchViewControllerAccessibility;
  -[LaunchViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[LaunchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
