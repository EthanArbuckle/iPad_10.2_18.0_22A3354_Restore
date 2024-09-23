@implementation PKSpaceInsertionView

- (PKSpaceInsertionView)initWithFrame:(CGRect)a3 insertionType:(unint64_t)a4 path:(CGPath *)a5 handleLocation:(CGPoint)a6 scale:(double)a7
{
  CGFloat y;
  CGFloat x;
  PKSpaceInsertionView *v12;
  PKSpaceInsertionView *v13;
  PKDrawingAdjustmentKnob *v14;
  PKDrawingAdjustmentKnob *knobHandle;
  objc_super v17;

  y = a6.y;
  x = a6.x;
  v17.receiver = self;
  v17.super_class = (Class)PKSpaceInsertionView;
  v12 = -[PKSpaceInsertionView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v13 = v12;
  if (v12)
  {
    -[PKSpaceInsertionView setOpaque:](v12, "setOpaque:", 0);
    v13->_insertionType = a4;
    v13->_lassoPath = CGPathRetain(a5);
    v13->_handleLocation.x = x;
    v13->_handleLocation.y = y;
    v13->_scale = a7;
    v14 = objc_alloc_init(PKDrawingAdjustmentKnob);
    knobHandle = v13->_knobHandle;
    v13->_knobHandle = v14;

    -[PKSpaceInsertionView addSubview:](v13, "addSubview:", v13->_knobHandle);
    -[PKSpaceInsertionView setAccessibilityIdentifier:](v13, "setAccessibilityIdentifier:", CFSTR("com.apple.pencilkit.insertSpaceHandle"));
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_lassoPath);
  v3.receiver = self;
  v3.super_class = (Class)PKSpaceInsertionView;
  -[PKSpaceInsertionView dealloc](&v3, sel_dealloc);
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  const CGPath *v7;
  BOOL v8;
  CGAffineTransform v10;
  CGPoint v11;
  CGPoint v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  -[PKSpaceInsertionView bounds](self, "bounds", a4);
  v12.x = x;
  v12.y = y;
  if (!CGRectContainsPoint(v13, v12))
    return 0;
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeTranslation(&v10, 0.0, 15.0);
  v7 = CGPathCreateCopyByStrokingPath(self->_lassoPath, &v10, 80.0, kCGLineCapRound, kCGLineJoinRound, 1.0);
  v11.x = x;
  v11.y = y;
  v8 = CGPathContainsPoint(v7, 0, v11, 0);
  CGPathRelease(v7);
  return v8;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  id v5;

  if (-[PKSpaceInsertionView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
  {
    -[PKSpaceInsertionView bounds](self, "bounds");
    v4 = v3 + -7.5 + -7.5;
  }
  else
  {
    v4 = 0.0;
  }
  -[PKDrawingAdjustmentKnob setFrame:](self->_knobHandle, "setFrame:", v4, self->_handleLocation.y + 15.0 + -8.0, 15.0, 16.0);
  -[PKSpaceInsertionView tintColor](self, "tintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDrawingAdjustmentKnob setTintColor:](self->_knobHandle, "setTintColor:");

}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  CGContext *CurrentContext;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKSpaceInsertionView;
  -[PKSpaceInsertionView drawRect:](&v7, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PKSpaceInsertionView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CurrentContext = UIGraphicsGetCurrentContext();
  v6 = objc_retainAutorelease(v4);
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v6, "CGColor"));
  CGContextTranslateCTM(CurrentContext, 0.0, 15.0);
  CGContextBeginPath(CurrentContext);
  CGContextSetLineCap(CurrentContext, kCGLineCapRound);
  CGContextSetLineWidth(CurrentContext, 0.5);
  CGContextAddPath(CurrentContext, self->_lassoPath);
  CGContextStrokePath(CurrentContext);

}

- (unint64_t)insertionType
{
  return self->_insertionType;
}

- (void)setInsertionType:(unint64_t)a3
{
  self->_insertionType = a3;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knobHandle, 0);
}

@end
