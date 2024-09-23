@implementation EKUIAvailabilityFreeSpanView

- (EKUIAvailabilityFreeSpanView)initWithFrame:(CGRect)a3 andColor:(id)a4 startDate:(id)a5 endDate:(id)a6 isFreeSpan:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  EKUIAvailabilityFreeSpanView *v18;
  EKUIAvailabilityFreeSpanView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  objc_super v32;

  v7 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v32.receiver = self;
  v32.super_class = (Class)EKUIAvailabilityFreeSpanView;
  v18 = -[EKUIAvailabilityFreeSpanView initWithFrame:](&v32, sel_initWithFrame_, x, y, width, height);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a5);
    objc_storeStrong((id *)&v19->_endDate, a6);
    -[EKUIAvailabilityFreeSpanView traitCollection](v19, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "userInterfaceStyle");
    CUIKBackgroundColorForCalendarColorWithOpaqueForStyle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v7)
    {
      objc_msgSend(v21, "colorWithAlphaComponent:", 0.25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIAvailabilityFreeSpanView setBackgroundColor:](v19, "setBackgroundColor:", v23);

      -[EKUIAvailabilityFreeSpanView setBorderColor:](v19, "setBorderColor:", v15);
    }
    else
    {
      -[EKUIAvailabilityFreeSpanView setBackgroundColor:](v19, "setBackgroundColor:", v21);

      v24 = objc_msgSend(objc_retainAutorelease(v15), "CGColor");
      -[EKUIAvailabilityFreeSpanView layer](v19, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBorderColor:", v24);

      -[EKUIAvailabilityFreeSpanView layer](v19, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBorderWidth:", 1.5);

    }
  }
  +[EKUIAvailabilityRowView cornerRadius](EKUIAvailabilityRowView, "cornerRadius");
  v28 = v27;
  -[EKUIAvailabilityFreeSpanView layer](v19, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCornerRadius:", v28);

  -[EKUIAvailabilityFreeSpanView layer](v19, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMasksToBounds:", 1);

  return v19;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  CGContext *CurrentContext;
  id v10;
  double v11;
  double v12;
  id v13;
  __int128 v14;
  uint64_t v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = *MEMORY[0x1E0C80C00];
  -[EKUIAvailabilityFreeSpanView borderColor](self, "borderColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(CurrentContext, 1.0);
    CGContextSetLineCap(CurrentContext, kCGLineCapRound);
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    v14 = xmmword_1AFA135C0;
    CGContextSetLineDash(CurrentContext, 0.0, (const CGFloat *)&v14, 2uLL);
    -[EKUIAvailabilityFreeSpanView borderColor](self, "borderColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v10, "CGColor"));

    CGContextBeginPath(CurrentContext);
    +[EKUIAvailabilityRowView cornerRadius](EKUIAvailabilityRowView, "cornerRadius");
    if (v11 + v11 <= width + -1.0)
      v12 = v11;
    else
      v12 = (width + -1.0) * 0.5;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v12);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v13, "CGPath"));

    CGContextDrawPath(CurrentContext, kCGPathStroke);
  }
}

- (UIColor)borderColor
{
  return (UIColor *)objc_getProperty(self, a2, 416, 1);
}

- (void)setBorderColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 424, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 432, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
