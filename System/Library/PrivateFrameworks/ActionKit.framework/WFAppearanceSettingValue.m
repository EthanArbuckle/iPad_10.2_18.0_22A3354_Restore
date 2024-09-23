@implementation WFAppearanceSettingValue

- (WFAppearanceSettingValue)initWithSetting:(int64_t)a3
{
  WFAppearanceSettingValue *v4;
  WFAppearanceSettingValue *v5;
  WFAppearanceSettingValue *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFAppearanceSettingValue;
  v4 = -[WFAppearanceSettingValue init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_setting = a3;
    v6 = v4;
  }

  return v5;
}

- (id)valueByInvertingSetting
{
  unint64_t v2;
  WFAppearanceSettingValue *v3;

  v2 = -[WFAppearanceSettingValue setting](self, "setting");
  if (v2 <= 2)
    v3 = -[WFAppearanceSettingValue initWithSetting:]([WFAppearanceSettingValue alloc], "initWithSetting:", qword_22D6AD398[v2]);
  return v3;
}

- (BOOL)isDarkModeOn
{
  return -[WFAppearanceSettingValue setting](self, "setting") == 1;
}

- (NSString)wfName
{
  void *v2;
  __CFString *v3;

  v2 = -[WFAppearanceSettingValue setting](self, "setting");
  if (v2 == (void *)2)
  {
    v3 = CFSTR("Light Mode");
LABEL_7:
    WFLocalizedString(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v2;
  }
  if (v2 == (void *)1)
  {
    v3 = CFSTR("Dark Mode");
    goto LABEL_7;
  }
  if (!v2)
  {
    WFLocalizedStringWithKey(CFSTR("Unknown (appearance)"), CFSTR("Unknown"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (WFAppearanceSettingValue)initWithCoder:(id)a3
{
  return -[WFAppearanceSettingValue initWithSetting:](self, "initWithSetting:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("setting")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAppearanceSettingValue setting](self, "setting"), CFSTR("setting"));

}

- (int64_t)setting
{
  return self->_setting;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
