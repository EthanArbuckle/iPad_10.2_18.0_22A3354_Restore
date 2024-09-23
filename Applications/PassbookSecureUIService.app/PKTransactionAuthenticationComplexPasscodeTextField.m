@implementation PKTransactionAuthenticationComplexPasscodeTextField

- (CGRect)textRectForBounds:(CGRect)a3
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  top = self->_textInsets.top;
  left = self->_textInsets.left;
  v5 = a3.origin.x + left;
  v6 = a3.origin.y + top;
  v7 = a3.size.width - (left + self->_textInsets.right);
  v8 = a3.size.height - (top + self->_textInsets.bottom);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  top = self->_textInsets.top;
  left = self->_textInsets.left;
  v5 = a3.origin.x + left;
  v6 = a3.origin.y + top;
  v7 = a3.size.width - (left + self->_textInsets.right);
  v8 = a3.size.height - (top + self->_textInsets.bottom);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  top = self->_textInsets.top;
  left = self->_textInsets.left;
  v5 = a3.origin.x + left;
  v6 = a3.origin.y + top;
  v7 = a3.size.width - (left + self->_textInsets.right);
  v8 = a3.size.height - (top + self->_textInsets.bottom);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)PKTransactionAuthenticationComplexPasscodeTextField;
  -[PKTransactionAuthenticationComplexPasscodeTextField sizeThatFits:](&v7, "sizeThatFits:", a3.width, a3.height);
  v5 = v4 + v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)textInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textInsets.top;
  left = self->_textInsets.left;
  bottom = self->_textInsets.bottom;
  right = self->_textInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextInsets:(UIEdgeInsets)a3
{
  self->_textInsets = a3;
}

@end
