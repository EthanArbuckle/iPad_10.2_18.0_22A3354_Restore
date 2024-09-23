@implementation _ASInsetTextField

- (_ASInsetTextField)initWithFrame:(CGRect)a3
{
  _ASInsetTextField *v3;
  _ASInsetTextField *v4;
  _ASInsetTextField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ASInsetTextField;
  v3 = -[_ASInsetTextField initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_insetSize = (CGSize)xmmword_20E55E780;
    v5 = v3;
  }

  return v4;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)_ASInsetTextField;
  -[_ASInsetTextField textRectForBounds:](&v4, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectInset(v5, self->_insetSize.width, self->_insetSize.height);
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)_ASInsetTextField;
  -[_ASInsetTextField editingRectForBounds:](&v4, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectInset(v5, self->_insetSize.width, self->_insetSize.height);
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)_ASInsetTextField;
  -[_ASInsetTextField leftViewRectForBounds:](&v4, sel_leftViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectOffset(v5, self->_insetSize.width, self->_insetSize.height);
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)_ASInsetTextField;
  -[_ASInsetTextField rightViewRectForBounds:](&v4, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
