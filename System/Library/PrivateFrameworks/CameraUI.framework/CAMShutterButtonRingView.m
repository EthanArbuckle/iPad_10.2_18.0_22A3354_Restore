@implementation CAMShutterButtonRingView

- (CAMShutterButtonRingView)initWithSpec:(CAMShutterButtonSpec *)a3
{
  CAMShutterButtonRingView *v4;
  CAMShutterButtonRingView *v5;
  double interRingSpacing;
  __int128 v7;
  uint64_t v8;
  UIColor *color;
  void *v10;
  CAMShutterButtonRingView *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMShutterButtonRingView;
  v4 = -[CAMShutterButtonRingView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    interRingSpacing = a3->interRingSpacing;
    v7 = *(_OWORD *)&a3->stopSquareSideLength;
    *(_OWORD *)&v4->_spec.outerRingDiameter = *(_OWORD *)&a3->outerRingDiameter;
    *(_OWORD *)&v4->_spec.stopSquareSideLength = v7;
    v4->_spec.interRingSpacing = interRingSpacing;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (UIColor *)v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMShutterButtonRingView setBackgroundColor:](v5, "setBackgroundColor:", v10);

    -[CAMShutterButtonRingView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[CAMShutterButtonRingView setContentMode:](v5, "setContentMode:", 3);
    v11 = v5;
  }

  return v5;
}

- (void)setShowContrastBorder:(BOOL)a3
{
  if (self->_showContrastBorder != a3)
  {
    self->_showContrastBorder = a3;
    -[CAMShutterButtonRingView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_color) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[CAMShutterButtonRingView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)drawRect:(CGRect)a3
{
  _BOOL4 v4;
  double outerRingStrokeWidth;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGFloat MidY;
  CGContext *CurrentContext;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  CGRect v18;
  CGRect v19;

  v4 = -[CAMShutterButtonRingView showContrastBorder](self, "showContrastBorder", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  outerRingStrokeWidth = self->_spec.outerRingStrokeWidth;
  v6 = self->_spec.outerRingDiameter * 0.5;
  -[CAMShutterButtonRingView bounds](self, "bounds");
  -[CAMShutterButtonRingView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MidY = CGRectGetMidY(v19);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[CAMShutterButtonRingView color](self, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "set");

  CGContextSetLineWidth(CurrentContext, outerRingStrokeWidth);
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, v6 - outerRingStrokeWidth * 0.5 + MidX, MidY);
  CGContextAddArc(CurrentContext, MidX, MidY, v6 - outerRingStrokeWidth * 0.5, 6.28318531, 0.0, 1);
  CGContextClosePath(CurrentContext);
  CGContextStrokePath(CurrentContext);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "set");

    CGContextSetLineWidth(CurrentContext, 1.0);
    v16 = CAMPixelWidthForView(self);
    v17 = v6 - outerRingStrokeWidth - v16 * 0.5;
    CGContextBeginPath(CurrentContext);
    CGContextMoveToPoint(CurrentContext, v6 + 0.5 + MidX, MidY);
    CGContextAddArc(CurrentContext, MidX, MidY, v6 + 0.5, 6.28318531, 0.0, 1);
    CGContextClosePath(CurrentContext);
    CGContextStrokePath(CurrentContext);
    CGContextSetLineWidth(CurrentContext, v16);
    CGContextBeginPath(CurrentContext);
    CGContextMoveToPoint(CurrentContext, MidX + v17, MidY);
    CGContextAddArc(CurrentContext, MidX, MidY, v17, 6.28318531, 0.0, 1);
    CGContextClosePath(CurrentContext);
    CGContextStrokePath(CurrentContext);
  }
}

- (BOOL)showContrastBorder
{
  return self->_showContrastBorder;
}

- (UIColor)color
{
  return self->_color;
}

- (CAMShutterButtonRingView)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  _OWORD v7[2];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  CAMShutterButtonSpecForLayoutStyle(v5, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  v8 = v11;
  return -[CAMShutterButtonRingView initWithSpec:](self, "initWithSpec:", v7);
}

- (CAMShutterButtonRingView)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  _OWORD v7[2];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  CAMShutterButtonSpecForLayoutStyle(v5, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  v8 = v11;
  return -[CAMShutterButtonRingView initWithSpec:](self, "initWithSpec:", v7);
}

- (UIEdgeInsets)alignmentRectInsets
{
  _BOOL4 v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = -[CAMShutterButtonRingView showContrastBorder](self, "showContrastBorder");
  v3 = 0.0;
  if (v2)
    v3 = 1.0;
  v4 = v3;
  v5 = v3;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setSpec:(CAMShutterButtonSpec *)a3
{
  double interRingSpacing;
  __int128 v4;

  interRingSpacing = a3->interRingSpacing;
  v4 = *(_OWORD *)&a3->stopSquareSideLength;
  *(_OWORD *)&self->_spec.outerRingDiameter = *(_OWORD *)&a3->outerRingDiameter;
  *(_OWORD *)&self->_spec.stopSquareSideLength = v4;
  self->_spec.interRingSpacing = interRingSpacing;
  -[CAMShutterButtonRingView setNeedsDisplay](self, "setNeedsDisplay");
}

- (CAMShutterButtonSpec)spec
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].outerRingStrokeWidth;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[10].interRingSpacing;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->interRingSpacing = self[11].stopSquareCornerRadius;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
