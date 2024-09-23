@implementation AVHomeLoadingButtonControlItem

- (AVHomeLoadingButtonControlItem)initWithTitle:(id)a3 type:(int64_t)a4
{
  id v6;
  AVHomeLoadingButtonControlItem *v7;
  AVLoadingButtonView *v8;
  AVLoadingButtonView *loadingButtonView;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVHomeLoadingButtonControlItem;
  v7 = -[AVControlItem initWithTitle:type:](&v12, sel_initWithTitle_type_, v6, a4);
  if (v7)
  {
    v8 = -[AVLoadingButtonView initWithTitle:]([AVLoadingButtonView alloc], "initWithTitle:", v6);
    loadingButtonView = v7->_loadingButtonView;
    v7->_loadingButtonView = v8;

    -[AVLoadingButtonView button](v7->_loadingButtonView, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", v7, sel__buttonTouchUpInside_, 64);

  }
  return v7;
}

- (void)_buttonTouchUpInside:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[AVControlItem action](self, "action", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVControlItem action](self, "action");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AVHomeLoadingButtonControlItem loadingButtonView](self, "loadingButtonView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsLoadingIndicator:", v3);

}

- (BOOL)showsLoadingIndicator
{
  void *v2;
  char v3;

  -[AVHomeLoadingButtonControlItem loadingButtonView](self, "loadingButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsLoadingIndicator");

  return v3;
}

- (id)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id obj;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  if ((-[UIFont isEqual:](self->_titleFont, "isEqual:", v4) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, obj);
    -[AVHomeLoadingButtonControlItem loadingButtonView](self, "loadingButtonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", obj);

  }
}

- (void)_updateTintColor
{
  void *v3;
  void *v4;
  id v5;

  -[AVControlItem tintColor](self, "tintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVHomeLoadingButtonControlItem loadingButtonView](self, "loadingButtonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVBackdropView applyGlyphTintColor:toView:](AVBackdropView, "applyGlyphTintColor:toView:", v5, v4);

}

- (AVLoadingButtonView)loadingButtonView
{
  return self->_loadingButtonView;
}

- (void)setLoadingButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingButtonView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingButtonView, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
}

@end
