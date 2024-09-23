@implementation QLRoundProgressView

- (QLRoundProgressView)initWithFrame:(CGRect)a3
{
  QLRoundProgressView *v3;
  void *v4;
  QLRoundProgressView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLRoundProgressView;
  v3 = -[QLRoundProgressView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLRoundProgressView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = v3;
  }

  return v3;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLRoundProgressView;
  -[QLRoundProgressView didMoveToWindow](&v8, sel_didMoveToWindow);
  -[QLRoundProgressView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;
  -[QLRoundProgressView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentsScale:", v6);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setProgress:(double)a3
{
  -[QLRoundProgressView setProgress:animated:](self, "setProgress:animated:", 0, a3);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = fmin(a3, 1.0);
  if (v5 >= 0.0)
    v6 = v5;
  else
    v6 = 0.0;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("progress"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[QLRoundProgressView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentationLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "progress");
    objc_msgSend(v8, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", v11);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToValue:", v12);

    objc_msgSend(v7, "setDuration:", 0.2);
    -[QLRoundProgressView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAnimation:forKey:", v7, CFSTR("progress"));

  }
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  -[QLRoundProgressView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProgress:", v6);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (double)progress
{
  void *v2;
  double v3;
  double v4;

  -[QLRoundProgressView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progress");
  v4 = v3;

  return v4;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  id v16;
  id v17;
  id v18;
  id v19;

  objc_msgSend(a3, "progress");
  v7 = v6 * 6.28318531 + -1.57079633;
  -[QLRoundProgressView bounds](self, "bounds");
  v9 = v8 * 0.5;
  -[QLRoundProgressView bounds](self, "bounds");
  v11 = v10 * 0.5;
  -[QLRoundProgressView bounds](self, "bounds");
  if (v12 < 40.0)
    v13 = 2.0;
  else
    v13 = 4.0;
  if (v9 >= v11)
    v14 = v11;
  else
    v14 = v9;
  v15 = v14 - v13 * 0.5;
  CGContextSaveGState(a4);
  CGContextBeginPath(a4);
  CGContextMoveToPoint(a4, v9, v11);
  CGContextAddLineToPoint(a4, v9, 0.0);
  CGContextAddArc(a4, v9, v11, v15, -1.57079633, v7, 0);
  CGContextClosePath(a4);
  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v16, "CGColor"));

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v17, "CGColor"));

  CGContextDrawPath(a4, kCGPathFillStroke);
  CGContextRestoreGState(a4);
  CGContextSaveGState(a4);
  CGContextBeginPath(a4);
  CGContextMoveToPoint(a4, v9 + v15, v11);
  CGContextAddArc(a4, v9, v11, v15, 0.0, 3.14159265, 1);
  CGContextAddArc(a4, v9, v11, v15, 3.14159265, 6.28318531, 1);
  CGContextClosePath(a4);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v18, "CGColor"));

  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v19, "CGColor"));

  CGContextSetLineWidth(a4, v13);
  CGContextDrawPath(a4, kCGPathFillStroke);
  CGContextRestoreGState(a4);
}

@end
