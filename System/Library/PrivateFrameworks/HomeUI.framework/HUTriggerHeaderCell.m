@implementation HUTriggerHeaderCell

- (HUTriggerHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUTriggerHeaderCell *v4;
  HUTriggerHeaderCell *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HUTriggerHeaderCell;
  v4 = -[HUTriggerHeaderCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HUTriggerHeaderCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerHeaderCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = objc_alloc(MEMORY[0x1E0CEA700]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HUTriggerHeaderCell setTitleLabel:](v5, "setTitleLabel:", v8);

    -[HUTriggerHeaderCell titleLabel](v5, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUTriggerHeaderCell titleLabel](v5, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerHeaderCell titleLabel](v5, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v11);

    -[HUTriggerHeaderCell contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerHeaderCell titleLabel](v5, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

    v5->_contentBottomMargin = 9.0;
    -[UITableViewCell removeMargins](v5, "removeMargins");
    -[HUTriggerHeaderCell setNeedsUpdateConstraints](v5, "setNeedsUpdateConstraints");
  }
  return v5;
}

- (void)setLayoutOptions:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_layoutOptions) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[HUTriggerHeaderCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[HUTriggerHeaderCell _updateTitleLabel](self, "_updateTitleLabel");
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUTriggerHeaderCell;
  -[HUTriggerHeaderCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUTriggerHeaderCell setContentBottomMargin:](self, "setContentBottomMargin:", 9.0);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[HUTriggerHeaderCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedUppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v5 == 0);

  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB590], 32770);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextAlignment:", 4);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);

  -[HUTriggerHeaderCell setLayoutMargins:](self, "setLayoutMargins:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  -[HUTriggerHeaderCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstBaselineAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerHeaderCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, 40.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerHeaderCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutMarginsGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerHeaderCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutMarginsGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastBaselineAnchor");
  v22 = objc_claimAutoreleasedReturnValue();
  -[HUTriggerHeaderCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerHeaderCell contentBottomMargin](self, "contentBottomMargin");
  objc_msgSend((id)v22, "constraintEqualToAnchor:constant:", v24, -v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  -[HUTriggerHeaderCell constraints](self, "constraints");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = objc_msgSend(v3, "isEqualToArray:", v27);

  if ((v22 & 1) == 0)
  {
    v28 = (void *)MEMORY[0x1E0CB3718];
    -[HUTriggerHeaderCell constraints](self, "constraints");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "deactivateConstraints:", v29);

    -[HUTriggerHeaderCell setConstraints:](self, "setConstraints:", v3);
    v30 = (void *)MEMORY[0x1E0CB3718];
    -[HUTriggerHeaderCell constraints](self, "constraints");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v31);

  }
  v32.receiver = self;
  v32.super_class = (Class)HUTriggerHeaderCell;
  -[HUTriggerHeaderCell updateConstraints](&v32, sel_updateConstraints);

}

- (void)_updateTitleLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[HUTriggerHeaderCell layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionHeaderFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[HUTriggerHeaderCell layoutOptions](self, "layoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[HUTriggerHeaderCell layoutOptions](self, "layoutOptions"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "contentColorStyle"),
        v7,
        v8 != 1))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v9;
  -[HUTriggerHeaderCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v11);

}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (double)contentBottomMargin
{
  return self->_contentBottomMargin;
}

- (void)setContentBottomMargin:(double)a3
{
  self->_contentBottomMargin = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
