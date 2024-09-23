@implementation WGWidgetAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WGWidgetAttributionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WGWidgetAttributionView"), CFSTR("UITextView"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("WGWidgetAttributionView"), CFSTR("requestAttributedStringForIdentifier:withHandler:"), "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGWidgetAttributionView"), CFSTR("_configureAttributedString"), "v", 0);

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73D8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_axIsStockWidget
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsStockWidget:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_axIsWeatherWidget
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsWeatherWidget:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)accessibilityLabel
{
  __CFString *v3;
  void *v4;
  objc_super v6;

  if (-[WGWidgetAttributionViewAccessibility _axIsStockWidget](self, "_axIsStockWidget"))
  {
    v3 = CFSTR("stocks.attribution");
  }
  else
  {
    if (!-[WGWidgetAttributionViewAccessibility _axIsWeatherWidget](self, "_axIsWeatherWidget"))
    {
      v6.receiver = self;
      v6.super_class = (Class)WGWidgetAttributionViewAccessibility;
      -[WGWidgetAttributionViewAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    v3 = CFSTR("weather.attribution");
  }
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)accessibilityAttributedValue
{
  return 0;
}

- (id)accessibilityValue
{
  objc_super v4;

  if (-[WGWidgetAttributionViewAccessibility _axIsStockWidget](self, "_axIsStockWidget")
    || -[WGWidgetAttributionViewAccessibility _axIsWeatherWidget](self, "_axIsWeatherWidget"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetAttributionViewAccessibility;
  -[WGWidgetAttributionViewAccessibility accessibilityValue](&v4, sel_accessibilityValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WGWidgetAttributionViewAccessibility;
  -[WGWidgetAttributionViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  AXPerformSafeBlock();
}

uint64_t __82__WGWidgetAttributionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x2349254B8](CFSTR("WGWidgetAttributionView"));
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__WGWidgetAttributionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_2503E7EC0;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "requestAttributedStringForIdentifier:withHandler:", CFSTR("com.apple.stocks.widget"), v7);
  v4 = (void *)MEMORY[0x2349254B8](CFSTR("WGWidgetAttributionView"));
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __82__WGWidgetAttributionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v6[3] = &unk_2503E7EC0;
  v6[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v4, "requestAttributedStringForIdentifier:withHandler:", CFSTR("com.apple.weather.WeatherAppTodayWidget"), v6);
}

void __82__WGWidgetAttributionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axSetIsStockWidget:", objc_msgSend(v6, "isEqualToString:", v7));

}

void __82__WGWidgetAttributionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axSetIsWeatherWidget:", objc_msgSend(v6, "isEqualToString:", v7));

}

- (void)_configureAttributedString
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WGWidgetAttributionViewAccessibility;
  -[WGWidgetAttributionViewAccessibility _configureAttributedString](&v3, sel__configureAttributedString);
  -[WGWidgetAttributionViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
