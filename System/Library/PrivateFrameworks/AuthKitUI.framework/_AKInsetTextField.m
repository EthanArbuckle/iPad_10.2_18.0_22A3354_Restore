@implementation _AKInsetTextField

- (_AKInsetTextField)initWithFrame:(CGRect)a3
{
  _AKInsetTextField *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_AKInsetTextField;
  result = -[_AKInsetTextField initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_insetSize = (CGSize)xmmword_1BD7FA570;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)_AKInsetTextField;
  -[_AKInsetTextField textRectForBounds:](&v4, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectInset(v5, self->_insetSize.width, self->_insetSize.height);
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)_AKInsetTextField;
  -[_AKInsetTextField editingRectForBounds:](&v4, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectInset(v5, self->_insetSize.width, self->_insetSize.height);
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)_AKInsetTextField;
  -[_AKInsetTextField leftViewRectForBounds:](&v4, sel_leftViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectOffset(v5, self->_insetSize.width, self->_insetSize.height);
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)_AKInsetTextField;
  -[_AKInsetTextField rightViewRectForBounds:](&v4, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectOffset(v5, -self->_insetSize.width, self->_insetSize.height);
}

- (CGSize)insetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_insetSize.width;
  height = self->_insetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInsetSize:(CGSize)a3
{
  self->_insetSize = a3;
}

@end
