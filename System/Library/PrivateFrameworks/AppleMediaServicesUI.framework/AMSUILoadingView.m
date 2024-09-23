@implementation AMSUILoadingView

- (AMSUILoadingView)initWithFrame:(CGRect)a3
{
  AMSUILoadingView *v3;
  uint64_t v4;
  UIActivityIndicatorView *activityIndicator;
  id v6;
  uint64_t v7;
  UILabel *label;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AMSUILoadingView;
  v3 = -[AMSUICommonView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v4;

    -[UIActivityIndicatorView setHidesWhenStopped:](v3->_activityIndicator, "setHidesWhenStopped:", 0);
    -[AMSUILoadingView addSubview:](v3, "addSubview:", v3->_activityIndicator);
    v6 = objc_alloc(MEMORY[0x24BEBD708]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v7;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v9);

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    -[UILabel setText:](v3->_label, "setText:", &stru_24CB5A078);
    -[AMSUILoadingView addSubview:](v3, "addSubview:", v3->_label);
  }
  return v3;
}

- (void)setLoadingText:(id)a3
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  id v8;

  v5 = &stru_24CB5A078;
  if (a3)
    v5 = (__CFString *)a3;
  v6 = v5;
  v8 = a3;
  -[AMSUILoadingView label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

}

- (void)startAnimating
{
  id v2;

  -[AMSUILoadingView activityIndicator](self, "activityIndicator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAnimating");

}

- (void)stopAnimating
{
  id v2;

  -[AMSUILoadingView activityIndicator](self, "activityIndicator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

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
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)AMSUILoadingView;
  -[AMSUILoadingView layoutSubviews](&v33, sel_layoutSubviews);
  -[AMSUILoadingView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[AMSUILoadingView safeAreaInsets](self, "safeAreaInsets");
  v9 = v4 - (v7 + v8);
  v12 = v6 - (v10 + v11);
  v13 = v9 + -30.0;
  -[AMSUILoadingView activityIndicator](self, "activityIndicator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", v13, v12);
  v16 = v15;
  v18 = v17;

  -[AMSUILoadingView label](self, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeThatFits:", v13, v12);
  v21 = v20;
  v23 = v22;

  -[AMSUILoadingView bounds](self, "bounds");
  v25 = v24 * 0.5 - (v18 + v23 + 7.0) * 0.5;
  -[AMSUILoadingView bounds](self, "bounds");
  v27 = v26 * 0.5 - v16 * 0.5;
  -[AMSUILoadingView activityIndicator](self, "activityIndicator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v27, v25, v16, v18);

  v29 = v18 + 7.0 + v25;
  -[AMSUILoadingView bounds](self, "bounds");
  v31 = v30 * 0.5 - v21 * 0.5;
  -[AMSUILoadingView label](self, "label");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v31, v29, v21, v23);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[AMSUILoadingView activityIndicator](self, "activityIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  -[AMSUILoadingView label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", width, height);
  v13 = v12;
  v15 = v14;

  if (v8 >= v13)
    v16 = v8;
  else
    v16 = v13;
  v17 = v10 + 7.0 + v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
