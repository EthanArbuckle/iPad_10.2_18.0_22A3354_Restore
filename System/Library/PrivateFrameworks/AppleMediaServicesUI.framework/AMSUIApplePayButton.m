@implementation AMSUIApplePayButton

- (AMSUIApplePayButton)initWithButtonType:(int64_t)a3
{
  AMSUIApplePayButton *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSUIApplePayButton;
  v4 = -[AMSUIApplePayButton init](&v7, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(getPKPaymentButtonClass()), "initWithPaymentButtonType:paymentButtonStyle:", a3, 3);
    objc_msgSend(v5, "sizeToFit");
    objc_msgSend(v5, "setAutoresizingMask:", 18);
    -[AMSUIApplePayButton setButton:](v4, "setButton:", v5);
    -[AMSUIApplePayButton addSubview:](v4, "addSubview:", v5);

  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[AMSUIApplePayButton button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
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
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMSUIApplePayButton;
  -[AMSUIApplePayButton layoutSubviews](&v12, sel_layoutSubviews);
  -[AMSUIApplePayButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AMSUIApplePayButton button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
