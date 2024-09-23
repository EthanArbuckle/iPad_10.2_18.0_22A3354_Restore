@implementation OBPrivacySplashControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBPrivacySplashController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OBPrivacySplashController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OBPrivacySplashController"), CFSTR("OBWelcomeController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("OBWelcomeController"), CFSTR("_headerView"), "OBHeaderView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("OBHeaderView"), CFSTR("_imageView"), "OBImageView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBPrivacySplashControllerAccessibility;
  -[OBPrivacySplashControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[OBPrivacySplashControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("_imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[OBPrivacySplashControllerAccessibility _axSetIconProperties:](self, "_axSetIconProperties:", v4);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBPrivacySplashControllerAccessibility;
  -[OBPrivacySplashControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[OBPrivacySplashControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBPrivacySplashControllerAccessibility;
  -[OBPrivacySplashControllerAccessibility viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[OBPrivacySplashControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("OBPrivacySplashListView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_accessibilityLoadAccessibilityInformation");
  -[OBPrivacySplashControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeUIViewForKey:", CFSTR("_imageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v7);

}

- (void)_axSetIconProperties:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "setIsAccessibilityElement:", 1);
    accessibilityLocalizedString(CFSTR("privacy.icon"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v3);

    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDFEF30]);
  }
}

@end
