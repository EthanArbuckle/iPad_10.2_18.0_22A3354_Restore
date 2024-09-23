@implementation _CSDoubleBatteryChargingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_CSDoubleBatteryChargingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_CSDoubleBatteryChargingView"), CFSTR("_internalChargingNameLabel"), "SBUILegibilityLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_CSDoubleBatteryChargingView"), CFSTR("_internalChargePercentLabel"), "SBUILegibilityLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_CSDoubleBatteryChargingView"), CFSTR("_externalChargingNameLabel"), "SBUILegibilityLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_CSDoubleBatteryChargingView"), CFSTR("_externalChargePercentLabel"), "SBUILegibilityLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_CSDoubleBatteryChargingView"), CFSTR("_internalChargingIndicator"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_CSDoubleBatteryChargingView"), CFSTR("_externalChargingIndicator"), "UIImageView");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  const __CFString *v16;

  -[_CSDoubleBatteryChargingViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_internalChargingNameLabel, _internalChargePercentLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSDoubleBatteryChargingViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_internalChargingIndicator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");

  if (v5)
  {
    accessibilitySBLocalizedString(CFSTR("charging"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v3;
    v16 = CFSTR("__AXStringForVariablesSentinel");
    __AXStringForVariables();
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  -[_CSDoubleBatteryChargingViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_externalChargingNameLabel, _externalChargePercentLabel"), v15, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSDoubleBatteryChargingViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_externalChargingIndicator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_accessibilityViewIsVisible");

  if (v10)
  {
    accessibilitySBLocalizedString(CFSTR("charging"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  __AXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
