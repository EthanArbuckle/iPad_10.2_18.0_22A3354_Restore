@implementation PRXCardContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRXCardContentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRXCardContentViewController"), CFSTR("infoButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRXCardContentViewController"), CFSTR("setInfoButtonAction:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PRXCardContentViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PRXCardContentViewController"), CFSTR("_contentView"), "PRXCardContentView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PRXCardContentView"), CFSTR("_titleView"), "UIView<PRXTextContainer>");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRXCardContentViewControllerAccessibility;
  -[PRXCardContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("info.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXCardContentViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("infoButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXCardContentViewControllerAccessibility;
  -[PRXCardContentViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PRXCardContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidAppear
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PRXCardContentViewControllerAccessibility;
  -[PRXCardContentViewControllerAccessibility viewDidAppear](&v2, sel_viewDidAppear);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __58__PRXCardContentViewControllerAccessibility_viewDidAppear__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  void *v2;
  id v3;

  v1 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_contentView"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_titleView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (void)setInfoButtonAction:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRXCardContentViewControllerAccessibility;
  -[PRXCardContentViewControllerAccessibility setInfoButtonAction:](&v4, sel_setInfoButtonAction_, a3);
  -[PRXCardContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
