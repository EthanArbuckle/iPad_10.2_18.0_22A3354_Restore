@implementation _HKReferenceRangeDotViewDot

- (_HKReferenceRangeDotViewDot)initWithFrame:(CGRect)a3
{
  _HKReferenceRangeDotViewDot *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKReferenceRangeDotViewDot;
  v3 = -[_HKReferenceRangeDotViewDot initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKReferenceRangeDotViewDot setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)setDotColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_dotColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dotColor, a3);
    -[_HKReferenceRangeDotViewDot setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_HKReferenceRangeDotViewDot;
  -[_HKReferenceRangeDotViewDot traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[_HKReferenceRangeDotViewDot setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  UIColor *dotColor;
  void *v6;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = self;
  v7.super_class = (Class)_HKReferenceRangeDotViewDot;
  -[_HKReferenceRangeDotViewDot drawRect:](&v7, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  dotColor = self->_dotColor;
  v6 = dotColor;
  if (!dotColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v6), "CGColor"));
  if (!dotColor)

  -[_HKReferenceRangeDotViewDot bounds](self, "bounds");
  v9 = CGRectInset(v8, 1.0, 1.0);
  CGContextFillEllipseInRect(CurrentContext, v9);
  CGContextRestoreGState(CurrentContext);
}

- (UIColor)dotColor
{
  return self->_dotColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotColor, 0);
}

@end
