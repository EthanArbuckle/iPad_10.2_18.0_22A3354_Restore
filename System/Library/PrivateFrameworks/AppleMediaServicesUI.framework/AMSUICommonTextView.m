@implementation AMSUICommonTextView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonTextView;
  -[AMSUICommonTextView layoutSubviews](&v3, sel_layoutSubviews);
  -[AMSUICommonTextView _centerTextIfNeeded](self, "_centerTextIfNeeded");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUICommonTextView;
  -[AMSUICommonTextView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[AMSUICommonTextView ams_delegate](self, "ams_delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_4;
  -[AMSUICommonTextView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    -[AMSUICommonTextView ams_delegate](self, "ams_delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_textViewDidUpdatePreferredContentSizeCategory:", self);
LABEL_4:

  }
}

- (void)_centerTextIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (-[AMSUICommonTextView centerText](self, "centerText"))
  {
    -[AMSUICommonTextView bounds](self, "bounds");
    -[AMSUICommonTextView sizeThatFits:](self, "sizeThatFits:", v3, 1.79769313e308);
    v5 = v4;
    -[AMSUICommonTextView bounds](self, "bounds");
    v7 = v6;
    -[AMSUICommonTextView zoomScale](self, "zoomScale");
    v9 = (v7 - v5 * v8) * 0.5;
    v10 = -0.0;
    if (v9 > 0.0)
      v10 = -v9;
    -[AMSUICommonTextView setContentOffset:](self, "setContentOffset:", 0.0, v10);
  }
}

- (AMSUICommonTextViewDelegate)ams_delegate
{
  return (AMSUICommonTextViewDelegate *)objc_loadWeakRetained((id *)&self->_ams_delegate);
}

- (void)setAms_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_ams_delegate, a3);
}

- (BOOL)centerText
{
  return self->_centerText;
}

- (void)setCenterText:(BOOL)a3
{
  self->_centerText = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ams_delegate);
}

@end
