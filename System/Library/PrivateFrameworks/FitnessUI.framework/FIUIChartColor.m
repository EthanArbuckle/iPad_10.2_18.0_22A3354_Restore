@implementation FIUIChartColor

- (FIUIChartColor)initWithThreshold:(double)a3 startColor:(id)a4 endColor:(id)a5
{
  id v8;
  id v9;
  FIUIChartColor *v10;
  FIUIChartColor *v11;
  const __CFArray *v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FIUIChartColor;
  v10 = -[FIUIChartColor init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_threshold = a3;
    v15[0] = objc_msgSend(objc_retainAutorelease(v8), "CGColor");
    v15[1] = objc_msgSend(objc_retainAutorelease(v9), "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
    v12 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v11->_gradient = CGGradientCreateWithColors(0, v12, 0);

  }
  return v11;
}

- (FIUIChartColor)initWithThreshold:(double)a3 color:(id)a4
{
  id v6;
  FIUIChartColor *v7;
  FIUIChartColor *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FIUIChartColor;
  v7 = -[FIUIChartColor init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_threshold = a3;
    v7->_color = (CGColor *)objc_msgSend(objc_retainAutorelease(v6), "CGColor");
  }

  return v8;
}

- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MidX;
  CGFloat MinY;
  CGFloat v12;
  CGPoint v13;
  CGPoint v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGContextSaveGState(a4);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  CGContextClipToRect(a4, v15);
  if (self->_gradient)
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    MidX = CGRectGetMidX(v16);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MinY = CGRectGetMinY(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v12 = CGRectGetMidX(v18);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v14.y = CGRectGetMaxY(v19);
    v13.x = MidX;
    v13.y = MinY;
    v14.x = v12;
    CGContextDrawLinearGradient(a4, self->_gradient, v13, v14, 0);
  }
  else
  {
    CGContextSetFillColorWithColor(a4, self->_color);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    CGContextFillRect(a4, v20);
  }
  CGContextRestoreGState(a4);
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

@end
