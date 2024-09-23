@implementation HKHRCardioFitnessWatchSettings

- (HKHRCardioFitnessWatchSettings)initWithSettingVisible:(BOOL)a3 settingEnabled:(BOOL)a4 statusText:(id)a5 footer:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  HKHRCardioFitnessWatchSettings *v12;
  HKHRCardioFitnessWatchSettings *v13;
  HKHRCardioFitnessWatchSettings *v14;
  objc_super v16;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKHRCardioFitnessWatchSettings;
  v12 = -[HKHRCardioFitnessWatchSettings init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    -[HKHRCardioFitnessWatchSettings setSettingVisible:](v12, "setSettingVisible:", v8);
    -[HKHRCardioFitnessWatchSettings setSettingEnabled:](v13, "setSettingEnabled:", v7);
    -[HKHRCardioFitnessWatchSettings setStatusText:](v13, "setStatusText:", v10);
    -[HKHRCardioFitnessWatchSettings setFooter:](v13, "setFooter:", v11);
    v14 = v13;
  }

  return v13;
}

+ (id)hiddenSettings
{
  HKHRCardioFitnessWatchSettings *v2;
  void *v3;
  HKHRCardioFitnessWatchSettings *v4;

  v2 = [HKHRCardioFitnessWatchSettings alloc];
  +[_HKHeartSettingsUtilities cardioFitnessUnavailableDetailText](_HKHeartSettingsUtilities, "cardioFitnessUnavailableDetailText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRCardioFitnessWatchSettings initWithSettingVisible:settingEnabled:statusText:footer:](v2, "initWithSettingVisible:settingEnabled:statusText:footer:", 0, 0, v3, 0);

  return v4;
}

- (BOOL)settingVisible
{
  return self->_settingVisible;
}

- (void)setSettingVisible:(BOOL)a3
{
  self->_settingVisible = a3;
}

- (BOOL)settingEnabled
{
  return self->_settingEnabled;
}

- (void)setSettingEnabled:(BOOL)a3
{
  self->_settingEnabled = a3;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
  objc_storeStrong((id *)&self->_statusText, a3);
}

- (HKHRCardioFitnessFooter)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
}

@end
