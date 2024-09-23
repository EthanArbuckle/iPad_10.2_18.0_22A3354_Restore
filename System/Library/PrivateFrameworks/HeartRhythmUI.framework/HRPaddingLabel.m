@implementation HRPaddingLabel

- (HRPaddingLabel)initWithFrame:(CGRect)a3
{
  HRPaddingLabel *v3;
  HRPaddingLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HRPaddingLabel;
  v3 = -[HRPaddingLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HRPaddingLabel setPadding:](v3, "setPadding:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  return v4;
}

- (void)setBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HRPaddingLabel;
  -[HRPaddingLabel setBounds:](&v9, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[HRPaddingLabel bounds](self, "bounds");
  v5 = v4;
  -[HRPaddingLabel padding](self, "padding");
  v7 = v5 - v6;
  -[HRPaddingLabel padding](self, "padding");
  -[HRPaddingLabel setPreferredMaxLayoutWidth:](self, "setPreferredMaxLayoutWidth:", v7 - v8);
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HRPaddingLabel padding](self, "padding");
  v12.receiver = self;
  v12.super_class = (Class)HRPaddingLabel;
  -[HRPaddingLabel drawTextInRect:](&v12, sel_drawTextInRect_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
}

- (CGSize)intrinsicContentSize
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
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  v16.receiver = self;
  v16.super_class = (Class)HRPaddingLabel;
  -[HRPaddingLabel intrinsicContentSize](&v16, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[HRPaddingLabel padding](self, "padding");
  v8 = v4 + v7;
  -[HRPaddingLabel padding](self, "padding");
  v10 = v8 + v9;
  -[HRPaddingLabel padding](self, "padding");
  v12 = v6 + v11;
  -[HRPaddingLabel padding](self, "padding");
  v14 = v12 + v13;
  v15 = v10;
  result.height = v14;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

@end
