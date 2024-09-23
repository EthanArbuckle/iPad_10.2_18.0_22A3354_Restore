@implementation HUColoredButtonCell

- (HUColoredButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUColoredButtonCell *v4;
  uint64_t v5;
  UIColor *buttonBackgroundColor;
  HUColoredButton *v7;
  uint64_t v8;
  HUColoredButton *button;
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
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)HUColoredButtonCell;
  v4 = -[HUColoredButtonCell initWithStyle:reuseIdentifier:](&v38, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v5 = objc_claimAutoreleasedReturnValue();
    buttonBackgroundColor = v4->_buttonBackgroundColor;
    v4->_buttonBackgroundColor = (UIColor *)v5;

    v7 = [HUColoredButton alloc];
    v8 = -[HUColoredButton initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    button = v4->_button;
    v4->_button = (HUColoredButton *)v8;

    -[HUColoredButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUColoredButton setBackgroundColor:](v4->_button, "setBackgroundColor:", v4->_buttonBackgroundColor);
    -[HUColoredButton addTarget:action:forControlEvents:](v4->_button, "addTarget:action:forControlEvents:", v4, sel_buttonPressed_, 64);
    -[HUColoredButtonCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v4->_button);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColoredButtonCell setBackgroundColor:](v4, "setBackgroundColor:", v11);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColoredButtonCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColoredButton leadingAnchor](v4->_button, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColoredButtonCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v19);

    -[HUColoredButton trailingAnchor](v4->_button, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColoredButtonCell contentView](v4, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v24);

    -[HUColoredButton topAnchor](v4->_button, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColoredButtonCell contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v28, 8.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v29);

    -[HUColoredButton bottomAnchor](v4->_button, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColoredButtonCell contentView](v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutMarginsGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v33, 8.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v34);

    -[HUColoredButton heightAnchor](v4->_button, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", 56.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v36);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v14);
  }
  return v4;
}

- (void)buttonPressed:(id)a3
{
  id v4;

  -[HUColoredButtonCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coloredButtonCellPressed:", self);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUColoredButtonCell;
  -[HUColoredButtonCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HUColoredButtonCell updateButtonColor](self, "updateButtonColor");
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUColoredButtonCell;
  -[HUColoredButtonCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HUColoredButtonCell setDisabled:](self, "setDisabled:", 0);
  -[HUColoredButtonCell setItem:](self, "setItem:", 0);
  -[HUColoredButtonCell setButtonColorFollowsTintColor:](self, "setButtonColorFollowsTintColor:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUColoredButtonCell setButtonBackgroundColor:](self, "setButtonBackgroundColor:", v3);

}

- (void)setButtonColorFollowsTintColor:(BOOL)a3
{
  self->_buttonColorFollowsTintColor = a3;
  -[HUColoredButtonCell updateButtonColor](self, "updateButtonColor");
}

- (void)setButtonBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonBackgroundColor, a3);
  -[HUColoredButtonCell updateButtonColor](self, "updateButtonColor");
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUColoredButtonCell button](self, "button", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUColoredButtonCell item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v6, 0);

}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  -[HUColoredButtonCell updateButtonColor](self, "updateButtonColor");
}

- (void)updateButtonColor
{
  uint64_t v3;
  void *v4;
  id v5;

  if (-[HUColoredButtonCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "_externalSystemMidGrayColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[HUColoredButtonCell buttonColorFollowsTintColor](self, "buttonColorFollowsTintColor"))
      -[HUColoredButtonCell tintColor](self, "tintColor");
    else
      -[HUColoredButtonCell buttonBackgroundColor](self, "buttonBackgroundColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v3;
  -[HUColoredButtonCell button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

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
  return self->_disabled;
}

- (HUColoredButtonCellDelegate)delegate
{
  return (HUColoredButtonCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)buttonColorFollowsTintColor
{
  return self->_buttonColorFollowsTintColor;
}

- (UIColor)buttonBackgroundColor
{
  return self->_buttonBackgroundColor;
}

- (HUColoredButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
