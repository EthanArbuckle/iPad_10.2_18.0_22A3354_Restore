@implementation WDUnitTableViewCell

- (WDUnitTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDUnitTableViewCell *v4;
  WDUnitTableViewCell *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WDUnitTableViewCell;
  v4 = -[WDUnitTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, 1, a4);
  v5 = v4;
  if (v4)
  {
    -[WDUnitTableViewCell _textLabelText](v4, "_textLabelText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDUnitTableViewCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[WDUnitTableViewCell setAccessoryType:](v5, "setAccessoryType:", 1);
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNIT"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
