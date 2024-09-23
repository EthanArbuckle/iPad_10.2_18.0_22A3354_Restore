@implementation AirQualityConditionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AirQualityConditionsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AirQualityConditions"), CFSTR("airQualityIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AirQualityConditions"), CFSTR("hasNumericalAirQualityIndex"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AirQualityConditionsViewController"), CFSTR("isVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AirQualityConditionsViewController"), CFSTR("airQualityConditions"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AirQualityConditions"), CFSTR("airQualityDescription"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[AirQualityConditionsViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isVisible")))
  {
    -[AirQualityConditionsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("airQualityConditions"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("airQualityDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      AXMapsLocString(CFSTR("AQI_STRING"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("hasNumericalAirQualityIndex")))
    {
      v8 = objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("airQualityIndex"));
      v9 = (void *)MEMORY[0x24BDD17C8];
      AXMapsLocString(CFSTR("AQI_STRING"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v10, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      AXMapsLocString(CFSTR("AQI_STRING_NO_INDEX"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
