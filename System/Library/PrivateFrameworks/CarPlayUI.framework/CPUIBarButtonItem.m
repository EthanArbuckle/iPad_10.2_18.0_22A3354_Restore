@implementation CPUIBarButtonItem

- (CPUIBarButtonItem)initWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 type:(unint64_t)a6
{
  void *v7;
  CPUIBarButtonItem *v8;

  +[CPUIBarButton buttonWithTitle:image:style:type:](CPUIBarButton, "buttonWithTitle:image:style:type:", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CPUIBarButtonItem initWithCustomView:](self, "initWithCustomView:", v7);
  if (v8)
  {
    objc_msgSend(v7, "sizeToFit");
    objc_msgSend(v7, "setCpui_delegate:", v8);
  }

  return v8;
}

- (id)_barButton
{
  id v3;
  id v4;

  objc_opt_class();
  -[CPUIBarButtonItem customView](self, "customView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[CPUIBarButtonItem _barButton](self, "_barButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPUIBarButtonItem _barButton](self, "_barButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonFont:", v4);

}

- (UIColor)normalColor
{
  void *v2;
  void *v3;

  -[CPUIBarButtonItem _barButton](self, "_barButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setNormalColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPUIBarButtonItem _barButton](self, "_barButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNormalColor:", v4);

}

- (UIColor)focusedColor
{
  void *v2;
  void *v3;

  -[CPUIBarButtonItem _barButton](self, "_barButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setFocusedColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPUIBarButtonItem _barButton](self, "_barButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFocusedColor:", v4);

}

- (UIColor)normalBackgroundColor
{
  void *v2;
  void *v3;

  -[CPUIBarButtonItem _barButton](self, "_barButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setNormalBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPUIBarButtonItem _barButton](self, "_barButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNormalBackgroundColor:", v4);

}

- (UIColor)focusedBackgroundColor
{
  void *v2;
  void *v3;

  -[CPUIBarButtonItem _barButton](self, "_barButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setFocusedBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPUIBarButtonItem _barButton](self, "_barButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFocusedBackgroundColor:", v4);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CPUIBarButtonItem;
  -[CPUIBarButtonItem setEnabled:](&v6, sel_setEnabled_);
  -[CPUIBarButtonItem button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPUIBarButtonItem button](self, "button");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CPUIBarButtonItem button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIBarButtonItem normalColor](self, "normalColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_flatImageWithColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v7, 0);

  -[CPUIBarButtonItem button](self, "button");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CPUIBarButtonItem focusedColor](self, "focusedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_flatImageWithColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setImage:forState:", v9, 8);
}

- (void)didSelectButton:(id)a3 withInteractionModel:(unint64_t)a4
{
  void *v6;
  char v7;
  id v8;

  -[CPUIBarButtonItem cpui_delegate](self, "cpui_delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CPUIBarButtonItem cpui_delegate](self, "cpui_delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didSelectButton:withInteractionModel:", self, a4);

  }
}

- (CPUIButtonDelegate)cpui_delegate
{
  return (CPUIButtonDelegate *)objc_loadWeakRetained((id *)&self->_cpui_delegate);
}

- (void)setCpui_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_cpui_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cpui_delegate);
}

@end
