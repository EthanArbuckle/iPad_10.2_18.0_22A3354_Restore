@implementation QLThumbnailView

- (QLThumbnailView)initWithFrame:(CGRect)a3
{
  QLThumbnailView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLThumbnailView;
  v3 = -[QLThumbnailView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  CGContextClipToRect(CurrentContext, v25);
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationNone);
  -[QLThumbnailView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[QLThumbnailView image](self, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v17;
  if (v17)
  {
    objc_msgSend(v17, "size");
    v20 = v14 * (v19 / v18);
    if (v20 <= v16)
    {
      v21 = v14;
    }
    else
    {
      v21 = v14 * (v16 / v20);
      v20 = v16;
    }
    v10 = floor((v14 - v21) * 0.5);
    v12 = floor((v16 - v20) * 0.5);
    v14 = floor(v21);
    v16 = floor(v20);
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v22, "CGColor"));

  v26.origin.x = v10;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  CGContextFillRect(CurrentContext, v26);
  objc_msgSend(v24, "drawInRect:", v10, v12, v14, v16);
  CGContextSetLineWidth(CurrentContext, 1.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v23, "CGColor"));

  v27.origin.x = v10 + 0.5;
  v27.origin.y = v12 + 0.5;
  v27.size.width = v14 + -1.0;
  v27.size.height = v16 + -1.0;
  CGContextStrokeRect(CurrentContext, v27);
  CGContextRestoreGState(CurrentContext);

}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLThumbnailView;
  -[QLThumbnailView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[QLThumbnailView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  -[QLThumbnailView setNeedsDisplay](self, "setNeedsDisplay");
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(int64_t)a3
{
  self->_pageNumber = a3;
}

- (BOOL)alwaysVisible
{
  return self->_alwaysVisible;
}

- (void)setAlwaysVisible:(BOOL)a3
{
  self->_alwaysVisible = a3;
}

- (CGRect)unselectedFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_unselectedFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setUnselectedFrame:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_unselectedFrame, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
