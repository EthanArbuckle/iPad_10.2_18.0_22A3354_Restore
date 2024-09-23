@implementation NTKWorldClockHighlightedMapLocationView

- (NTKWorldClockHighlightedMapLocationView)initWithFrame:(CGRect)a3 fillColor:(id)a4 strokeColor:(id)a5 strokeWidth:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  NTKWorldClockHighlightedMapLocationView *v16;
  NTKWorldClockHighlightedMapLocationView *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NTKWorldClockHighlightedMapLocationView;
  v16 = -[NTKWorldClockMapLocationView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_fillColor, a4);
    objc_storeStrong((id *)&v17->_strokeColor, a5);
    v17->_strokeWidth = a6;
    -[NTKWorldClockHighlightedMapLocationView setOpaque:](v17, "setOpaque:", 0);
  }

  return v17;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGContext *CurrentContext;
  id v17;
  id v18;
  CGFloat v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NTKWorldClockHighlightedMapLocationView strokeWidth](self, "strokeWidth");
  v9 = v8 * 0.5;
  -[NTKWorldClockHighlightedMapLocationView strokeWidth](self, "strokeWidth");
  v11 = v10 * 0.5;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v21 = CGRectInset(v20, v9, v11);
  v12 = v21.origin.x;
  v13 = v21.origin.y;
  v14 = v21.size.width;
  v15 = v21.size.height;
  CurrentContext = UIGraphicsGetCurrentContext();
  -[NTKWorldClockHighlightedMapLocationView fillColor](self, "fillColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v17, "CGColor"));

  -[NTKWorldClockHighlightedMapLocationView strokeColor](self, "strokeColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v18, "CGColor"));

  -[NTKWorldClockHighlightedMapLocationView strokeWidth](self, "strokeWidth");
  CGContextSetLineWidth(CurrentContext, v19);
  v22.origin.x = v12;
  v22.origin.y = v13;
  v22.size.width = v14;
  v22.size.height = v15;
  CGContextFillEllipseInRect(CurrentContext, v22);
  v23.origin.x = v12;
  v23.origin.y = v13;
  v23.size.width = v14;
  v23.size.height = v15;
  CGContextStrokeEllipseInRect(CurrentContext, v23);
  CGContextFillPath(CurrentContext);
}

- (void)setFillColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_fillColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    -[NTKWorldClockHighlightedMapLocationView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setStrokeColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_strokeColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_strokeColor, a3);
    -[NTKWorldClockHighlightedMapLocationView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
