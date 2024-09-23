@implementation CDPNavigationTitleLabel

- (CDPNavigationTitleLabel)initWithTitle:(id)a3
{
  id v4;
  CDPNavigationTitleLabel *v5;
  CDPNavigationTitleLabel *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDPNavigationTitleLabel;
  v5 = -[CDPNavigationTitleLabel init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CDPNavigationTitleLabel setText:](v5, "setText:", v4);
    -[CDPNavigationTitleLabel setNumberOfLines:](v6, "setNumberOfLines:", 2);
    -[CDPNavigationTitleLabel setTextAlignment:](v6, "setTextAlignment:", 1);
    -[CDPNavigationTitleLabel setLineBreakMode:](v6, "setLineBreakMode:", 4);
    v7 = (void *)MEMORY[0x24BEBB520];
    v8 = *MEMORY[0x24BEBE248];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredFontForTextStyle:compatibleWithTraitCollection:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPNavigationTitleLabel setFont:](v6, "setFont:", v11);

  }
  return v6;
}

@end
