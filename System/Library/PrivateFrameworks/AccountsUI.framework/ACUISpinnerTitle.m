@implementation ACUISpinnerTitle

- (ACUISpinnerTitle)initWithTitle:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  UILabel *titleView;
  uint64_t v10;
  UIActivityIndicatorView *spinner;
  ACUISpinnerTitle *v13;
  id v14;
  ACUISpinnerTitle *v15;
  objc_super v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id location[2];
  ACUISpinnerTitle *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = v22;
  CGRectMake();
  v17 = v3;
  v18 = v4;
  v19 = v5;
  v20 = v6;
  v22 = 0;
  v16.receiver = v15;
  v16.super_class = (Class)ACUISpinnerTitle;
  v22 = -[ACUISpinnerTitle initWithFrame:](&v16, sel_initWithFrame_, v3, v4, v5, v6);
  objc_storeStrong((id *)&v22, v22);
  if (v22)
  {
    v7 = objc_alloc(MEMORY[0x1E0CEA700]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleView = v22->_titleView;
    v22->_titleView = (UILabel *)v8;

    -[UILabel setText:](v22->_titleView, "setText:", location[0]);
    v14 = (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 18.0);
    -[UILabel setFont:](v22->_titleView, "setFont:");

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    spinner = v22->_spinner;
    v22->_spinner = (UIActivityIndicatorView *)v10;

    -[ACUISpinnerTitle addSubview:](v22, "addSubview:", v22->_titleView);
    -[ACUISpinnerTitle addSubview:](v22, "addSubview:", v22->_spinner);
  }
  v13 = v22;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v13;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  ACUISpinnerTitle *v4;

  v4 = self;
  v3 = a2;
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  v2.receiver = v4;
  v2.super_class = (Class)ACUISpinnerTitle;
  -[ACUISpinnerTitle dealloc](&v2, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
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

  -[UILabel sizeToFit](self->_titleView, "sizeToFit");
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[UILabel frame](self->_titleView, "frame");
  v13 = v3;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  if (v13 >= v4)
    v12 = v13;
  else
    v12 = v4;
  -[UILabel frame](self->_titleView, "frame");
  v10 = v5 + 10.0;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v11 = v10 + v6 + 10.0;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v8 = v11 + v7;
  v9 = v12;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  double v2;
  double v3;
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
  objc_super v14;
  SEL v15;
  ACUISpinnerTitle *v16;
  CGRect v17;

  v16 = self;
  v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)ACUISpinnerTitle;
  -[ACUISpinnerTitle layoutSubviews](&v14, sel_layoutSubviews);
  -[UILabel sizeToFit](v16->_titleView, "sizeToFit");
  -[UIActivityIndicatorView sizeToFit](v16->_spinner, "sizeToFit");
  -[ACUISpinnerTitle bounds](v16, "bounds");
  v13 = v2;
  -[UIActivityIndicatorView frame](v16->_spinner, "frame");
  -[UIActivityIndicatorView setFrame:](v16->_spinner, "setFrame:", v5, v4 + floor((v13 - v3) / 2.0), v6, v3);
  -[UILabel frame](v16->_titleView, "frame");
  v10 = v7;
  v11 = v8;
  v12 = v9;
  -[UIActivityIndicatorView frame](v16->_spinner, "frame");
  -[UILabel setFrame:](v16->_titleView, "setFrame:", CGRectGetMaxX(v17) + 10.0, v12 + floor((v13 - v11) / 2.0), v10, v11);
}

- (void)didMoveToWindow
{
  id v2;
  BOOL v3;

  v2 = (id)-[ACUISpinnerTitle window](self, "window");
  v3 = v2 == 0;

  if (v3)
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  else
    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
