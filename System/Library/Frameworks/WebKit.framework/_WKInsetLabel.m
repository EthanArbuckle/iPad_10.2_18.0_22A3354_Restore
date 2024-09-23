@implementation _WKInsetLabel

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
  -[_WKInsetLabel edgeInsets](self, "edgeInsets");
  v12.receiver = self;
  v12.super_class = (Class)_WKInsetLabel;
  -[_WKInsetLabel drawTextInRect:](&v12, sel_drawTextInRect_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
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
  v16.super_class = (Class)_WKInsetLabel;
  -[_WKInsetLabel intrinsicContentSize](&v16, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[_WKInsetLabel edgeInsets](self, "edgeInsets");
  v8 = v7;
  -[_WKInsetLabel edgeInsets](self, "edgeInsets");
  v10 = v4 + v8 + v9;
  -[_WKInsetLabel edgeInsets](self, "edgeInsets");
  v12 = v11;
  -[_WKInsetLabel edgeInsets](self, "edgeInsets");
  v14 = v6 + v12 + v13;
  v15 = v10;
  result.height = v14;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

@end
