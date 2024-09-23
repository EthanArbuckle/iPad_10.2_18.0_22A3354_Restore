@implementation AMSUIWebViewImageWrapper

- (AMSUIWebViewImageWrapper)initWithView:(id)a3 topInset:(double)a4
{
  id v7;
  AMSUIWebViewImageWrapper *v8;
  AMSUIWebViewImageWrapper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebViewImageWrapper;
  v8 = -[AMSUICommonView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_view, a3);
    v9->_inset = a4;
    -[AMSUIWebViewImageWrapper addSubview:](v9, "addSubview:", v7);
  }

  return v9;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebViewImageWrapper;
  -[AMSUIWebViewImageWrapper layoutSubviews](&v12, sel_layoutSubviews);
  -[AMSUIWebViewImageWrapper inset](self, "inset");
  v4 = v3;
  -[AMSUIWebViewImageWrapper view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;
  -[AMSUIWebViewImageWrapper view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intrinsicContentSize");
  v10 = v9;
  -[AMSUIWebViewImageWrapper view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", 0.0, v4, v7, v10);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[AMSUIWebViewImageWrapper view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  -[AMSUIWebViewImageWrapper view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intrinsicContentSize");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (double)inset
{
  return self->_inset;
}

- (void)setInset:(double)a3
{
  self->_inset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
