@implementation TodayCirclePulseBackground

- (TodayCirclePulseBackground)initWithFrame:(CGRect)a3
{
  TodayCirclePulseBackground *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TodayCirclePulseBackground;
  result = -[TodayCirclePulseBackground initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_roundedRectCornerRadius = 8.0;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext;
  CGContext *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGRect v18;

  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    v5 = CurrentContext;
    CalendarAppTintColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFill");

    if (-[TodayCirclePulseBackground usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle"))
    {
      v7 = (void *)MEMORY[0x1E0DC3508];
      -[TodayCirclePulseBackground bounds](self, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[TodayCirclePulseBackground roundedRectCornerRadius](self, "roundedRectCornerRadius");
      objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fill");

    }
    else
    {
      -[TodayCirclePulseBackground bounds](self, "bounds");
      CGContextFillEllipseInRect(v5, v18);
    }
    CGContextFlush(v5);
  }
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return self->_usesRoundedRectInsteadOfCircle;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  self->_usesRoundedRectInsteadOfCircle = a3;
}

- (double)roundedRectCornerRadius
{
  return self->_roundedRectCornerRadius;
}

- (void)setRoundedRectCornerRadius:(double)a3
{
  self->_roundedRectCornerRadius = a3;
}

@end
