@implementation GKInsetTextField

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[GKInsetTextField textInsets](self, "textInsets");
  v9 = v8;
  -[GKInsetTextField textInsets](self, "textInsets");
  v11 = v10;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return CGRectInset(v12, v9, v11);
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[GKInsetTextField textInsets](self, "textInsets");
  v9 = v8;
  -[GKInsetTextField textInsets](self, "textInsets");
  v11 = v10;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return CGRectInset(v12, v9, v11);
}

- (CGSize)textInsets
{
  double width;
  double height;
  CGSize result;

  width = self->_textInsets.width;
  height = self->_textInsets.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTextInsets:(CGSize)a3
{
  self->_textInsets = a3;
}

@end
