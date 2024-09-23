@implementation PUSlideshowViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUSlideshowViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUSlideshowViewController"), CFSTR("_updateAirplayButton"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUSlideshowViewController"), CFSTR("UIViewController"));

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowViewControllerAccessibility;
  -[PUSlideshowViewControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_updateAirplayButton
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowViewControllerAccessibility;
  -[PUSlideshowViewControllerAccessibility _updateAirplayButton](&v6, sel__updateAirplayButton);
  -[PUSlideshowViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityUIKitLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

@end
