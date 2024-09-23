@implementation AXLongTitleSwitchTableCell

- (AXLongTitleSwitchTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AXLongTitleSwitchTableCell *v5;
  AXLongTitleSwitchTableCell *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXLongTitleSwitchTableCell;
  v5 = -[PSSwitchTableCell initWithStyle:reuseIdentifier:specifier:](&v9, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSTableCell titleLabel](v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

  }
  return v6;
}

@end
