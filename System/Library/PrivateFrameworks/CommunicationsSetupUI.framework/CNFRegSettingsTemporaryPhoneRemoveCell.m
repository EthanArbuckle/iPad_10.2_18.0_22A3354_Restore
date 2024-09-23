@implementation CNFRegSettingsTemporaryPhoneRemoveCell

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNFRegSettingsTemporaryPhoneRemoveCell;
  -[PSTableCell layoutSubviews](&v7, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

}

@end
