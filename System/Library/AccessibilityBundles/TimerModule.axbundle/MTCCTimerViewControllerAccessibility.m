@implementation MTCCTimerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTCCTimerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimerViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimerViewController"), CFSTR("sliderView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimerViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimerModule"), CFSTR("timerBackgroundViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimerBackgroundViewController"), CFSTR("timer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimerBackgroundViewController"), CFSTR("timeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimerBackgroundViewController"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimerBackgroundViewController"), CFSTR("dateComponentsFormatter"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimer"), CFSTR("state"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCTimer"), CFSTR("duration"), "d", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTCCTimerViewControllerAccessibility;
  -[MTCCTimerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[MTCCTimerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sliderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  accessibilityLocalizedString(CFSTR("timer.button.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __82__MTCCTimerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2503B7888;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

id __82__MTCCTimerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safeValueForKey:", CFSTR("timerBackgroundViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("timer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "safeIntForKey:", CFSTR("state")) > 1)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v3, "safeUIViewForKey:", CFSTR("timeLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(v4, "safeDoubleForKey:", CFSTR("duration"));
      v10 = v9;
      objc_msgSend(v3, "safeValueForKey:", CFSTR("dateComponentsFormatter"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromTimeInterval:", v10);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return CFSTR("com.apple.mobiletimer");
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(CFSTR("timer.button.label"));
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTCCTimerViewControllerAccessibility;
  -[MTCCTimerViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MTCCTimerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
