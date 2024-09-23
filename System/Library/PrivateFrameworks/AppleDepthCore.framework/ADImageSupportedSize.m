@implementation ADImageSupportedSize

+ (id)createWithSize:(CGSize)a3 andLayout:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat *v7;

  height = a3.height;
  width = a3.width;
  v7 = (CGFloat *)objc_opt_new();
  v7[2] = width;
  v7[3] = height;
  *((_QWORD *)v7 + 1) = a4;
  return v7;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)layout
{
  return self->_layout;
}

@end
