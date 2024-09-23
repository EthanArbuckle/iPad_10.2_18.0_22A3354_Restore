@implementation HUIconCellContentMetrics

+ (id)defaultMetrics
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setIconSize:", 44.0, 44.0);
  objc_msgSend(v2, "setContentInset:", 8.0, 0.0, 8.0, 0.0);
  return v2;
}

+ (id)compactMetrics
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  HUDefaultSizeForIconSize();
  objc_msgSend(v2, "setIconSize:");
  objc_msgSend(v2, "setContentInset:", 4.0, 0.0, 4.0, 0.0);
  return v2;
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

@end
