@implementation _BCUCoverEffectsShadow

- (_BCUCoverEffectsShadow)initWithImage:(CGImage *)a3 insets:(UIEdgeInsets)a4 blendMode:(id)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v12;
  _BCUCoverEffectsShadow *v13;
  objc_super v15;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v12 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_BCUCoverEffectsShadow;
  v13 = -[_BCUCoverEffectsShadow init](&v15, sel_init);
  if (v13)
  {
    v13->_image = CGImageRetain(a3);
    v13->_insets.top = top;
    v13->_insets.left = left;
    v13->_insets.bottom = bottom;
    v13->_insets.right = right;
    objc_storeStrong((id *)&v13->_blendMode, a5);
  }

  return v13;
}

- (_BCUCoverEffectsShadow)initWithImage:(CGImage *)a3 insets:(UIEdgeInsets)a4
{
  return -[_BCUCoverEffectsShadow initWithImage:insets:blendMode:](self, "initWithImage:insets:blendMode:", a3, 0, a4.top, a4.left, a4.bottom, a4.right);
}

- (CGSize)size
{
  double Width;
  double Height;
  double v5;
  CGSize result;

  Width = (double)CGImageGetWidth(self->_image);
  Height = (double)CGImageGetHeight(self->_image);
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (CGRect)contentsCenter
{
  double top;
  double left;
  double bottom;
  double right;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  -[_BCUCoverEffectsShadow size](self, "size");
  v7 = 1.0 - (left + right) / v6;
  v9 = 1.0 - (top + bottom) / v8;
  v10 = top / v8;
  v11 = left / v6;
  result.size.height = v9;
  result.size.width = v7;
  result.origin.y = v10;
  result.origin.x = v11;
  return result;
}

- (UIEdgeInsets)roundedInsetsWithSize:(CGSize)a3
{
  double width;
  double top;
  double left;
  double right;
  double bottom;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  width = a3.width;
  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  -[_BCUCoverEffectsShadow size](self, "size", a3.width, a3.height);
  v9 = 1.0;
  if (width > 0.0)
    v9 = (v8 - left - right) / width;
  v10 = floor(top / v9);
  v11 = floor(left / v9);
  v12 = floor(bottom / v9);
  v13 = floor(right / v9);
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGImage)image
{
  return self->_image;
}

- (NSString)blendMode
{
  return self->_blendMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendMode, 0);
}

@end
