@implementation ScreenDimmingView

- (ScreenDimmingView)init
{
  ScreenDimmingView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ScreenDimmingView;
  v2 = -[ScreenDimmingView init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.01));
    -[ScreenDimmingView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[ScreenDimmingView setDimLevel:](v2, "setDimLevel:", 0.4);
  }
  return v2;
}

- (void)setDimEnabled:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 dimEnabled;
  double dimLevel;
  _DWORD v8[2];
  __int16 v9;
  double v10;

  if (self->_dimEnabled != a3)
  {
    self->_dimEnabled = a3;
    v4 = LACLogUI(-[ScreenDimmingView setNeedsDisplay](self, "setNeedsDisplay"));
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dimEnabled = self->_dimEnabled;
      dimLevel = self->_dimLevel;
      v8[0] = 67109376;
      v8[1] = dimEnabled;
      v9 = 2048;
      v10 = dimLevel;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dimmed: %d alpha:%f", (uint8_t *)v8, 0x12u);
    }

  }
}

- (void)setDimLevel:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0)
    sub_100056670();
  self->_dimLevel = a3;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  void *v6;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)ScreenDimmingView;
  -[ScreenDimmingView drawRect:](&v7, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_dimEnabled)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    -[ScreenDimmingView bounds](self, "bounds");
    CGContextClearRect(CurrentContext, v8);
    -[ScreenDimmingView bounds](self, "bounds");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, self->_dimLevel));
    objc_msgSend(v6, "setFill");
    objc_msgSend(v5, "fill");

  }
}

- (BOOL)dimEnabled
{
  return self->_dimEnabled;
}

- (double)dimLevel
{
  return self->_dimLevel;
}

@end
