@implementation HUFootnoteButtonCell

- (HUFootnoteButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUFootnoteButtonCell *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIButton *titleButton;
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
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)HUFootnoteButtonCell;
  v4 = -[HUFootnoteButtonCell initWithStyle:reuseIdentifier:](&v32, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFootnoteButtonCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFootnoteButtonCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    titleButton = v4->_titleButton;
    v4->_titleButton = (UIButton *)v8;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v4->_titleButton, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    -[UIButton titleLabel](v4->_titleButton, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextAlignment:", 1);

    -[UIButton setUserInteractionEnabled:](v4->_titleButton, "setUserInteractionEnabled:", 0);
    -[HUFootnoteButtonCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_titleButton);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v4->_titleButton, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFootnoteButtonCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

    -[UIButton trailingAnchor](v4->_titleButton, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFootnoteButtonCell contentView](v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v22);

    -[UIButton topAnchor](v4->_titleButton, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFootnoteButtonCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v26);

    -[UIButton bottomAnchor](v4->_titleButton, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFootnoteButtonCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v30);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v14);
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUFootnoteButtonCell;
  -[HUFootnoteButtonCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUFootnoteButtonCell setItem:](self, "setItem:", 0);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUFootnoteButtonCell;
  -[HUFootnoteButtonCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HUFootnoteButtonCell _updateTextColor](self, "_updateTextColor");
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUFootnoteButtonCell;
  -[HUFootnoteButtonCell didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[HUFootnoteButtonCell _updateTextColor](self, "_updateTextColor");
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUFootnoteButtonCell;
  -[HUFootnoteButtonCell setHighlighted:animated:](&v7, sel_setHighlighted_animated_, a3, a4);
  -[HUFootnoteButtonCell titleButton](self, "titleButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlighted:", v4);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUFootnoteButtonCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HUFootnoteButtonCell titleButton](self, "titleButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v6, 0);

  -[HUFootnoteButtonCell _updateTextColor](self, "_updateTextColor");
  -[HUFootnoteButtonCell setSelectionStyle:](self, "setSelectionStyle:", 0);

}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  -[HUFootnoteButtonCell _updateTextColor](self, "_updateTextColor");
}

- (void)_updateTextColor
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  -[HUFootnoteButtonCell tintColor](self, "tintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[HUFootnoteButtonCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v3 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v3;
  }
  -[HUFootnoteButtonCell titleButton](self, "titleButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

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

- (UIButton)titleButton
{
  return self->_titleButton;
}

- (void)setTitleButton:(id)a3
{
  objc_storeStrong((id *)&self->_titleButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
