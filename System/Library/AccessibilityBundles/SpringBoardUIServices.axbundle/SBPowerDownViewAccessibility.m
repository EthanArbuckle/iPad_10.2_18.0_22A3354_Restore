@implementation SBPowerDownViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIPowerDownView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPowerDownView"), CFSTR("_actionSlider"), "_UIActionSlider");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPowerDownView"), CFSTR("_cancelButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPowerDownView"), CFSTR("_findMyButton"), "UIButton");

}

- (SBPowerDownViewAccessibility)initWithFrame:(CGRect)a3
{
  SBPowerDownViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPowerDownViewAccessibility;
  v3 = -[SBPowerDownViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SBPowerDownViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id from;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBPowerDownViewAccessibility;
  -[SBPowerDownViewAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);
  -[SBPowerDownViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionSlider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("actionSlider"));
  accessibilitySBLocalizedString(CFSTR("powerdown.lock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[SBPowerDownViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cancelButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("cancelButton"));
  objc_initWeak(&location, v5);
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__SBPowerDownViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v12[3] = &unk_2503901D0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "_setAccessibilityPathBlock:", v12);
  LOBYTE(from) = 0;
  objc_opt_class();
  -[SBPowerDownViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_findMyButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&from, v8);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __74__SBPowerDownViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v9[3] = &unk_2503901F8;
  objc_copyWeak(&v10, &from);
  objc_msgSend(v8, "_setAccessibilityLabelBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

id __74__SBPowerDownViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityCirclePathBasedOnBoundsWidth");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __74__SBPowerDownViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "attributedTitleForState:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
