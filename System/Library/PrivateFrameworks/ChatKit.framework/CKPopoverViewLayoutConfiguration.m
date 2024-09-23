@implementation CKPopoverViewLayoutConfiguration

- (CGSize)optimalSizeForPresentingSendMenuWithPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKPopoverViewLayoutConfiguration minimumSendMenuDimension](self, "minimumSendMenuDimension");
  if (width < v6)
    width = v6;
  if (height < v6)
    height = v6;
  -[CKPopoverViewLayoutConfiguration maximumHeight](self, "maximumHeight");
  if (height >= v7)
    v8 = v7;
  else
    v8 = height;
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)optimalSizeForPresentingAppInCompactStyle:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = a3;
  -[CKPopoverViewLayoutConfiguration preferredAppWidth](self, "preferredAppWidth");
  v6 = v5;
  if (v3)
    -[CKPopoverViewLayoutConfiguration defaultAppCompactHeight](self, "defaultAppCompactHeight");
  else
    -[CKPopoverViewLayoutConfiguration maximumHeight](self, "maximumHeight");
  v8 = v7;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)optimalSizeForPreferredContentSize:(CGSize)result state:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;

  if (a4 - 1 < 2)
  {
    -[CKPopoverViewLayoutConfiguration optimalSizeForPresentingAppInCompactStyle:](self, "optimalSizeForPresentingAppInCompactStyle:", a4 == 1, result.width, result.height);
LABEL_5:
    v4 = v5;
    goto LABEL_6;
  }
  if (!a4)
  {
    -[CKPopoverViewLayoutConfiguration optimalSizeForPresentingSendMenuWithPreferredContentSize:](self, "optimalSizeForPresentingSendMenuWithPreferredContentSize:", result.width, result.height);
    goto LABEL_5;
  }
LABEL_6:
  v6 = v4;
  result.height = v6;
  return result;
}

- (double)minimumSendMenuDimension
{
  return self->_minimumSendMenuDimension;
}

- (void)setMinimumSendMenuDimension:(double)a3
{
  self->_minimumSendMenuDimension = a3;
}

- (double)defaultAppCompactHeight
{
  return self->_defaultAppCompactHeight;
}

- (void)setDefaultAppCompactHeight:(double)a3
{
  self->_defaultAppCompactHeight = a3;
}

- (double)preferredAppWidth
{
  return self->_preferredAppWidth;
}

- (void)setPreferredAppWidth:(double)a3
{
  self->_preferredAppWidth = a3;
}

- (double)minimumTopSpacing
{
  return self->_minimumTopSpacing;
}

- (void)setMinimumTopSpacing:(double)a3
{
  self->_minimumTopSpacing = a3;
}

- (double)minimumTrailingSpacing
{
  return self->_minimumTrailingSpacing;
}

- (void)setMinimumTrailingSpacing:(double)a3
{
  self->_minimumTrailingSpacing = a3;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

@end
