@implementation AMAmbientDefaults

- (AMAmbientDefaults)init
{
  return (AMAmbientDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.ambient"));
}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "enableAmbientMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDBD1C8];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("AMEnableAmbientMode"), MEMORY[0x24BDBD1C8], 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "alwaysOnMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("AMAlwaysOnEnabled"), &unk_2507623C8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nightModeEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("AMNightModeEnabled"), v4, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "motionToWakeEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("AMMotionToWakeEnabled"), v4, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "bumpToWakeEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("AMBumpToWakeEnabled"), v4, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "notificationsEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("AMNotificationsEnabled"), v4, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "notificationsPreviewOnTapOnlyEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDBD1C0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("AMNotificationsPreviewOnTapOnlyEnabled"), MEMORY[0x24BDBD1C0], 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "firstPresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v12, CFSTR("AMAmbientFirstPresentation"), v4, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "lastSelectedConfigurations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v13, CFSTR("AMLastSelectedConfigurations"), 0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ignoreBatteryChargingForPresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v14, CFSTR("AMAmbientIgnoreBatteryCharging"), v11, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "alwaysUpdateIconModelOnAmbientWidgetLayoutChange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v15, CFSTR("AMAlwaysUpdateIconModelOnAmbientWidgetLayoutChange"), v11, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "lifetimePresentationCounter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v16, CFSTR("AMLifetimePresentationCounter"), 0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "migratedClockCityWidget");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v17, CFSTR("AMMigratedClockCityWidget"), v11, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "alwaysOnEnabled");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v18, CFSTR("AMAlwaysOnEnabled"), v4, 1);

}

- (BOOL)hasMigratedClockCityWidget
{
  return self->_migratedClockCityWidget;
}

- (void)setMigratedClockCityWidget:(BOOL)a3
{
  self->_migratedClockCityWidget = a3;
}

@end
