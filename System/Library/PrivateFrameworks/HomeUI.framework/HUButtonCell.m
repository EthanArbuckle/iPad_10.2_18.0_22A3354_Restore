@implementation HUButtonCell

- (HUButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUButtonCell *v4;
  HUButtonCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUButtonCell;
  v4 = -[HUButtonCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HUButtonCell setTextColorFollowsTintColor:](v4, "setTextColorFollowsTintColor:", 1);
    -[HUButtonCell setTextAlignment:](v5, "setTextAlignment:", 4);
    -[HUButtonCell setHideTitle:](v5, "setHideTitle:", 0);
    -[HUButtonCell textLabel](v5, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

  }
  return v5;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4;

  self->_textAlignment = a3;
  -[HUButtonCell textLabel](self, "textLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", a3);

}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
  -[HUButtonCell updateTitle](self, "updateTitle");
}

- (void)setTextColorFollowsTintColor:(BOOL)a3
{
  self->_textColorFollowsTintColor = a3;
  -[HUButtonCell updateTitle](self, "updateTitle");
}

- (void)setHideTitle:(BOOL)a3
{
  _BOOL8 v4;
  id v5;

  self->_hideTitle = a3;
  v4 = -[HUButtonCell hideTitle](self, "hideTitle");
  -[HUButtonCell textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUButtonCell;
  -[HUButtonCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUButtonCell setDestructive:](self, "setDestructive:", 0);
  -[HUButtonCell setTextColorFollowsTintColor:](self, "setTextColorFollowsTintColor:", 1);
  -[HUButtonCell setTextAlignment:](self, "setTextAlignment:", 4);
  -[HUButtonCell setHideTitle:](self, "setHideTitle:", 0);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUButtonCell;
  -[HUButtonCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HUButtonCell updateTitle](self, "updateTitle");
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUButtonCell;
  -[HUButtonCell didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[HUButtonCell updateTitle](self, "updateTitle");
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

  -[HUButtonCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUButtonCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[HUButtonCell item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUButtonCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10);

  -[HUButtonCell updateTitle](self, "updateTitle");
}

- (void)updateTitle
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[HUButtonCell textAlignment](self, "textAlignment");
  if (-[HUButtonCell textColorFollowsTintColor](self, "textColorFollowsTintColor"))
  {
    -[HUButtonCell tintColor](self, "tintColor");
    v4 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v4;
  }
  if (-[HUButtonCell isDestructive](self, "isDestructive"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = 4;
    v9 = (id)v5;
  }
  if (-[HUButtonCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v6 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v6;
  }
  -[HUButtonCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v9);

  -[HUButtonCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextAlignment:", v3);

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

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)textColorFollowsTintColor
{
  return self->_textColorFollowsTintColor;
}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
