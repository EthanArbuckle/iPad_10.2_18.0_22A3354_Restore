@implementation CNFRegSettingsAccountCell

- (CNFRegSettingsAccountCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  CNFRegSettingsAccountCell *v5;
  CNFRegSettingsAccountCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNFRegSettingsAccountCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v13, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[CNFRegSettingsAccountCell setSelectionStyle:](v5, "setSelectionStyle:", 1);
    -[CNFRegSettingsAccountCell setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 1);
    -[PSTableCell valueLabel](v6, "valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v7, "setMinimumScaleFactor:", 0.823529412);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell titleLabel](v6, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell valueLabel](v6, "valueLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v10);

  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegSettingsAccountCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[CNFRegSettingsAccountCell setAccessoryType:](self, "setAccessoryType:", 0);
}

- (void)setValue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegSettingsAccountCell;
  -[PSTableCell setValue:](&v4, sel_setValue_, a3);
  -[CNFRegSettingsAccountCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)canReload
{
  return 1;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  _QWORD v31[2];
  _QWORD v32[3];
  CGRect v33;

  v32[2] = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)CNFRegSettingsAccountCell;
  -[PSTableCell layoutSubviews](&v30, sel_layoutSubviews);
  -[PSTableCell valueLabel](self, "valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "length") != 0;
  else
    v6 = 0;
  objc_msgSend(v3, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  -[CNFRegSettingsAccountCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;

  v16 = *MEMORY[0x24BDBF148];
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "setLineBreakMode:", 4);
    v19 = *MEMORY[0x24BEBB3A8];
    v31[0] = *MEMORY[0x24BEBB360];
    v31[1] = v19;
    v32[0] = v7;
    v32[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x24BEBB4A8]);
    objc_msgSend(v7, "pointSize");
    objc_msgSend(v21, "setMinimumScaleFactor:", 14.0 / v22);
    objc_msgSend(v3, "text");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length"))
    {
      objc_msgSend(v3, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "boundingRectWithSize:options:attributes:context:", 1, v20, v21, v13 + -32.0 + -4.0 - v10, v15);
      v16 = v25;

    }
    v27 = *MEMORY[0x24BDBF090];
    v26 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v28 = ceil(v16);
    if (objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection"))
      v29 = v13 - v28 - v10 + -4.0 + -16.0;
    else
      v29 = 16.0;
  }
  else
  {
    v27 = *MEMORY[0x24BDBF090];
    v26 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v28 = ceil(v16);
    v29 = floor((v13 - v10) * 0.5);
  }
  objc_msgSend(v8, "setFrame:", v29, v26, v10, v15);
  if (v6)
  {
    v33.origin.x = v29;
    v33.origin.y = v26;
    v33.size.width = v10;
    v33.size.height = v15;
    v27 = CGRectGetMaxX(v33) + 4.0;
  }
  objc_msgSend(v3, "setFrame:", v27, v26, v28, v15);

}

@end
