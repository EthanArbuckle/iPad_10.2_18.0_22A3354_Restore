@implementation AMRedModeSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMRedModeSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_onLuxThreshold = 5.0;
  self->_offLuxThreshold = 10.0;
}

+ (id)settingsControllerModule
{
  void *v2;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Activation Lux Threshold"), CFSTR("onLuxThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minValue:maxValue:", 0.1, 100.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Deactivation Lux Threshold"), CFSTR("offLuxThreshold"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", 0.1, 100.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BE7B338];
  v21[0] = v3;
  v21[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Trigger Conditions - Ambient Illumination"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BE7B300];
  objc_msgSend(MEMORY[0x24BE7B358], "actionWithSettingsKeyPath:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:action:", CFSTR("Restore Defaults"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BE7B338];
  v20 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BE7B338];
  v19[0] = v8;
  v19[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "moduleWithTitle:contents:", CFSTR("Red Mode"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (double)onLuxThreshold
{
  return self->_onLuxThreshold;
}

- (void)setOnLuxThreshold:(double)a3
{
  self->_onLuxThreshold = a3;
}

- (double)offLuxThreshold
{
  return self->_offLuxThreshold;
}

- (void)setOffLuxThreshold:(double)a3
{
  self->_offLuxThreshold = a3;
}

@end
