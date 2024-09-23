@implementation LUIManagedDevicesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LUIManagedDevicesViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("LUIManagedDevicesViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LUIManagedDevicesViewController"), CFSTR("_managedDevicesView"), "LUIManagedDevicesView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LUIManagedDevicesView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LUIManagedDevicesView"), CFSTR("_textView"), "UITextView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LUIManagedDevicesViewControllerAccessibility;
  -[LUIManagedDevicesViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUIManagedDevicesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_managedDevicesView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "accessibilityTraits");
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v7);
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_textView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "accessibilityTraits");
  objc_msgSend(v8, "setAccessibilityTraits:", v9 & ~*MEMORY[0x24BDFF008]);
  objc_msgSend(v4, "axSafelyAddObject:", v6);
  objc_msgSend(v4, "axSafelyAddObject:", v8);
  objc_msgSend(v3, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityElements:", v4);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUIManagedDevicesViewControllerAccessibility;
  -[LUIManagedDevicesViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[LUIManagedDevicesViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
