@implementation WeatherConditionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WeatherConditionsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WeatherConditionsViewController"), CFSTR("isVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WeatherConditionsViewController"), CFSTR("weatherConditions"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  if (!-[WeatherConditionsViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isVisible")))return 0;
  -[WeatherConditionsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("weatherConditions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeStringForKey:", CFSTR("conditionDescription"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("temperatureDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  AXMapsLocString(CFSTR("TEMPERATURE_DEGREES_FORMAT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v5 | v10)
  {
    if (!v5)
    {
      if (v10)
      {
        AXMapsLocString(CFSTR("TEMPERATURE"));
        v5 = objc_claimAutoreleasedReturnValue();
      }
    }
    __AXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AXMapKitLocString(CFSTR("WEATHER_UNAVAILABLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
