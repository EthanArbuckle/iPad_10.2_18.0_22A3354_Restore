@implementation MTATimerCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTATimerCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerCellView"), CFSTR("localSetup"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerCellView"), CFSTR("controlButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerCellView"), CFSTR("state"), "Q", 0);

}

- (BOOL)_accessibilityIsTimerRunning
{
  return -[MTATimerCellViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("state")) == 3;
}

- (void)_accessibilitySetup
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  LOBYTE(location) = 0;
  objc_opt_class();
  -[MTATimerCellViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("controlButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__MTATimerCellViewAccessibility__accessibilitySetup__block_invoke;
  v5[3] = &unk_2502B7038;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "setAccessibilityLabelBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

id __52__MTATimerCellViewAccessibility__accessibilitySetup__block_invoke(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_accessibilityIsTimerRunning"))
    v2 = CFSTR("timer.pause");
  else
    v2 = CFSTR("timer.resume");
  accessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTATimerCellViewAccessibility;
  -[MTATimerCellViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MTATimerCellViewAccessibility _accessibilitySetup](self, "_accessibilitySetup");
}

- (void)localSetup
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTATimerCellViewAccessibility;
  -[MTATimerCellViewAccessibility localSetup](&v3, sel_localSetup);
  -[MTATimerCellViewAccessibility _accessibilitySetup](self, "_accessibilitySetup");
}

@end
