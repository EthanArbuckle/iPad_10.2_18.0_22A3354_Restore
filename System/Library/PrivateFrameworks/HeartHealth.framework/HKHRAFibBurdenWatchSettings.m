@implementation HKHRAFibBurdenWatchSettings

- (HKHRAFibBurdenWatchSettings)initWithSettingVisible:(BOOL)a3 settingEnabled:(BOOL)a4 statusText:(id)a5 footer:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  HKHRAFibBurdenWatchSettings *v12;
  HKHRAFibBurdenWatchSettings *v13;
  HKHRAFibBurdenWatchSettings *v14;
  objc_super v16;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKHRAFibBurdenWatchSettings;
  v12 = -[HKHRAFibBurdenWatchSettings init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    -[HKHRAFibBurdenWatchSettings setSettingVisible:](v12, "setSettingVisible:", v8);
    -[HKHRAFibBurdenWatchSettings setSettingEnabled:](v13, "setSettingEnabled:", v7);
    -[HKHRAFibBurdenWatchSettings setStatusText:](v13, "setStatusText:", v10);
    -[HKHRAFibBurdenWatchSettings setFooter:](v13, "setFooter:", v11);
    v14 = v13;
  }

  return v13;
}

+ (id)hiddenSettings
{
  HKHRAFibBurdenWatchSettings *v2;
  void *v3;
  HKHRAFibBurdenWatchSettings *v4;

  v2 = [HKHRAFibBurdenWatchSettings alloc];
  +[_HKHeartSettingsUtilities aFibBurdenUnavailableDetailText](_HKHeartSettingsUtilities, "aFibBurdenUnavailableDetailText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRAFibBurdenWatchSettings initWithSettingVisible:settingEnabled:statusText:footer:](v2, "initWithSettingVisible:settingEnabled:statusText:footer:", 0, 0, v3, 0);

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

- (HKHRAFibBurdenFooter)footer
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
