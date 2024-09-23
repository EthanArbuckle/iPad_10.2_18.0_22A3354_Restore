@implementation AMSUIErrorView

- (AMSUIErrorView)initWithFrame:(CGRect)a3 title:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  __CFString *v9;
  AMSUIErrorView *v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  _UIContentUnavailableView *backingView;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (__CFString *)a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIErrorView;
  v10 = -[AMSUICommonView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BEBDBB0]);
    if (v9)
      v12 = v9;
    else
      v12 = &stru_24CB5A078;
    v13 = objc_msgSend(v11, "initWithFrame:title:style:", v12, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    backingView = v10->_backingView;
    v10->_backingView = (_UIContentUnavailableView *)v13;

    -[AMSUIErrorView addSubview:](v10, "addSubview:", v10->_backingView);
  }

  return v10;
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
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMSUIErrorView;
  -[AMSUIErrorView layoutSubviews](&v12, sel_layoutSubviews);
  -[AMSUIErrorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AMSUIErrorView backingView](self, "backingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (id)buttonAction
{
  void *v2;
  void *v3;

  -[AMSUIErrorView backingView](self, "backingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)buttonTitle
{
  void *v2;
  void *v3;

  -[AMSUIErrorView backingView](self, "backingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)message
{
  void *v2;
  void *v3;

  -[AMSUIErrorView backingView](self, "backingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[AMSUIErrorView backingView](self, "backingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setButtonAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIErrorView backingView](self, "backingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonAction:", v4);

}

- (void)setButtonTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIErrorView backingView](self, "backingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonTitle:", v4);

}

- (void)setMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIErrorView backingView](self, "backingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v4);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIErrorView backingView](self, "backingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)_handleButtonTap
{
  void *v3;
  void (**v4)(void);

  -[AMSUIErrorView buttonAction](self, "buttonAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIErrorView buttonAction](self, "buttonAction");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (_UIContentUnavailableView)backingView
{
  return self->_backingView;
}

- (void)setBackingView:(id)a3
{
  objc_storeStrong((id *)&self->_backingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingView, 0);
}

@end
