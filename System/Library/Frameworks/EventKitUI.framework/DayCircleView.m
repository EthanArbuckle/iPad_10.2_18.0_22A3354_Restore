@implementation DayCircleView

- (DayCircleView)initWithFrame:(CGRect)a3
{
  DayCircleView *v3;
  void *v4;
  uint64_t v5;
  UIColor *circleColor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DayCircleView;
  v3 = -[DayCircleView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DayCircleView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    CalendarAppCircleNonTodayBGColor();
    v5 = objc_claimAutoreleasedReturnValue();
    circleColor = v3->_circleColor;
    v3->_circleColor = (UIColor *)v5;

  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  CGRect v5;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[UIColor set](self->_circleColor, "set");
  -[DayCircleView bounds](self, "bounds");
  CGContextFillEllipseInRect(CurrentContext, v5);
}

- (UIColor)circleColor
{
  return self->_circleColor;
}

- (void)setCircleColor:(id)a3
{
  objc_storeStrong((id *)&self->_circleColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleColor, 0);
}

@end
