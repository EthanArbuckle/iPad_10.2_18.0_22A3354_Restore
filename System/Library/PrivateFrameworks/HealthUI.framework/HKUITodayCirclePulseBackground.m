@implementation HKUITodayCirclePulseBackground

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext;
  CGContext *v5;
  void *v6;
  CGRect v7;

  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    v5 = CurrentContext;
    HKHealthKeyColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFill");

    -[HKUITodayCirclePulseBackground bounds](self, "bounds");
    CGContextFillEllipseInRect(v5, v7);
    CGContextFlush(v5);
  }
}

@end
