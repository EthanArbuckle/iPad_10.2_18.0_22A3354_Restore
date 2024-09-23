@implementation HUCameraPlayerFooterViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUCameraPlayerFooterViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUCameraPlayerFooterViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCameraPlayerFooterViewController"), CFSTR("liveButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCameraPlayerFooterViewControllerAccessibility;
  -[HUCameraPlayerFooterViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[HUCameraPlayerFooterViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("liveButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &__block_literal_global_5);
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", &__block_literal_global_190);

}

id __93__HUCameraPlayerFooterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  void *v0;
  void *v1;

  accessibilityHomeUILocalizedString(CFSTR("camera.live.button"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  AXAttributedStringForBetterPronuciation();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __93__HUCameraPlayerFooterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return *MEMORY[0x24BDF7410];
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUCameraPlayerFooterViewControllerAccessibility;
  -[HUCameraPlayerFooterViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HUCameraPlayerFooterViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
