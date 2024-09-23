@implementation AirDropBrowserViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AirDropBrowserViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AirDropBrowserViewController"), CFSTR("browserDidUpdateMePeople:knownPeople:unknownPeople:"), "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AirDropBrowserViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AirDropBrowserViewController"), CFSTR("airDropNoContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AirDropNoContentView"), CFSTR("actionButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AirDropBrowserViewControllerAccessibility;
  -[AirDropBrowserViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[AirDropBrowserViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("airDropNoContentView.actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __87__AirDropBrowserViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_25014A200;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setIsAccessibilityElementBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

BOOL __87__AirDropBrowserViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _BOOL8 v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKeyPath:", CFSTR("airDropNoContentView.actionButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AirDropBrowserViewControllerAccessibility;
  -[AirDropBrowserViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[AirDropBrowserViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)browserDidUpdateMePeople:(id)a3 knownPeople:(id)a4 unknownPeople:(id)a5
{
  dispatch_time_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AirDropBrowserViewControllerAccessibility;
  -[AirDropBrowserViewControllerAccessibility browserDidUpdateMePeople:knownPeople:unknownPeople:](&v6, sel_browserDidUpdateMePeople_knownPeople_unknownPeople_, a3, a4, a5);
  v5 = dispatch_time(0, 500000000);
  dispatch_after(v5, MEMORY[0x24BDAC9B8], &__block_literal_global_0);
}

void __96__AirDropBrowserViewControllerAccessibility_browserDidUpdateMePeople_knownPeople_unknownPeople___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
