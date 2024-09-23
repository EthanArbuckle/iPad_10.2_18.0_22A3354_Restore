@implementation MTAStopwatchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAStopwatchViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchViewController"), CFSTR("pageControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTAStopwatchViewController"), CFSTR("_mode"), "Q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchViewController"), CFSTR("stopwatchController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchViewController"), CFSTR("setMode:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchController"), CFSTR("lapControlButton"), "@", 0);

}

- (void)lapLapTimer
{
  objc_super v2;

  OutputLap = 1;
  v2.receiver = self;
  v2.super_class = (Class)MTAStopwatchViewControllerAccessibility;
  -[MTAStopwatchViewControllerAccessibility lapLapTimer](&v2, sel_lapLapTimer);
  OutputLap = 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAStopwatchViewControllerAccessibility;
  -[MTAStopwatchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[MTAStopwatchViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("StopWatchPageControl"));

  -[MTAStopwatchViewControllerAccessibility _axSetLapButtonTraitsForMode:](self, "_axSetLapButtonTraitsForMode:", -[MTAStopwatchViewControllerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_mode")));
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAStopwatchViewControllerAccessibility;
  -[MTAStopwatchViewControllerAccessibility loadView](&v3, sel_loadView);
  -[MTAStopwatchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)didAddLap:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAStopwatchViewControllerAccessibility;
  -[MTAStopwatchViewControllerAccessibility didAddLap:](&v3, sel_didAddLap_);
  if (OutputLap == 1)
    AXPerformBlockOnMainThreadAfterDelay();
}

void __53__MTAStopwatchViewControllerAccessibility_didAddLap___block_invoke()
{
  UIAccessibilityNotifications v0;
  id v1;

  v0 = *MEMORY[0x24BDF71E8];
  UIAXTimeStringForDuration();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);

}

- (void)_axSetLapButtonTraitsForMode:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[MTAStopwatchViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stopwatchController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeUIViewForKey:", CFSTR("lapControlButton"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    v5 = objc_msgSend(v8, "accessibilityTraits");
    v6 = *MEMORY[0x24BDF73E8] | v5;
  }
  else
  {
    v7 = *MEMORY[0x24BDF73E8];
    v6 = objc_msgSend(v8, "accessibilityTraits") & ~v7;
  }
  objc_msgSend(v8, "setAccessibilityTraits:", v6);

}

- (void)setMode:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTAStopwatchViewControllerAccessibility;
  -[MTAStopwatchViewControllerAccessibility setMode:](&v5, sel_setMode_);
  -[MTAStopwatchViewControllerAccessibility _axSetLapButtonTraitsForMode:](self, "_axSetLapButtonTraitsForMode:", a3);
}

@end
