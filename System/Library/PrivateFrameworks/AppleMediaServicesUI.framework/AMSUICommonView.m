@implementation AMSUICommonView

- (AMSUICommonView)init
{
  return -[AMSUICommonView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (AMSUICommonView)initWithCoder:(id)a3
{
  AMSUICommonView *v3;
  AMSUICommonView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonView;
  v3 = -[AMSUICommonView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AMSUICommonView _setup](v3, "_setup");
  return v4;
}

- (AMSUICommonView)initWithFrame:(CGRect)a3
{
  AMSUICommonView *v3;
  AMSUICommonView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonView;
  v3 = -[AMSUICommonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_edgesPropagatingSafeAreaInsetsToSubviews = 15;
    -[AMSUICommonView _setup](v3, "_setup");
  }
  return v4;
}

- (void)_setup
{
  -[AMSUICommonView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (id)tintColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSUICommonView;
  -[AMSUICommonView tintColor](&v7, sel_tintColor);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_appTint");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[AMSUICommonView accessibilityElementLabel](self, "accessibilityElementLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AMSUICommonView;
    -[AMSUICommonView accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSString)accessibilityElementLabel
{
  return self->_accessibilityElementLabel;
}

- (unint64_t)edgesPropagatingSafeAreaInsetsToSubviews
{
  return self->_edgesPropagatingSafeAreaInsetsToSubviews;
}

- (void)setEdgesPropagatingSafeAreaInsetsToSubviews:(unint64_t)a3
{
  self->_edgesPropagatingSafeAreaInsetsToSubviews = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityElementLabel, 0);
}

@end
