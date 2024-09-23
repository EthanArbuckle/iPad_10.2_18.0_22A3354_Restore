@implementation WDAccountDetailDeleteButtonCell

- (WDAccountDetailDeleteButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDAccountDetailDeleteButtonCell *v4;
  WDAccountDetailDeleteButtonCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDAccountDetailDeleteButtonCell;
  v4 = -[WDAccountDetailDeleteButtonCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[WDAccountDetailDeleteButtonCell _setupUI](v4, "_setupUI");
  return v5;
}

- (void)_setupUI
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WDAccountDetailDeleteButtonCell setSelectionStyle:](self, "setSelectionStyle:", 3);
  -[WDAccountDetailDeleteButtonCell setAccessoryType:](self, "setAccessoryType:", 0);
  -[WDAccountDetailDeleteButtonCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAccountDetailDeleteButtonCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WDAccountDetailDeleteButtonCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

}

@end
