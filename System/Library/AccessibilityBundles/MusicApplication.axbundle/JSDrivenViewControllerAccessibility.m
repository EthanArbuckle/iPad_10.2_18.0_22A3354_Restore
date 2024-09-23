@implementation JSDrivenViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.JSDrivenViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.JSDrivenViewController"), CFSTR("accessibilityContextBarButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.JSDrivenViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.JSDrivenViewController"), CFSTR("accessibilityUpdateForHeaderItemChange"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.JSDrivenViewController"), CFSTR("traitCollectionDidChange:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.JSDrivenViewController"), CFSTR("preferredContentSizeDidChangeForChildContentContainer:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JSDrivenViewControllerAccessibility;
  -[JSDrivenViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[JSDrivenViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityContextBarButtonItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &__block_literal_global_9);
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", &__block_literal_global_197);

}

id __81__JSDrivenViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityMusicLocalizedString(CFSTR("more.button"));
}

uint64_t __81__JSDrivenViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return *MEMORY[0x24BDF73B0];
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JSDrivenViewControllerAccessibility;
  -[JSDrivenViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[JSDrivenViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)accessibilityUpdateForHeaderItemChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JSDrivenViewControllerAccessibility;
  -[JSDrivenViewControllerAccessibility accessibilityUpdateForHeaderItemChange](&v3, sel_accessibilityUpdateForHeaderItemChange);
  -[JSDrivenViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JSDrivenViewControllerAccessibility;
  -[JSDrivenViewControllerAccessibility traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[JSDrivenViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JSDrivenViewControllerAccessibility;
  -[JSDrivenViewControllerAccessibility preferredContentSizeDidChangeForChildContentContainer:](&v4, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[JSDrivenViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
