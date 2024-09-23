@implementation JSInlinePopupViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.JSInlinePopupViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.JSInlinePopupViewController"), CFSTR("accessibilityContainerView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.JSInlinePopupViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.JSInlinePopupViewController"), CFSTR("accessibilityCloseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.JSInlinePopupViewController"), CFSTR("viewDidLoad"), "v", 0);

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)JSInlinePopupViewControllerAccessibility;
  -[JSInlinePopupViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[JSInlinePopupViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityContainerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityDescendantOfType:", MEMORY[0x234917594](CFSTR("MusicApplication.InformativeView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JSInlinePopupViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCloseButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityMusicLocalizedString(CFSTR("close.button"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "axSafelyAddObject:", v5);
  objc_msgSend(v8, "axSafelyAddObject:", v6);
  objc_opt_class();
  -[JSInlinePopupViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessibilityElements:", v8);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JSInlinePopupViewControllerAccessibility;
  -[JSInlinePopupViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[JSInlinePopupViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
