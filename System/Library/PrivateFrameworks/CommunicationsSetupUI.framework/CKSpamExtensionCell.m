@implementation CKSpamExtensionCell

- (CKSpamExtensionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  CKSpamExtensionCell *v5;
  CKSpamExtensionCell *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKSpamExtensionCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v11, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[CKSpamExtensionCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextAlignment:", 2);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSpamExtensionCell detailTextLabel](v6, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

  }
  return v6;
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
    v4 = 3;
  else
    v4 = 0;
  -[CKSpamExtensionCell setAccessoryType:](self, "setAccessoryType:", v4);
  if (-[CKSpamExtensionCell isEnabled](self, "isEnabled"))
    v5 = 1;
  else
    v5 = 2;
  -[CKSpamExtensionCell setTintAdjustmentMode:](self, "setTintAdjustmentMode:", v5);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSpamExtensionCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[CKSpamExtensionCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)CKSpamExtensionCell;
  -[PSTableCell layoutSubviews](&v36, sel_layoutSubviews);
  -[CKSpamExtensionCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSpamExtensionCell detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = (id *)MEMORY[0x24BEBDF78];
  if (v7)
  {
    objc_msgSend(v5, "frame");
    v10 = v9;
    v12 = v11;
    v37 = *MEMORY[0x24BEBB360];
    objc_msgSend(v5, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(v5, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "frame");
      objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 0, v14, 0, v17, v18);
      v20 = v19;

    }
    else
    {
      v20 = 0.0;
    }

    v22 = objc_msgSend(*v8, "userInterfaceLayoutDirection");
    v23 = 10.0;
    if (!v22)
    {
      objc_msgSend(v3, "bounds", 10.0);
      v23 = v24 + -10.0 - v20;
    }
    objc_msgSend(v5, "setFrame:", v23, v10, v20, v12);
    v21 = v20 + 6.0;

  }
  else
  {
    v21 = 0.0;
  }
  objc_msgSend(v4, "frame");
  v26 = v25;
  v28 = v27;
  objc_msgSend(v3, "bounds");
  v30 = v29 + -10.0 + -16.0 - v21 + -55.0;
  if (objc_msgSend(*v8, "userInterfaceLayoutDirection"))
  {
    objc_msgSend(v3, "bounds");
    v32 = v31 - v30 + -55.0;
  }
  else
  {
    v32 = 55.0;
  }
  objc_msgSend(v4, "setFrame:", v32, v26, v30, v28);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "styleUsesCustomTableStyle")
    && (objc_msgSend(v33, "tableCellTextLabelColor"),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v34,
        v34))
  {
    objc_msgSend(v33, "tableCellTextLabelColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v35);

  }
  else
  {
    objc_msgSend(v4, "setTextColor:", 0);
  }

}

- (BOOL)usesStandardBackgroundImage
{
  return 1;
}

@end
