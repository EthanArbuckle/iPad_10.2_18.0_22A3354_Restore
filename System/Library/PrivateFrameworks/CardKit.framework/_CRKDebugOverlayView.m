@implementation _CRKDebugOverlayView

- (_CRKDebugOverlayView)initWithFrame:(CGRect)a3
{
  _CRKDebugOverlayView *v3;
  _CRKDebugOverlayView *v4;
  void *v5;
  UILabel *v6;
  UILabel *label;
  UILabel *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_CRKDebugOverlayView;
  v3 = -[_CRKDebugOverlayView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_CRKDebugOverlayView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderWidth:", 2.0);

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    label = v4->_label;
    v4->_label = v6;

    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 2);
    v8 = v4->_label;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    -[_CRKDebugOverlayView addSubview:](v4, "addSubview:", v4->_label);
  }
  return v4;
}

- (void)setColor:(id)a3
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[_CRKDebugOverlayView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_retainAutorelease(v7);
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    -[UILabel setTextColor:](self->_label, "setTextColor:", v6);
    -[_CRKDebugOverlayView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setDebugText:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSString isEqual:](self->_debugText, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_debugText, a3);
    -[UILabel setText:](self->_label, "setText:", v5);
    -[_CRKDebugOverlayView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UILabel *label;
  double MaxX;
  double v9;
  double MaxY;
  double v11;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v13.receiver = self;
  v13.super_class = (Class)_CRKDebugOverlayView;
  -[_CRKDebugOverlayView layoutSubviews](&v13, sel_layoutSubviews);
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[_CRKDebugOverlayView bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  label = self->_label;
  MaxX = CGRectGetMaxX(v14);
  -[UILabel bounds](self->_label, "bounds");
  v9 = MaxX - CGRectGetWidth(v15) + -2.0 + -1.0;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MaxY = CGRectGetMaxY(v16);
  -[UILabel bounds](self->_label, "bounds");
  v11 = MaxY - CGRectGetHeight(v17) + -2.0 + -1.0;
  -[UILabel bounds](self->_label, "bounds");
  v12 = CGRectGetWidth(v18);
  -[UILabel bounds](self->_label, "bounds");
  -[UILabel setFrame:](label, "setFrame:", v9, v11, v12, CGRectGetHeight(v19));
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)debugText
{
  return self->_debugText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugText, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
