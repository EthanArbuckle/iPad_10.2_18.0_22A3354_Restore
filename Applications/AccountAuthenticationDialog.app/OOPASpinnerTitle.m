@implementation OOPASpinnerTitle

- (OOPASpinnerTitle)initWithTitle:(id)a3
{
  id v4;
  OOPASpinnerTitle *v5;
  UILabel *v6;
  UILabel *titleView;
  void *v8;
  UIActivityIndicatorView *v9;
  UIActivityIndicatorView *spinner;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OOPASpinnerTitle;
  v5 = -[OOPASpinnerTitle initWithFrame:](&v12, "initWithFrame:", 0.0, 0.0, 0.0, 22.0);
  if (v5)
  {
    v6 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleView = v5->_titleView;
    v5->_titleView = v6;

    -[UILabel setText:](v5->_titleView, "setText:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 18.0));
    -[UILabel setFont:](v5->_titleView, "setFont:", v8);

    v9 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    spinner = v5->_spinner;
    v5->_spinner = v9;

    -[OOPASpinnerTitle addSubview:](v5, "addSubview:", v5->_titleView);
    -[OOPASpinnerTitle addSubview:](v5, "addSubview:", v5->_spinner);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)OOPASpinnerTitle;
  -[OOPASpinnerTitle dealloc](&v3, "dealloc");
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
  v11.super_class = (Class)OOPASpinnerTitle;
  -[OOPASpinnerTitle layoutSubviews](&v11, "layoutSubviews");
  -[UILabel sizeToFit](self->_titleView, "sizeToFit");
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[OOPASpinnerTitle bounds](self, "bounds");
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
