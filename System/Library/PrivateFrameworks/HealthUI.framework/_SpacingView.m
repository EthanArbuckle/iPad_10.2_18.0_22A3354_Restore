@implementation _SpacingView

- (_SpacingView)initWithWidth:(double)a3 height:(double)a4
{
  _SpacingView *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SpacingView;
  result = -[_SpacingView initWithFrame:](&v7, sel_initWithFrame_, 0.0, 0.0, a3, a4);
  if (result)
  {
    result->_spacingSize.width = a3;
    result->_spacingSize.height = a4;
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_spacingSize.width;
  height = self->_spacingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)spacingSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_spacingSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

@end
