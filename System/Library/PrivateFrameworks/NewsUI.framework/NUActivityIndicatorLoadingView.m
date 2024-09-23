@implementation NUActivityIndicatorLoadingView

- (NUActivityIndicatorLoadingView)initWithActivityIndicatorStyle:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  NUActivityIndicatorLoadingView *v8;
  void *v9;
  uint64_t v10;
  UIActivityIndicatorView *activityIndicatorView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UILabel *label;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)NUActivityIndicatorLoadingView;
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = -[NUActivityIndicatorLoadingView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x24BDBF090], v5, v6, v7);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUActivityIndicatorLoadingView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", a3);
    activityIndicatorView = v8->_activityIndicatorView;
    v8->_activityIndicatorView = (UIActivityIndicatorView *)v10;

    -[UIActivityIndicatorView setHidesWhenStopped:](v8->_activityIndicatorView, "setHidesWhenStopped:", 1);
    v12 = (void *)MEMORY[0x24BDF6950];
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.45);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nu_dynamicColor:withDarkStyleVariant:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIActivityIndicatorView setColor:](v8->_activityIndicatorView, "setColor:", v15);
    -[NUActivityIndicatorLoadingView addSubview:](v8, "addSubview:", v8->_activityIndicatorView);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v4, v5, v6, v7);
    label = v8->_label;
    v8->_label = (UILabel *)v16;

    -[UILabel setTextAlignment:](v8->_label, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v8->_label, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 11.0, *MEMORY[0x24BDF7888]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_label, "setFont:", v18);

    NUBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24D5A3F98, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v8->_label, "setText:", v20);

    -[UILabel setTextColor:](v8->_label, "setTextColor:", v15);
    -[UILabel setAlpha:](v8->_label, "setAlpha:", 0.0);
    -[NUActivityIndicatorLoadingView addSubview:](v8, "addSubview:", v8->_label);

  }
  return v8;
}

- (NUActivityIndicatorLoadingView)initWithText:(id)a3 activityIndicatorStyle:(int64_t)a4
{
  id v6;
  NUActivityIndicatorLoadingView *v7;
  NUActivityIndicatorLoadingView *v8;

  v6 = a3;
  v7 = -[NUActivityIndicatorLoadingView initWithActivityIndicatorStyle:](self, "initWithActivityIndicatorStyle:", a4);
  v8 = v7;
  if (v7)
    -[UILabel setText:](v7->_label, "setText:", v6);

  return v8;
}

- (NUActivityIndicatorLoadingView)initWithFrame:(CGRect)a3
{
  return -[NUActivityIndicatorLoadingView initWithActivityIndicatorStyle:](self, "initWithActivityIndicatorStyle:", 100, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NUActivityIndicatorLoadingView)initWithCoder:(id)a3
{
  return -[NUActivityIndicatorLoadingView initWithActivityIndicatorStyle:](self, "initWithActivityIndicatorStyle:", 100);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)NUActivityIndicatorLoadingView;
  -[NUActivityIndicatorLoadingView layoutSubviews](&v22, sel_layoutSubviews);
  -[NUActivityIndicatorLoadingView center](self, "center");
  v4 = v3;
  v6 = v5;
  -[NUActivityIndicatorLoadingView activityIndicatorView](self, "activityIndicatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v4, v6);

  -[NUActivityIndicatorLoadingView label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

  -[NUActivityIndicatorLoadingView label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;

  -[NUActivityIndicatorLoadingView frame](self, "frame");
  v15 = (v14 - v11) * 0.5;
  -[NUActivityIndicatorLoadingView frame](self, "frame");
  v17 = (v16 - v13) * 0.5;
  -[NUActivityIndicatorLoadingView activityIndicatorView](self, "activityIndicatorView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v17 + v19;

  -[NUActivityIndicatorLoadingView label](self, "label");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v15, v20, v11, v13);

}

- (void)loadingViewStartAnimating
{
  void *v3;
  char v4;
  void *v5;
  _QWORD v6[5];

  -[NUActivityIndicatorLoadingView activityIndicatorView](self, "activityIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAnimating");

  if ((v4 & 1) == 0)
  {
    -[NUActivityIndicatorLoadingView activityIndicatorView](self, "activityIndicatorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startAnimating");

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __59__NUActivityIndicatorLoadingView_loadingViewStartAnimating__block_invoke;
    v6[3] = &unk_24D5A1D88;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0x10000, v6, 0, 0.5, 0.0);
  }
}

void __59__NUActivityIndicatorLoadingView_loadingViewStartAnimating__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "label");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)loadingViewStopAnimating
{
  void *v3;
  int v4;
  void *v5;
  _QWORD v6[5];

  -[NUActivityIndicatorLoadingView activityIndicatorView](self, "activityIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAnimating");

  if (v4)
  {
    -[NUActivityIndicatorLoadingView activityIndicatorView](self, "activityIndicatorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAnimating");

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__NUActivityIndicatorLoadingView_loadingViewStopAnimating__block_invoke;
    v6[3] = &unk_24D5A1D88;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0x20000, v6, 0, 0.5, 0.0);
  }
}

void __58__NUActivityIndicatorLoadingView_loadingViewStopAnimating__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "label");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
}

@end
