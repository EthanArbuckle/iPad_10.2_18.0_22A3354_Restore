@implementation WDAccessTableViewCell

+ (NSString)defaultReuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (WDAccessTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDAccessTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WDAccessTableViewCell;
  v4 = -[WDAccessTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARE_DATA_TITLE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAccessTableViewCell textLabel](v4, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[WDAccessTableViewCell setAccessoryType:](v4, "setAccessoryType:", 1);
  }
  return v4;
}

@end
