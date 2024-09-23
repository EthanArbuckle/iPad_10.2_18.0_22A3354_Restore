@implementation W5PowerStatus(Strings)

- (id)dictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "batteryWarningLevel");
  W5DescriptionForBatteryWarningLevel();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("power_battery_warning_level"));

  objc_msgSend(a1, "powerSourceType");
  W5DescriptionForPowerSourceType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("power_source_type"));

  objc_msgSend(a1, "powerStateCaps");
  W5DescriptionForPowerStateCaps();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v5, CFSTR("power_state_caps"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
