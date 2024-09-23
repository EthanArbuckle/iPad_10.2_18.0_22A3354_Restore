@implementation _SFSettingsAlertStepperAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFSettingsAlertStepper");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFSettingsAlertStepper"), CFSTR("_incrementTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFSettingsAlertStepper"), CFSTR("_decrementTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFSettingsAlertStepper"), CFSTR("_resetTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFSettingsAlertStepper"), CFSTR("_resetButton"), "_SFSettingsAlertButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFSettingsAlertButton"), CFSTR("_text"), "NSString");

}

- (BOOL)isAccessibilityElement
{
  return AXRequestingClient() == 3 || AXRequestingClient() == 4;
}

- (id)initUsingResetButton:(BOOL)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFSettingsAlertStepperAccessibility;
  v3 = -[_SFSettingsAlertStepperAccessibility initUsingResetButton:](&v5, sel_initUsingResetButton_, a3);
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_SFSettingsAlertStepperAccessibility;
  -[_SFSettingsAlertStepperAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  accessibilitySafariServicesLocalizedString(CFSTR("increment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFSettingsAlertStepperAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_incrementButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

  accessibilitySafariServicesLocalizedString(CFSTR("decrement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFSettingsAlertStepperAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_decrementButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

  -[_SFSettingsAlertStepperAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_resetButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("reset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  objc_initWeak(&location, v7);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82___SFSettingsAlertStepperAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_25032D660;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "_setAccessibilityValueBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (unint64_t)accessibilityTraits
{
  void *v2;
  int v3;
  unint64_t *v4;

  -[_SFSettingsAlertStepperAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("PlaybackStateAndPosition"));

  v4 = (unint64_t *)MEMORY[0x24BDF73E0];
  if (!v3)
    v4 = (unint64_t *)MEMORY[0x24BDF73A0];
  return *v4;
}

- (void)accessibilityIncrement
{
  AXPerformSafeBlock();
}

- (void)accessibilityDecrement
{
  AXPerformSafeBlock();
}

- (id)accessibilityLabel
{
  return accessibilitySafariServicesLocalizedString(CFSTR("text.size"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFSettingsAlertStepperAccessibility;
  -[_SFSettingsAlertStepperAccessibility accessibilityValue](&v8, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)_SFSettingsAlertStepperAccessibility;
    -[_SFSettingsAlertStepperAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_SFSettingsAlertStepperAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_resetButton"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeStringForKey:", CFSTR("_text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

@end
