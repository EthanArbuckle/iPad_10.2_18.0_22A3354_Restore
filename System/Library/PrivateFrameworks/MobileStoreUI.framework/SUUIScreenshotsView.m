@implementation SUUIScreenshotsView

- (SUUIScreenshotsView)initWithFrame:(CGRect)a3
{
  SUUIScreenshotsView *v3;
  UIView *v4;
  UIView *separatorView;
  UIView *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIScreenshotsView;
  v3 = -[SUUIScreenshotsView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separatorView = v3->_separatorView;
    v3->_separatorView = v4;

    v6 = v3->_separatorView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SUUIScreenshotsView addSubview:](v3, "addSubview:", v3->_separatorView);
  }
  return v3;
}

- (void)setPrimaryView:(id)a3
{
  UIView *v5;
  UIView *primaryView;
  UIView *v7;

  v5 = (UIView *)a3;
  primaryView = self->_primaryView;
  if (primaryView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](primaryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_primaryView, a3);
    -[SUUIScreenshotsView addSubview:](self, "addSubview:", self->_primaryView);
    -[SUUIScreenshotsView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIView *primaryView;
  UIView *separatorView;
  double v9;
  double v10;
  void *v11;
  double v12;
  id v13;

  -[SUUIScreenshotsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  primaryView = self->_primaryView;
  if (primaryView)
    -[UIView setFrame:](primaryView, "setFrame:");
  if (self->_separatorView)
  {
    -[SUUIScreenshotsView bringSubviewToFront:](self, "bringSubviewToFront:");
    separatorView = self->_separatorView;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v10 = v6 - 1.0 / v9;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    -[UIView setFrame:](separatorView, "setFrame:", 15.0, v10, v4 + -15.0, 1.0 / v12);

  }
}

- (UIView)primaryView
{
  return self->_primaryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_primaryView, 0);
}

@end
