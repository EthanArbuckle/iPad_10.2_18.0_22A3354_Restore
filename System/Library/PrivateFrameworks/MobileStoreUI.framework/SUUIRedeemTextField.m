@implementation SUUIRedeemTextField

- (SUUIRedeemTextField)initWithFrame:(CGRect)a3
{
  SUUIRedeemTextField *v3;
  uint64_t v4;
  UIView *backdropView;
  UIView *v6;
  UIView *bottomBorderView;
  UIView *v8;
  void *v9;
  UIView *v10;
  UIView *topBorderView;
  UIView *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SUUIRedeemTextField;
  v3 = -[SUUIRedeemTextField initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", 10060);
    backdropView = v3->_backdropView;
    v3->_backdropView = (UIView *)v4;

    -[UIView setHidden:](v3->_backdropView, "setHidden:", 1);
    -[SUUIRedeemTextField insertSubview:atIndex:](v3, "insertSubview:atIndex:", v3->_backdropView, 0);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    bottomBorderView = v3->_bottomBorderView;
    v3->_bottomBorderView = v6;

    v8 = v3->_bottomBorderView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[SUUIRedeemTextField addSubview:](v3, "addSubview:", v3->_bottomBorderView);
    v10 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    topBorderView = v3->_topBorderView;
    v3->_topBorderView = v10;

    v12 = v3->_topBorderView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[SUUIRedeemTextField addSubview:](v3, "addSubview:", v3->_topBorderView);
    v3->_backdropBackground = 0;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemTextField setBackgroundColor:](v3, "setBackgroundColor:", v14);

    -[SUUIRedeemTextField setOpaque:](v3, "setOpaque:", 1);
  }
  return v3;
}

- (void)setBackdropBackground:(BOOL)a3
{
  _BOOL4 v3;
  UIView *backdropView;
  void *v6;

  if (self->_backdropBackground != a3)
  {
    v3 = a3;
    self->_backdropBackground = a3;
    backdropView = self->_backdropView;
    if (a3)
    {
      -[UIView setHidden:](backdropView, "setHidden:", 0);
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    }
    else
    {
      -[UIView setHidden:](backdropView, "setHidden:", 1);
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemTextField setBackgroundColor:](self, "setBackgroundColor:", v6);

    -[SUUIRedeemTextField setOpaque:](self, "setOpaque:", !v3);
  }
}

- (void)setSuppressBorder:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_suppressBorder = a3;
  -[UIView setHidden:](self->_bottomBorderView, "setHidden:");
  -[UIView setHidden:](self->_topBorderView, "setHidden:", v3);
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SUUIRedeemTextField;
  -[SUUIRedeemTextField editingRectForBounds:](&v8, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = width + -30.0;
  v7 = 15.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SUUIRedeemTextField;
  -[SUUIRedeemTextField placeholderRectForBounds:](&v8, sel_placeholderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = width + -30.0;
  v7 = 15.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SUUIRedeemTextField;
  -[SUUIRedeemTextField textRectForBounds:](&v8, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = width + -30.0;
  v7 = 15.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  -[SUUIRedeemTextField bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = 1.0 / v8;

  -[UIView setFrame:](self->_bottomBorderView, "setFrame:", 0.0, v6 - v9, v4, v9);
  -[UIView setFrame:](self->_topBorderView, "setFrame:", 0.0, 0.0, v4, v9);
  v10.receiver = self;
  v10.super_class = (Class)SUUIRedeemTextField;
  -[SUUIRedeemTextField layoutSubviews](&v10, sel_layoutSubviews);
}

- (BOOL)backdropBackground
{
  return self->_backdropBackground;
}

- (BOOL)suppressBorder
{
  return self->_suppressBorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

@end
