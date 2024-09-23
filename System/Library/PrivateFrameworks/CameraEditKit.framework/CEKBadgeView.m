@implementation CEKBadgeView

- (CEKBadgeView)initWithFrame:(CGRect)a3
{
  CEKBadgeView *v3;
  CEKBadgeView *v4;
  void *v5;
  uint64_t v6;
  UIColor *fillColor;
  uint64_t v8;
  UIColor *contentColor;
  CEKBadgeView *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEKBadgeView;
  v3 = -[CEKBadgeView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CEKBadgeView setContentMode:](v3, "setContentMode:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v6 = objc_claimAutoreleasedReturnValue();
    fillColor = v4->__fillColor;
    v4->__fillColor = (UIColor *)v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v8 = objc_claimAutoreleasedReturnValue();
    contentColor = v4->__contentColor;
    v4->__contentColor = (UIColor *)v8;

    v4->__fillCornerRadius = 2.0;
    v10 = v4;
  }

  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  CGContext *CurrentContext;
  CGFloat Height;
  CGImage *v17;
  size_t Width;
  size_t v19;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  const CGFloat *Decode;
  BOOL ShouldInterpolate;
  CGImage *v26;
  id v27;
  CGImage *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[CEKBadgeView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CEKBadgeView _maskImage](self, "_maskImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeView _contentColor](self, "_contentColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeView _fillColor](self, "_fillColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeView _fillCornerRadius](self, "_fillCornerRadius");
  v14 = v13;
  CurrentContext = UIGraphicsGetCurrentContext();
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  CGContextClearRect(CurrentContext, v33);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  Height = CGRectGetHeight(v34);
  CGContextTranslateCTM(CurrentContext, 0.0, -Height);
  v32 = objc_retainAutorelease(v12);
  v17 = (CGImage *)objc_msgSend(v32, "CGImage");
  Width = CGImageGetWidth(v17);
  v19 = CGImageGetHeight(v17);
  BitsPerComponent = CGImageGetBitsPerComponent(v17);
  BitsPerPixel = CGImageGetBitsPerPixel(v17);
  BytesPerRow = CGImageGetBytesPerRow(v17);
  DataProvider = CGImageGetDataProvider(v17);
  Decode = CGImageGetDecode(v17);
  ShouldInterpolate = CGImageGetShouldInterpolate(v17);
  v26 = CGImageMaskCreate(Width, v19, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, Decode, ShouldInterpolate);
  -[CEKBadgeView _invertMaskImage:](self, "_invertMaskImage:", v32);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = (CGImage *)objc_msgSend(v27, "CGImage");
  CGContextSaveGState(CurrentContext);
  objc_msgSend(v30, "set");
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  CGContextClipToMask(CurrentContext, v35, v28);
  v36.origin.x = v5;
  v36.origin.y = v7;
  v36.size.width = v9;
  v36.size.height = v11;
  CGContextFillRect(CurrentContext, v36);
  CGContextRestoreGState(CurrentContext);
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v11;
  CGContextClipToRect(CurrentContext, v37);
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  CGContextClipToMask(CurrentContext, v38, v26);
  objc_msgSend(v31, "set");
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fill");
  CGImageRelease(v26);

}

- (id)_invertMaskImage:(id)a3
{
  void *v3;
  void *v4;
  CGImage *v5;
  size_t Width;
  size_t Height;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  BOOL ShouldInterpolate;
  CGImage *v13;
  void *v14;
  CGFloat decode;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CEKBadgeView _maskImage](self, "_maskImage", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v17 = 0u;
    decode = 1.0;
    v18 = 0x3FF0000000000000uLL;
    v19 = 0x3FF0000000000000uLL;
    v20 = 0x3FF0000000000000;
    v5 = (CGImage *)objc_msgSend(objc_retainAutorelease(v3), "CGImage");
    Width = CGImageGetWidth(v5);
    Height = CGImageGetHeight(v5);
    BitsPerComponent = CGImageGetBitsPerComponent(v5);
    BitsPerPixel = CGImageGetBitsPerPixel(v5);
    BytesPerRow = CGImageGetBytesPerRow(v5);
    DataProvider = CGImageGetDataProvider(v5);
    ShouldInterpolate = CGImageGetShouldInterpolate(v5);
    v13 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, &decode, ShouldInterpolate);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_maskImage
{
  return 0;
}

- (void)_setFillCornerRadius:(double)a3
{
  if (self->__fillCornerRadius != a3)
  {
    self->__fillCornerRadius = a3;
    -[CEKBadgeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_setFillColor:(id)a3
{
  UIColor *v5;
  UIColor *fillColor;
  char v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  fillColor = self->__fillColor;
  if (fillColor != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](fillColor, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__fillColor, a3);
      -[CEKBadgeView setNeedsDisplay](self, "setNeedsDisplay");
      v5 = v8;
    }
  }

}

- (void)_setContentColor:(id)a3
{
  UIColor *v5;
  UIColor *contentColor;
  char v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  contentColor = self->__contentColor;
  if (contentColor != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](contentColor, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__contentColor, a3);
      -[CEKBadgeView setNeedsDisplay](self, "setNeedsDisplay");
      v5 = v8;
    }
  }

}

- (CEKBadgeViewDelegate)delegate
{
  return (CEKBadgeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)_fillCornerRadius
{
  return self->__fillCornerRadius;
}

- (UIColor)_fillColor
{
  return self->__fillColor;
}

- (UIColor)_contentColor
{
  return self->__contentColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentColor, 0);
  objc_storeStrong((id *)&self->__fillColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
