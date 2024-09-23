@implementation SUUIProductPageTableSeparatorView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIView *separatorView;
  UIView *v13;
  UIView *v14;
  UIView *v15;
  void *v16;

  -[SUUIProductPageTableSeparatorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = 1.0 / v8;

  v10 = v6 - v9;
  v11 = v4 + -15.0;
  separatorView = self->_separatorView;
  if (separatorView)
  {
    -[UIView setFrame:](separatorView, "setFrame:", 15.0, v10, v11, v9);
  }
  else
  {
    v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 15.0, v10, v11, v9);
    v14 = self->_separatorView;
    self->_separatorView = v13;

    v15 = self->_separatorView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[SUUIProductPageTableSeparatorView addSubview:](self, "addSubview:", self->_separatorView);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
