@implementation HUPopUpButtonCell

- (HUPopUpButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUPopUpButtonCell *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  UIButton *button;
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
  void *v26;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)HUPopUpButtonCell;
  v4 = -[HUPopUpButtonCell initWithStyle:reuseIdentifier:](&v47, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitleLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBaseForegroundColor:", v6);

    objc_msgSend(v5, "contentInsets");
    v8 = v7;
    objc_msgSend(v5, "contentInsets");
    objc_msgSend(v5, "setContentInsets:", v8, 0.0);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", v5, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    button = v4->_button;
    v4->_button = (UIButton *)v9;

    -[UIButton setShowsMenuAsPrimaryAction:](v4->_button, "setShowsMenuAsPrimaryAction:", 1);
    -[UIButton setChangesSelectionAsPrimaryAction:](v4->_button, "setChangesSelectionAsPrimaryAction:", 1);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUPopUpButtonCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_button);

    -[HUPopUpButtonCell textLabel](v4, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPopUpButtonCell textLabel](v4, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPopUpButtonCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v19);

    -[HUPopUpButtonCell textLabel](v4, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPopUpButtonCell contentView](v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutMarginsGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v25);

    -[HUPopUpButtonCell textLabel](v4, "textLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPopUpButtonCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v31);

    -[UIButton leadingAnchor](v4->_button, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPopUpButtonCell textLabel](v4, "textLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:constant:", v34, 15.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v35);

    -[UIButton centerYAnchor](v4->_button, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPopUpButtonCell contentView](v4, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layoutMarginsGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v40);

    -[UIButton trailingAnchor](v4->_button, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPopUpButtonCell contentView](v4, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layoutMarginsGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v45);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v13);
  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUPopUpButtonCell;
  -[HUPopUpButtonCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HUPopUpButtonCell button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMenu:", 0);

  -[HUPopUpButtonCell setDisabled:](self, "setDisabled:", 0);
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[HUPopUpButtonCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPopUpButtonCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[HUPopUpButtonCell item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[HUPopUpButtonCell button](self, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:forState:", v23, 0);

  }
  -[HUPopUpButtonCell button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "menu");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HUPopUpButtonCell button](self, "button");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPopUpButtonCell _setPopupMenuButton:](self, "_setPopupMenuButton:", v13);

  }
  v14 = -[HUPopUpButtonCell isDisabled](self, "isDisabled") ^ 1;
  -[HUPopUpButtonCell button](self, "button");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", v14);

  if (-[HUPopUpButtonCell isDisabled](self, "isDisabled"))
  {
    -[HUPopUpButtonCell button](self, "button");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "menu");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "children");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "na_each:", &__block_literal_global_64);
    -[HUPopUpButtonCell button](self, "button");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "menu");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "menuByReplacingChildren:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPopUpButtonCell button](self, "button");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMenu:", v21);

  }
}

void __43__HUPopUpButtonCell_updateUIWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v5 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v5;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "setAttributes:", 1);
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (BOOL)isDisabled
{
  return self->disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->disabled = a3;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
