@implementation CNFRegAddAliasTableCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CNFRegAddAliasTableCell;
  -[PSTableCell layoutSubviews](&v21, sel_layoutSubviews);
  -[CNFRegAddAliasTableCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = 39.0;
  if (objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection"))
  {
    -[CNFRegAddAliasTableCell bounds](self, "bounds");
    v12 = v11;
    -[CNFRegAddAliasTableCell textLabel](self, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v10 = v12 - v14 + -39.0;

  }
  -[CNFRegAddAliasTableCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v17 = v16;

  if (v7 + 39.0 + 4.0 > v17)
  {
    -[CNFRegAddAliasTableCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "size");
    v7 = v19 + -39.0 + -4.0;

  }
  -[CNFRegAddAliasTableCell textLabel](self, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v10, v5, v7, v9);

}

@end
