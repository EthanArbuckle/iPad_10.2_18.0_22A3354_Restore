@implementation SRBigButtonController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonView button](self->_buttonView, "button"));
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, "_bigButtonHit:", 64);

  v4.receiver = self;
  v4.super_class = (Class)SRBigButtonController;
  -[SRBigButtonController dealloc](&v4, "dealloc");
}

- (void)setAceObject:(id)a3
{
  SAUIButton *v4;
  SAUIButton *buttonObject;
  objc_super v6;

  v4 = (SAUIButton *)a3;
  v6.receiver = self;
  v6.super_class = (Class)SRBigButtonController;
  -[SRBigButtonController setAceObject:](&v6, "setAceObject:", v4);
  buttonObject = self->_buttonObject;
  self->_buttonObject = v4;

}

- (id)snippet
{
  return 0;
}

- (UIEdgeInsets)defaultViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)usePlatterStyle
{
  return 1;
}

- (void)loadView
{
  SRBigButtonView *v3;
  SRBigButtonView *buttonView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!self->_buttonView)
  {
    v3 = -[SRBigButtonView initWithFrame:]([SRBigButtonView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    buttonView = self->_buttonView;
    self->_buttonView = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonView button](self->_buttonView, "button"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIButton text](self->_buttonObject, "text"));
    objc_msgSend(v5, "setTitle:forState:", v6, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonView button](self->_buttonView, "button"));
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, "_bigButtonHit:", 64);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonView button](self->_buttonView, "button"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    objc_msgSend(v9, "setCornerRadius:", 9.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonView button](self->_buttonView, "button"));
    objc_msgSend(v10, "setRole:", 0);

    -[SRBigButtonController setView:](self, "setView:", self->_buttonView);
  }
}

- (double)desiredHeightForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonController view](self, "view"));
  objc_msgSend(v4, "sizeThatFits:", a3, 1.79769313e308);
  v6 = v5;

  return v6;
}

- (void)_bigButtonHit:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRBigButtonController delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIButton commands](self->_buttonObject, "commands"));
  objc_msgSend(v5, "siriViewController:performAceCommands:", self, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonObject, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
}

@end
