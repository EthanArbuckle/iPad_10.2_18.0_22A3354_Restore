@implementation CNFRegAliasTableCell

- (CNFRegAliasTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  CNFRegAliasTableCell *v5;
  CNFRegAliasTableCell *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNFRegAliasTableCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v11, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[CNFRegAliasTableCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextAlignment:", 2);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegAliasTableCell detailTextLabel](v6, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CNFRegAliasTableCell spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");

  -[CNFRegAliasTableCell spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  v5.receiver = self;
  v5.super_class = (Class)CNFRegAliasTableCell;
  -[PSTableCell dealloc](&v5, sel_dealloc);
}

- (void)setIsTemporaryPhone:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v3 = a3;
  -[CNFRegAliasTableCell temporaryPhoneGlyph](self, "temporaryPhoneGlyph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BEBD668]);
      -[CNFRegAliasTableCell setTemporaryPhoneGlyph:](self, "setTemporaryPhoneGlyph:", v6);

      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("clock"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegAliasTableCell temporaryPhoneGlyph](self, "temporaryPhoneGlyph");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:", v7);

      objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegAliasTableCell temporaryPhoneGlyph](self, "temporaryPhoneGlyph");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v9);

      -[CNFRegAliasTableCell temporaryPhoneGlyph](self, "temporaryPhoneGlyph");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CNFRegAliasTableCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegAliasTableCell temporaryPhoneGlyph](self, "temporaryPhoneGlyph");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v13);

      -[CNFRegAliasTableCell temporaryPhoneGlyph](self, "temporaryPhoneGlyph");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trailingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegAliasTableCell contentView](self, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layoutMarginsGuide");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setActive:", 1);

      -[CNFRegAliasTableCell temporaryPhoneGlyph](self, "temporaryPhoneGlyph");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegAliasTableCell contentView](self, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "centerYAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setActive:", 1);

    }
  }
  else if (v5)
  {
    -[CNFRegAliasTableCell temporaryPhoneGlyph](self, "temporaryPhoneGlyph");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeFromSuperview");

    -[CNFRegAliasTableCell setTemporaryPhoneGlyph:](self, "setTemporaryPhoneGlyph:", 0);
  }
}

- (void)setHasSpinner:(BOOL)a3
{
  if (self->_hasSpinner != a3)
  {
    self->_hasSpinner = a3;
    -[CNFRegAliasTableCell _updateIcon](self, "_updateIcon");
    -[CNFRegAliasTableCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v3;

  v3 = (int)*MEMORY[0x24BE75770];
  if (*((_BYTE *)&self->super.super.super.super.super.isa + v3) != a3)
  {
    *((_BYTE *)&self->super.super.super.super.super.isa + v3) = a3;
    -[CNFRegAliasTableCell _updateIcon](self, "_updateIcon");
    -[CNFRegAliasTableCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  if (!self->_hasSpinner)
    goto LABEL_4;
  -[CNFRegAliasTableCell spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v7 = objc_alloc_init(MEMORY[0x24BEBD398]);
    -[CNFRegAliasTableCell setSpinner:](self, "setSpinner:", v7);

    -[CNFRegAliasTableCell spinner](self, "spinner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNFRegAliasTableCell spinner](self, "spinner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startAnimating");

    -[CNFRegAliasTableCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegAliasTableCell spinner](self, "spinner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[CNFRegAliasTableCell spinner](self, "spinner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegAliasTableCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutMarginsGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[CNFRegAliasTableCell spinner](self, "spinner");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegAliasTableCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    goto LABEL_7;
  }
  if (!self->_hasSpinner)
  {
LABEL_4:
    -[CNFRegAliasTableCell spinner](self, "spinner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CNFRegAliasTableCell spinner](self, "spinner");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stopAnimating");

      -[CNFRegAliasTableCell spinner](self, "spinner");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

      -[CNFRegAliasTableCell setSpinner:](self, "setSpinner:", 0);
    }
  }
LABEL_7:
  if (*((_BYTE *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75770]) && !self->_hasSpinner)
  {
    -[CNFRegAliasTableCell iconView](self, "iconView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      v26 = objc_alloc_init(MEMORY[0x24BEBD668]);
      -[CNFRegAliasTableCell setIconView:](self, "setIconView:", v26);

      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("checkmark"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegAliasTableCell iconView](self, "iconView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setImage:", v27);

      -[CNFRegAliasTableCell iconView](self, "iconView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CNFRegAliasTableCell contentView](self, "contentView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegAliasTableCell iconView](self, "iconView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addSubview:", v31);

      -[CNFRegAliasTableCell iconView](self, "iconView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegAliasTableCell contentView](self, "contentView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "layoutMarginsGuide");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setActive:", 1);

      -[CNFRegAliasTableCell iconView](self, "iconView");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "centerYAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegAliasTableCell contentView](self, "contentView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "centerYAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setActive:", 1);

    }
  }
  else
  {
    -[CNFRegAliasTableCell iconView](self, "iconView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[CNFRegAliasTableCell iconView](self, "iconView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeFromSuperview");

      -[CNFRegAliasTableCell setIconView:](self, "setIconView:", 0);
    }
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegAliasTableCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[CNFRegAliasTableCell _updateIcon](self, "_updateIcon");
  -[CNFRegAliasTableCell setNeedsLayout](self, "setNeedsLayout");
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
  v36.super_class = (Class)CNFRegAliasTableCell;
  -[PSTableCell layoutSubviews](&v36, sel_layoutSubviews);
  -[CNFRegAliasTableCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegAliasTableCell detailTextLabel](self, "detailTextLabel");
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
  v30 = v29 + -10.0 + -16.0 - v21 + -60.0;
  if (objc_msgSend(*v8, "userInterfaceLayoutDirection"))
  {
    objc_msgSend(v3, "bounds");
    v32 = v31 - v30 + -60.0;
  }
  else
  {
    v32 = 60.0;
  }
  objc_msgSend(v4, "setFrame:", v32, v26, v30, v28);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "styleUsesCustomTableStyle"))
  {
    objc_msgSend(v33, "tableCellTextLabelColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v33, "tableCellTextLabelColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTextColor:", v35);

    }
  }
  -[CNFRegAliasTableCell _updateIcon](self, "_updateIcon");
  -[CNFRegAliasTableCell setAccessoryType:](self, "setAccessoryType:", 0);

}

- (BOOL)usesStandardBackgroundImage
{
  return 1;
}

- (BOOL)hasSpinner
{
  return self->_hasSpinner;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (UIImageView)temporaryPhoneGlyph
{
  return self->_temporaryPhoneGlyph;
}

- (void)setTemporaryPhoneGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryPhoneGlyph, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_temporaryPhoneGlyph, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
