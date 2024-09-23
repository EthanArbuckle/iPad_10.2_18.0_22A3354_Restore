@implementation VehicleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VehicleCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VehicleCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VehicleCell"), CFSTR("_batteryChargeView"), "VehicleBatteryView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VehicleBatteryView"), CFSTR("_percentLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VehicleBatteryView"), CFSTR("_batteryStateAgeView"), "BatteryStateAgeView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BatteryStateAgeView"), CFSTR("_stateUpdatedLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BatteryStateAgeView"), CFSTR("dateOfLastSync"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v22;

  -[VehicleCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_batteryChargeView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VehicleCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  AXMapsLocString(CFSTR("VEHICLE_BATTERY_LEVEL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_percentLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v7, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("_batteryStateAgeView"), v22, CFSTR("__AXStringForVariablesSentinel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("_stateUpdatedLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v12, "accessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      objc_opt_class();
      objc_msgSend(v11, "safeValueForKey:", CFSTR("dateOfLastSync"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (accessibilityLabel_onceToken != -1)
          dispatch_once(&accessibilityLabel_onceToken, &__block_literal_global_2);
        v17 = (void *)accessibilityLabel_Formatter;
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForDate:relativeToDate:", v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        __UIAXStringForVariables();
        v20 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v20;
      }

    }
  }

  return v10;
}

uint64_t __46__VehicleCellAccessibility_accessibilityLabel__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)accessibilityLabel_Formatter;
  accessibilityLabel_Formatter = v0;

  return objc_msgSend((id)accessibilityLabel_Formatter, "setDateTimeStyle:", 1);
}

@end
