@implementation SL_OOPASpinnerTitle

- (SL_OOPASpinnerTitle)init
{
  SL_OOPASpinnerTitle *v2;
  id v3;
  uint64_t v4;
  UILabel *titleView;
  void *v6;
  uint64_t v7;
  UIActivityIndicatorView *spinner;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SL_OOPASpinnerTitle;
  v2 = -[SL_OOPASpinnerTitle initWithFrame:](&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 22.0);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA700]);
    v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleView = v2->_titleView;
    v2->_titleView = (UILabel *)v4;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 18.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_titleView, "setFont:", v6);

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    spinner = v2->_spinner;
    v2->_spinner = (UIActivityIndicatorView *)v7;

    -[SL_OOPASpinnerTitle addSubview:](v2, "addSubview:", v2->_titleView);
    -[SL_OOPASpinnerTitle addSubview:](v2, "addSubview:", v2->_spinner);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)SL_OOPASpinnerTitle;
  -[SL_OOPASpinnerTitle dealloc](&v3, sel_dealloc);
}

- (NSString)title
{
  return -[UILabel text](self->_titleView, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleView, "setText:", a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[UILabel sizeToFit](self->_titleView, "sizeToFit", a3.width, a3.height);
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[UILabel frame](self->_titleView, "frame");
  v5 = v4;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  if (v5 < v6)
    v5 = v6;
  -[UILabel frame](self->_titleView, "frame");
  v8 = v7 + 10.0;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v10 = v8 + v9 + 10.0;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v12 = v10 + v11;
  v13 = v5;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)SL_OOPASpinnerTitle;
  -[SL_OOPASpinnerTitle layoutSubviews](&v11, sel_layoutSubviews);
  -[UILabel sizeToFit](self->_titleView, "sizeToFit");
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[SL_OOPASpinnerTitle bounds](self, "bounds");
  v4 = v3;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  -[UILabel frame](self->_titleView, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  -[UILabel setFrame:](self->_titleView, "setFrame:", CGRectGetMaxX(v12) + 10.0, v6 + floor((v4 - v10) * 0.5), v8, v10);
}

- (void)startAnimating
{
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void)stopAnimating
{
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
