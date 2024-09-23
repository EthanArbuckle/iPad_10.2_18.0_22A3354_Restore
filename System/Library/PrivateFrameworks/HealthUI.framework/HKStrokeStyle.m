@implementation HKStrokeStyle

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

+ (HKStrokeStyle)strokeStyleWithColor:(id)a3 lineWidth:(double)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "setStrokeColor:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStrokeColor:", v9);

  }
  objc_msgSend(v8, "setLineWidth:", a4);

  return (HKStrokeStyle *)v8;
}

- (void)setStrokeColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (HKStrokeStyle)init
{
  HKStrokeStyle *v2;
  HKStrokeStyle *v3;
  uint64_t v4;
  UIColor *strokeColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKStrokeStyle;
  v2 = -[HKStrokeStyle init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_lineCap = 0x100000000;
    v2->_dashStyle = 0;
    v2->_blendMode = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = objc_claimAutoreleasedReturnValue();
    strokeColor = v3->_strokeColor;
    v3->_strokeColor = (UIColor *)v4;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[UIColor copy](self->_strokeColor, "copy");
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  *(double *)(v4 + 32) = self->_lineWidth;
  *(_DWORD *)(v4 + 8) = self->_lineCap;
  *(_DWORD *)(v4 + 12) = self->_lineJoin;
  *(_QWORD *)(v4 + 40) = self->_dashStyle;
  *(_DWORD *)(v4 + 16) = self->_blendMode;
  return (id)v4;
}

- (void)applyToContext:(CGContext *)a3
{
  -[HKStrokeStyle applyToContext:dashPhase:](self, "applyToContext:dashPhase:", a3, 0.0);
}

- (void)applyToContext:(CGContext *)a3 dashPhase:(double)a4
{
  unint64_t v7;

  CGContextSetStrokeColorWithColor(a3, -[UIColor CGColor](objc_retainAutorelease(self->_strokeColor), "CGColor"));
  CGContextSetLineWidth(a3, self->_lineWidth);
  CGContextSetLineCap(a3, (CGLineCap)self->_lineCap);
  CGContextSetLineJoin(a3, (CGLineJoin)self->_lineJoin);
  CGContextSetBlendMode(a3, (CGBlendMode)self->_blendMode);
  v7 = self->_dashStyle - 1;
  if (v7 <= 3)
    CGContextSetLineDash(a3, a4, (const CGFloat *)*(&off_1E9C461E0 + v7), 2uLL);
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (int)lineCap
{
  return self->_lineCap;
}

- (void)setLineCap:(int)a3
{
  self->_lineCap = a3;
}

- (int)lineJoin
{
  return self->_lineJoin;
}

- (void)setLineJoin:(int)a3
{
  self->_lineJoin = a3;
}

- (int64_t)dashStyle
{
  return self->_dashStyle;
}

- (void)setDashStyle:(int64_t)a3
{
  self->_dashStyle = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
