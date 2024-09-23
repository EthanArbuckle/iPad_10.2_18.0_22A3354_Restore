@implementation AAUIProfileCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)AAUIProfileCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v30, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("AAUIPrimaryFontSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[AAUIProfileCell textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v6, "floatValue");
    objc_msgSend(v5, "scaledValueForValue:", v9);
    objc_msgSend(v8, "systemFontOfSize:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v10);

  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("AAUIPrimaryTextColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIProfileCell textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "setTextColor:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v14);

  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("AAUIDetailFontSize"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[AAUIProfileCell detailTextLabel](self, "detailTextLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v15, "floatValue");
    objc_msgSend(v5, "scaledValueForValue:", v18);
    objc_msgSend(v17, "systemFontOfSize:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v19);

  }
  -[AAUIProfileCell detailTextLabel](self, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80950]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v21);

  objc_msgSend(v4, "propertyForKey:", CFSTR("AAUIDetailTextColor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIProfileCell detailTextLabel](self, "detailTextLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22)
  {
    objc_msgSend(v23, "setTextColor:", v22);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGrayTextColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextColor:", v25);

  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("AAUIEvilMember"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  if (v27)
  {
    -[AAUIProfileCell detailTextLabel](self, "detailTextLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextColor:", v29);

  }
  -[AAUIProfileCell setNeedsLayout](self, "setNeedsLayout");

}

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
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AAUIProfileCell;
  -[PSTableCell layoutSubviews](&v13, sel_layoutSubviews);
  -[AAUIProfileCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AAUIProfileCell textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7 + -1.0, v9, v11);

}

@end
