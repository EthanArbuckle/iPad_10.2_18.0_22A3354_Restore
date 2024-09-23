@implementation CKTextMetrics

- (CKTextMetrics)initWithSize:(CGSize)a3 singleLine:(BOOL)a4 alignmentInset:(UIEdgeInsets)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  CKTextMetrics *result;
  objc_super v13;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)CKTextMetrics;
  result = -[CKTextMetrics init](&v13, sel_init);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_singleLine = a4;
    result->_alignmentInset.top = top;
    result->_alignmentInset.left = left;
    result->_alignmentInset.bottom = bottom;
    result->_alignmentInset.right = right;
  }
  return result;
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

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (BOOL)isSingleLine
{
  return self->_singleLine;
}

- (void)setSingleLine:(BOOL)a3
{
  self->_singleLine = a3;
}

- (UIEdgeInsets)alignmentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentInset.top;
  left = self->_alignmentInset.left;
  bottom = self->_alignmentInset.bottom;
  right = self->_alignmentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAlignmentInset:(UIEdgeInsets)a3
{
  self->_alignmentInset = a3;
}

@end
