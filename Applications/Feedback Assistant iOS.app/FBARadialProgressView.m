@implementation FBARadialProgressView

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBARadialProgressView;
  -[FBARadialProgressView awakeFromNib](&v4, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[FBARadialProgressView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)setProgress:(float)a3
{
  if (a3 > 1.0)
    a3 = 1.0;
  self->_progress = fmaxf(a3, 0.0);
  -[FBARadialProgressView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  CGFloat Height;
  CGContext *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  float v16;
  double v17;
  double MinX;
  double v19;
  double MinY;
  double v21;
  void *v22;
  CGFloat v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[FBARadialProgressView bounds](self, "bounds");
  Height = CGRectGetHeight(v25);
  CGContextTranslateCTM(CurrentContext, 0.0, Height);
  v6 = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(v6, 1.0, -1.0);
  v24 = (id)objc_claimAutoreleasedReturnValue(-[FBARadialProgressView tintColor](self, "tintColor"));
  -[FBARadialProgressView bounds](self, "bounds");
  -[FBARadialProgressView circleRectForFrame:](self, "circleRectForFrame:");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:"));
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  v23 = CGRectGetWidth(v26) * 0.5;
  objc_msgSend(v24, "set");
  objc_msgSend(v15, "setLineWidth:", 1.0);
  objc_msgSend(v15, "stroke");
  -[FBARadialProgressView progress](self, "progress");
  v17 = v16 * -2.0 * 3.14159265 + 1.57079633;
  v27.origin.x = v8;
  v27.origin.y = v10;
  v27.size.width = v12;
  v27.size.height = v14;
  MinX = CGRectGetMinX(v27);
  v28.origin.x = v8;
  v28.origin.y = v10;
  v28.size.width = v12;
  v28.size.height = v14;
  v19 = MinX + CGRectGetWidth(v28) * 0.5;
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v14;
  MinY = CGRectGetMinY(v29);
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  v21 = MinY + CGRectGetHeight(v30) * 0.5;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  objc_msgSend(v22, "moveToPoint:", v19, v21);
  objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v19, v21, v23, 1.57079633, v17);
  objc_msgSend(v22, "addLineToPoint:", v19, v21);
  objc_msgSend(v22, "closePath");
  objc_msgSend(v22, "fill");

}

- (CGRect)circleRectForFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = CGRectGetWidth(a3);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v8 = CGRectGetHeight(v15);
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  v10 = v9 + -2.0;
  v11 = (v7 - (v9 + -2.0)) * 0.5;
  v12 = (v8 - (v9 + -2.0)) * 0.5;
  v13 = v11;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v10;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (float)progress
{
  return self->_progress;
}

@end
