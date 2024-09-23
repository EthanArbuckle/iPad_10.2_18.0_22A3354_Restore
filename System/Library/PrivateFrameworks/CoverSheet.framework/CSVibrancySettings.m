@implementation CSVibrancySettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSVibrancySettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_boostEnabled = 1;
  self->_minimumLuminanceDifference = 0.2;
  self->_naturalEffectTypeStrength = 0.5;
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
  _QWORD v18[2];
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Boost Enabled"), CFSTR("boostEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830D0], "rowWithTitle:valueKeyPath:", CFSTR("Min. Lum. Difference"), CFSTR("minimumLuminanceDifference"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830D0], "rowWithTitle:valueKeyPath:", CFSTR("Natural Type Strength"), CFSTR("naturalEffectTypeStrength"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D83078];
  v20[0] = v2;
  v20[1] = v3;
  v20[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v6, CFSTR("AOD Reduced Backlight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:action:", CFSTR("Restore Defaults"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83078];
  v19 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v12, CFSTR("Restore Defaults"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83078];
  v18[0] = v7;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Vibrancy"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)boostEnabled
{
  return self->_boostEnabled;
}

- (void)setBoostEnabled:(BOOL)a3
{
  self->_boostEnabled = a3;
}

- (double)minimumLuminanceDifference
{
  return self->_minimumLuminanceDifference;
}

- (void)setMinimumLuminanceDifference:(double)a3
{
  self->_minimumLuminanceDifference = a3;
}

- (double)naturalEffectTypeStrength
{
  return self->_naturalEffectTypeStrength;
}

- (void)setNaturalEffectTypeStrength:(double)a3
{
  self->_naturalEffectTypeStrength = a3;
}

@end
