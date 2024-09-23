@implementation SUUIGiftAmountButton

- (SUUIGiftAmountButton)initWithFrame:(CGRect)a3
{
  SUUIGiftAmountButton *v3;
  UIView *v4;
  UIView *borderView;
  UIView *v6;
  void *v7;
  UIView *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SUUIGiftAmountButton;
  v3 = -[SUUIGiftAmountButton initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    borderView = v3->_borderView;
    v3->_borderView = v4;

    -[UIView setAutoresizingMask:](v3->_borderView, "setAutoresizingMask:", 18);
    v6 = v3->_borderView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = v3->_borderView;
    -[SUUIGiftAmountButton bounds](v3, "bounds");
    -[UIView setFrame:](v8, "setFrame:");
    -[UIView setUserInteractionEnabled:](v3->_borderView, "setUserInteractionEnabled:", 0);
    -[SUUIGiftAmountButton addSubview:](v3, "addSubview:", v3->_borderView);
    -[UIView layer](v3->_borderView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    objc_msgSend(v9, "setBorderWidth:", 1.0 / v12);

    objc_msgSend(v9, "setCornerRadius:", 7.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftAmountButton setTitleColor:forState:](v3, "setTitleColor:forState:", v13, 0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftAmountButton setTitleColor:forState:](v3, "setTitleColor:forState:", v14, 1);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftAmountButton setTitleColor:forState:](v3, "setTitleColor:forState:", v15, 4);

    -[SUUIGiftAmountButton titleLabel](v3, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v17);

    -[SUUIGiftAmountButton titleLabel](v3, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMinimumScaleFactor:", 0.5);

    -[SUUIGiftAmountButton titleLabel](v3, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAdjustsFontSizeToFitWidth:", 1);

    -[SUUIGiftAmountButton titleLabel](v3, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNumberOfLines:", 1);

    -[SUUIGiftAmountButton titleLabel](v3, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLineBreakMode:", 2);

    -[SUUIGiftAmountButton setTitleEdgeInsets:](v3, "setTitleEdgeInsets:", 0.0, 5.0, 0.0, 5.0);
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftAmountButton;
  -[SUUIGiftAmountButton drawRect:](&v4, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SUUIGiftAmountButton _reloadBorderView](self, "_reloadBorderView");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftAmountButton;
  -[SUUIGiftAmountButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SUUIGiftAmountButton _reloadBorderView](self, "_reloadBorderView");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftAmountButton;
  -[SUUIGiftAmountButton setSelected:](&v4, sel_setSelected_, a3);
  -[SUUIGiftAmountButton _reloadBorderView](self, "_reloadBorderView");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)SUUIGiftAmountButton;
  -[SUUIGiftAmountButton sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  v4 = 44.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_reloadBorderView
{
  void *v3;
  void *v4;
  void *v5;
  UIView *borderView;
  void *v7;
  id v8;

  if ((-[SUUIGiftAmountButton isHighlighted](self, "isHighlighted") & 1) != 0
    || -[SUUIGiftAmountButton isSelected](self, "isSelected"))
  {
    -[SUUIGiftAmountButton tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_borderView, "setBackgroundColor:", v3);
    -[UIView layer](self->_borderView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v8 = v3;
  }
  else
  {
    borderView = self->_borderView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](borderView, "setBackgroundColor:", v7);

    -[UIView layer](self->_borderView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4;
    v8 = v5;
  }
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(objc_retainAutorelease(v3), "CGColor"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
}

@end
