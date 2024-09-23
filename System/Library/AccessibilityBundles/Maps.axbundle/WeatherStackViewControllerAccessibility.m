@implementation WeatherStackViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WeatherStackViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WeatherStackViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WeatherStackViewController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WeatherStackViewController"), CFSTR("_weatherConditionsViewController"), "WeatherConditionsViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WeatherStackViewController"), CFSTR("_airQualityConditionsViewController"), "AirQualityConditionsViewController");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WeatherStackViewControllerAccessibility;
  -[WeatherStackViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[WeatherStackViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_initWeak(&location, v3);
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__WeatherStackViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_250259280;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "_setAccessibilityActivateBlock:", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __85__WeatherStackViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_250258E58;
  v7[4] = self;
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v7);
  AXMapsLocString(CFSTR("WEATHER"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349135C4]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityUserInputLabels:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

uint64_t __85__WeatherStackViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v1;

  v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "_accessibilityShowContextMenuForElement:targetPointValue:", v1, 0);

  return 1;
}

id __85__WeatherStackViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_weatherConditionsViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_airQualityConditionsViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WeatherStackViewControllerAccessibility;
  -[WeatherStackViewControllerAccessibility loadView](&v3, sel_loadView);
  -[WeatherStackViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
