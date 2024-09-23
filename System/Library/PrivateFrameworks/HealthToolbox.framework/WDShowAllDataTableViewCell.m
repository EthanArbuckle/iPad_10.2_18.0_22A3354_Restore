@implementation WDShowAllDataTableViewCell

- (WDShowAllDataTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDShowAllDataTableViewCell *v4;
  WDShowAllDataTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WDShowAllDataTableViewCell;
  v4 = -[WDShowAllDataTableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WDShowAllDataTableViewCell _textLabelText](v4, "_textLabelText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDShowAllDataTableViewCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDShowAllDataTableViewCell textLabel](v5, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    -[WDShowAllDataTableViewCell setAccessoryType:](v5, "setAccessoryType:", 1);
  }
  return v5;
}

+ (NSString)defaultReuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)_textLabelText
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL_DATA"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
