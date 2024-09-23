@implementation MTCCTimerBackgroundViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTCCTimerBackgroundViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimerBackgroundViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimerBackgroundViewController"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimerBackgroundViewController"), CFSTR("timeLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTCCTimerBackgroundViewControllerAccessibility;
  -[MTCCTimerBackgroundViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[MTCCTimerBackgroundViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("timeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF7430]);
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __92__MTCCTimerBackgroundViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_2503B7888;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

id __92__MTCCTimerBackgroundViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  AXLocalizeDurationTime();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTCCTimerBackgroundViewControllerAccessibility;
  -[MTCCTimerBackgroundViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MTCCTimerBackgroundViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
