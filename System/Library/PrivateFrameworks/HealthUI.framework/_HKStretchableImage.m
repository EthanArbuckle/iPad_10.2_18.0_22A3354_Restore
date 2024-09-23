@implementation _HKStretchableImage

- (void)_renderStretchedInContext:(CGContext *)a3 frame:(CGRect)a4 contextBounds:(CGRect)a5 alpha:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MinX;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat MaxY;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat MinY;
  CGFloat v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (CGRectIntersectsRect(a4, a5))
  {
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    MinX = CGRectGetMinX(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v13 = CGRectGetWidth(v27);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v14 = CGRectGetHeight(v28);
    -[UIImage size](self->_topImage, "size");
    v16 = v14 - v15;
    -[UIImage size](self->_bottomImage, "size");
    if (v16 - v17 >= 0.0)
      v18 = v16 - v17;
    else
      v18 = 0.0;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    MinY = CGRectGetMinY(v29);
    -[UIImage size](self->_topImage, "size");
    v30.size.height = v19;
    v23 = v19;
    v30.origin.x = MinX;
    v30.origin.y = MinY;
    v30.size.width = v13;
    MaxY = CGRectGetMaxY(v30);
    v31.origin.x = MinX;
    v31.origin.y = MaxY;
    v31.size.width = v13;
    v31.size.height = v18;
    v25 = CGRectGetMaxY(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v21 = CGRectGetMaxY(v32);
    v33.origin.x = MinX;
    v33.origin.y = MaxY;
    v33.size.width = v13;
    v33.size.height = v18;
    v22 = v21 - CGRectGetMaxY(v33);
    CGContextSaveGState(a3);
    _RenderImageInRect(a3, self->_topImage, MinX, MinY, v13, v23, a6);
    _RenderImageInRect(a3, self->_centerImage, MinX, MaxY, v13, v18, a6);
    _RenderImageInRect(a3, self->_bottomImage, MinX, v25, v13, v22, a6);
    CGContextRestoreGState(a3);
  }
}

- (void)_renderSingleImageInContext:(CGContext *)a3 point:(CGPoint)a4 contextBounds:(CGRect)a5 alpha:(double)a6
{
  UIImage *singlePointImage;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  CGFloat height;
  CGFloat width;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v21;
  CGRect v22;

  singlePointImage = self->_singlePointImage;
  if (singlePointImage)
  {
    y = a5.origin.y;
    x = a5.origin.x;
    v10 = a4.y;
    v11 = a4.x;
    height = a5.size.height;
    width = a5.size.width;
    -[UIImage size](singlePointImage, "size", a3);
    v15 = v14;
    v17 = v16;
    v18 = v11 - v14 * 0.5;
    v19 = v10 - v16 * 0.5;
    v21.origin.x = v18;
    v21.origin.y = v19;
    v21.size.width = v15;
    v21.size.height = v17;
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    if (CGRectIntersectsRect(v21, v22))
      -[UIImage drawInRect:blendMode:alpha:](self->_singlePointImage, "drawInRect:blendMode:alpha:", 0, v18, v19, v15, v17, a6);
  }
}

- (void)renderInContext:(CGContext *)a3 topCenter:(CGPoint)a4 bottomCenter:(CGPoint)a5 contextBounds:(CGRect)a6 alpha:(double)a7
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a5.y;
  v12 = a4.y;
  v13 = a4.x;
  if (HKUIEqualDoubles(a4.y, a5.y))
  {
    -[_HKStretchableImage _renderSingleImageInContext:point:contextBounds:alpha:](self, "_renderSingleImageInContext:point:contextBounds:alpha:", a3, v13, v12, x, y, width, height, a7);
  }
  else
  {
    -[_HKStretchableImage _desiredWidth](self, "_desiredWidth");
    v22 = height;
    v17 = v16;
    -[UIImage size](self->_topImage, "size");
    v21 = width;
    v19 = v18;
    -[UIImage size](self->_bottomImage, "size");
    -[_HKStretchableImage _renderStretchedInContext:frame:contextBounds:alpha:](self, "_renderStretchedInContext:frame:contextBounds:alpha:", a3, v13 + v17 * -0.5, v12 - v19, v17, v11 - v12 + v19 + v20, x, y, v21, v22);
  }
}

- (double)_desiredWidth
{
  double v3;
  double v4;
  double result;

  -[UIImage size](self->_topImage, "size");
  v4 = v3;
  -[UIImage size](self->_bottomImage, "size");
  if (v4 >= result)
    return v4;
  return result;
}

- (UIImage)topImage
{
  return self->_topImage;
}

- (void)setTopImage:(id)a3
{
  objc_storeStrong((id *)&self->_topImage, a3);
}

- (UIImage)centerImage
{
  return self->_centerImage;
}

- (void)setCenterImage:(id)a3
{
  objc_storeStrong((id *)&self->_centerImage, a3);
}

- (UIImage)bottomImage
{
  return self->_bottomImage;
}

- (void)setBottomImage:(id)a3
{
  objc_storeStrong((id *)&self->_bottomImage, a3);
}

- (UIImage)singlePointImage
{
  return self->_singlePointImage;
}

- (void)setSinglePointImage:(id)a3
{
  objc_storeStrong((id *)&self->_singlePointImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singlePointImage, 0);
  objc_storeStrong((id *)&self->_bottomImage, 0);
  objc_storeStrong((id *)&self->_centerImage, 0);
  objc_storeStrong((id *)&self->_topImage, 0);
}

@end
