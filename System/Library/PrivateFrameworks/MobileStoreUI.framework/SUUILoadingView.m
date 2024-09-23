@implementation SUUILoadingView

- (SUUILoadingView)initWithFrame:(CGRect)a3
{
  SUUILoadingView *v3;
  uint64_t v4;
  UIActivityIndicatorView *spinner;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUILoadingView;
  v3 = -[SUUILoadingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;

    -[UIActivityIndicatorView sizeToFit](v3->_spinner, "sizeToFit");
    -[SUUILoadingView addSubview:](v3, "addSubview:", v3->_spinner);
  }
  return v3;
}

+ (id)defaultLoadingTextWithClientContext:(id)a3
{
  if (a3)
    objc_msgSend(a3, "localizedStringForKey:", CFSTR("DEFAULT_LOADING_TEXT"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DEFAULT_LOADING_TEXT"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)loadingText
{
  return -[UILabel text](self->_label, "text");
}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v4;
  SUUIColorScheme *colorScheme;
  uint64_t v6;
  id v7;

  if (self->_colorScheme != a3)
  {
    v4 = (SUUIColorScheme *)objc_msgSend(a3, "copy");
    colorScheme = self->_colorScheme;
    self->_colorScheme = v4;

    -[SUUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (id)v6;
    -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v6);
    -[UILabel setTextColor:](self->_label, "setTextColor:", v7);

  }
}

- (void)setLoadingText:(id)a3
{
  id v4;
  UILabel *label;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  id v16;

  v4 = a3;
  label = self->_label;
  v16 = v4;
  if (v4)
  {
    if (!label)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      v7 = self->_label;
      self->_label = v6;

      v8 = self->_label;
      -[SUUILoadingView backgroundColor](self, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

      v10 = self->_label;
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 11.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v10, "setFont:", v11);

      -[SUUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_label;
      if (v12)
      {
        -[UILabel setTextColor:](self->_label, "setTextColor:", v12);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v13, "setTextColor:", v15);

      }
      -[SUUILoadingView addSubview:](self, "addSubview:", self->_label);

      label = self->_label;
    }
    -[UILabel setText:](label, "setText:", v16);
    -[UILabel sizeToFit](self->_label, "sizeToFit");
    -[SUUILoadingView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UILabel removeFromSuperview](label, "removeFromSuperview");
    v14 = self->_label;
    self->_label = 0;

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIActivityIndicatorView *spinner;
  double v8;
  float v9;
  UILabel *label;
  double v11;
  float v12;
  double v13;

  -[SUUILoadingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  spinner = self->_spinner;
  if (spinner)
  {
    -[UIActivityIndicatorView frame](spinner, "frame");
    v9 = (v4 - v8) * 0.5;
    -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", floorf(v9), 0.0);
  }
  label = self->_label;
  if (label)
  {
    -[UILabel frame](label, "frame");
    v12 = (v4 - v11) * 0.5;
    -[UILabel setFrame:](self->_label, "setFrame:", floorf(v12), v6 - v13);
  }
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *label;
  id v5;
  objc_super v6;

  label = self->_label;
  v5 = a3;
  -[UILabel setBackgroundColor:](label, "setBackgroundColor:", v5);
  -[UIActivityIndicatorView setBackgroundColor:](self->_spinner, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUILoadingView;
  -[SUUILoadingView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIActivityIndicatorView *spinner;
  double v5;
  double width;
  double v7;
  double v8;
  UILabel *label;
  double v10;
  double v11;
  double v12;
  CGSize result;

  spinner = self->_spinner;
  if (spinner)
  {
    -[UIActivityIndicatorView frame](spinner, "frame", a3.width, a3.height);
    width = v5;
    -[UIActivityIndicatorView frame](self->_spinner, "frame");
    v8 = v7 + 0.0;
  }
  else
  {
    width = a3.width;
    v8 = 0.0;
  }
  label = self->_label;
  if (label)
  {
    -[UILabel sizeThatFits:](label, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    if (width < v10)
      width = v10;
    v8 = v8 + 18.0;
  }
  v11 = width;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  _BOOL4 v5;
  objc_super v6;

  v4 = a3;
  v5 = -[UIActivityIndicatorView isAnimating](self->_spinner, "isAnimating");
  if (v4)
  {
    if (!v5)
      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  }
  else if (v5)
  {
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  }
  v6.receiver = self;
  v6.super_class = (Class)SUUILoadingView;
  -[SUUILoadingView willMoveToSuperview:](&v6, sel_willMoveToSuperview_, v4);

}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end
