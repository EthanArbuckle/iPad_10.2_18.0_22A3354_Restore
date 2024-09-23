@implementation MediaControlsRoutingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsRoutingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAVRoutingViewController"), CFSTR("_tableView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MediaControlsRoutingViewController"), CFSTR("MPAVRoutingViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAVRoutingViewController"), CFSTR("viewDidLoad"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaControlsRoutingViewControllerAccessibility;
  -[MediaControlsRoutingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[MediaControlsRoutingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityContainerType:", 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsRoutingViewControllerAccessibility;
  -[MediaControlsRoutingViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MediaControlsRoutingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
