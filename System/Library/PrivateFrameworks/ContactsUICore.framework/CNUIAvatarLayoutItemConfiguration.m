@implementation CNUIAvatarLayoutItemConfiguration

- (void)updateLayer:(id)a3 inBounds:(CGRect)a4 atIndex:(int64_t)a5 isRTL:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;

  v6 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  -[CNUIAvatarLayoutItemConfiguration itemFrameInContainingBounds:isRTL:](self, "itemFrameInContainingBounds:isRTL:", v6, x, y, width, height);
  objc_msgSend(v13, "setFrame:");
  objc_msgSend(v13, "setZPosition:", (double)-a5);

}

- (CGRect)itemFrameInContainingBounds:(CGRect)a3 isRTL:(BOOL)a4
{
  double height;
  _BOOL4 v5;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  if (a3.size.width <= 0.0 || (height = a3.size.height, a3.size.height <= 0.0))
  {
    v17 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v5 = a4;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[CNUIAvatarLayoutItemConfiguration size](self, "size");
    v11 = v10;
    -[CNUIAvatarLayoutItemConfiguration baseSize](self, "baseSize");
    v13 = height / v12;
    v14 = v11 * (height / v12);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    v15 = CGRectGetMidX(v24) - v14 * 0.5;
    -[CNUIAvatarLayoutItemConfiguration x](self, "x");
    if (v5)
      v16 = -v16;
    v17 = v15 + v16 * v13;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v18 = CGRectGetMidY(v25) - v14 * 0.5;
    -[CNUIAvatarLayoutItemConfiguration y](self, "y");
    v20 = v18 + v19 * v13;
    v21 = v14;
  }
  v22 = v17;
  v23 = v14;
  result.size.height = v21;
  result.size.width = v23;
  result.origin.y = v20;
  result.origin.x = v22;
  return result;
}

- (double)y
{
  return self->_y;
}

- (double)x
{
  return self->_x;
}

- (double)size
{
  return self->_size;
}

- (double)baseSize
{
  return self->_baseSize;
}

- (CNUIAvatarLayoutItemConfiguration)initWithSize:(double)a3 x:(double)a4 y:(double)a5 baseSize:(double)a6
{
  CNUIAvatarLayoutItemConfiguration *v10;
  CNUIAvatarLayoutItemConfiguration *v11;
  CNUIAvatarLayoutItemConfiguration *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNUIAvatarLayoutItemConfiguration;
  v10 = -[CNUIAvatarLayoutItemConfiguration init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_size = a3;
    v10->_x = a4;
    v10->_y = a5;
    v10->_baseSize = a6;
    v12 = v10;
  }

  return v11;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (void)setBaseSize:(double)a3
{
  self->_baseSize = a3;
}

@end
