@implementation NTKWorldClockMapLocationView

- (NTKWorldClockMapLocationView)initWithFrame:(CGRect)a3
{
  NTKWorldClockMapLocationView *v3;
  NTKWorldClockMapLocationView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockMapLocationView;
  v3 = -[NTKWorldClockMapLocationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NTKWorldClockMapLocationView setOpaque:](v3, "setOpaque:", 0);
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  id v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v8, "CGColor"));

  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  CGContextFillEllipseInRect(CurrentContext, v9);
  CGContextFillPath(CurrentContext);
}

- (void)positionAtPoint:(CGPoint)a3 withinBounds:(CGRect)a4
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double height;
  double MaxX;
  double v13;
  double MaxY;
  double v15;
  CGFloat rect;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  rect = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[NTKWorldClockMapLocationView frame](self, "frame");
  UIRectCenteredAboutPointScale();
  v8 = v17.origin.x;
  v9 = v17.origin.y;
  v10 = v17.size.width;
  height = v17.size.height;
  if (CGRectGetMinX(v17) < 0.0)
    v8 = 0.0;
  v18.origin.x = v8;
  v18.origin.y = v9;
  v18.size.width = v10;
  v18.size.height = height;
  if (CGRectGetMinY(v18) < 0.0)
    v9 = 0.0;
  v19.origin.x = v8;
  v19.origin.y = v9;
  v19.size.width = v10;
  v19.size.height = height;
  MaxX = CGRectGetMaxX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = rect;
  if (MaxX > CGRectGetWidth(v20))
  {
    v21.origin.x = x;
    v21.size.height = rect;
    v21.origin.y = y;
    v21.size.width = width;
    v13 = CGRectGetWidth(v21);
    v22.origin.x = v8;
    v22.origin.y = v9;
    v22.size.width = v10;
    v22.size.height = height;
    v8 = v13 - CGRectGetWidth(v22);
  }
  v23.origin.x = v8;
  v23.origin.y = v9;
  v23.size.width = v10;
  v23.size.height = height;
  MaxY = CGRectGetMaxY(v23);
  v24.origin.x = x;
  v24.size.height = rect;
  v24.origin.y = y;
  v24.size.width = width;
  if (MaxY > CGRectGetHeight(v24))
  {
    v25.origin.x = x;
    v25.size.height = rect;
    v25.origin.y = y;
    v25.size.width = width;
    v15 = CGRectGetHeight(v25);
    v26.origin.x = v8;
    v26.origin.y = v9;
    v26.size.width = v10;
    v26.size.height = height;
    v9 = v15 - CGRectGetHeight(v26);
  }
  -[NTKWorldClockMapLocationView setFrame:](self, "setFrame:", v8, v9, v10, height);
}

@end
