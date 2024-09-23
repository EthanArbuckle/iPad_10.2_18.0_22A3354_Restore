@implementation SUUIQuicklinkCollectionViewCell

- (void)dealloc
{
  objc_super v3;

  -[UIButton removeTarget:action:forControlEvents:](self->_linkButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUUIQuicklinkCollectionViewCell;
  -[SUUIQuicklinkCollectionViewCell dealloc](&v3, sel_dealloc);
}

- (void)configureForLink:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[SUUIQuicklinkCollectionViewCell _linkButton](self, "_linkButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);
    objc_msgSend(v7, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v6, 0);

    -[SUUIQuicklinkCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIButton setHidden:](self->_linkButton, "setHidden:", 1);
  }

}

- (void)setColoringWithColorScheme:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "secondaryTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v6, "primaryTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SUUIQuicklinkCollectionViewCell _linkButton](self, "_linkButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  UIButton *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIQuicklinkCollectionViewCell;
  -[SUUIQuicklinkCollectionViewCell hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDescendantOfView:", self))
  {
    v6 = self->_linkButton;

    v5 = v6;
  }
  return v5;
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
  float v11;
  float v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUUIQuicklinkCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v13, sel_layoutSubviews);
  if (self->_linkButton)
  {
    -[SUUIQuicklinkCollectionViewCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    -[UIButton sizeThatFits:](self->_linkButton, "sizeThatFits:", v5 + -15.0 + -15.0, 1.79769313e308);
    if (v5 + -15.0 + -15.0 >= v8)
      v10 = v8;
    else
      v10 = v5 + -15.0 + -15.0;
    v11 = (v5 - v10) * 0.5;
    v12 = (v7 - v9) * 0.5;
    -[UIButton setFrame:](self->_linkButton, "setFrame:", floorf(v11), floorf(v12));
  }
}

- (void)_linkButtonAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  SUUICollectionViewForView(self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "indexPathForCell:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView:didSelectItemAtIndexPath:", v6, v5);

  }
}

- (id)_linkButton
{
  UIButton *linkButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;

  linkButton = self->_linkButton;
  if (!linkButton)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_linkButton;
    self->_linkButton = v4;

    -[UIButton addTarget:action:forControlEvents:](self->_linkButton, "addTarget:action:forControlEvents:", self, sel__linkButtonAction_, 64);
    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[SUUIQuicklinkCollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_linkButton);

    linkButton = self->_linkButton;
  }
  return linkButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
}

@end
