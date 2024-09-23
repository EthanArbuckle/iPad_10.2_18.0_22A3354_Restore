@implementation EKDayOccurrenceResizeHandleView

- (CGRect)_circleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[EKDayOccurrenceResizeHandleView bounds](self, "bounds");
  v3 = (v2 + -7.0) * 0.5;
  v4 = 7.0;
  v5 = 7.0;
  v6 = v3;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v6;
  result.origin.x = v3;
  return result;
}

- (EKDayOccurrenceResizeHandleView)initWithFrame:(CGRect)a3 occurrenceView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  EKDayOccurrenceResizeHandleView *v10;
  void *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKDayOccurrenceResizeHandleView;
  v10 = -[EKDayOccurrenceResizeHandleView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    objc_msgSend(v9, "currentImageState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceResizeHandleView setBaseColor:](v10, "setBaseColor:", v12);

    objc_storeWeak((id *)&v10->_occurrenceView, v9);
    -[EKDayOccurrenceResizeHandleView setOpaque:](v10, "setOpaque:", 0);
  }

  return v10;
}

- (void)willMoveToSuperview:(id)a3
{
  if (!a3)
    objc_storeWeak((id *)&self->_occurrenceView, 0);
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[EKDayOccurrenceResizeHandleView _circleRect](self, "_circleRect");
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  v19 = CGRectInset(v18, -0.5, -0.5);
  v9 = v19.origin.x;
  v10 = v19.origin.y;
  v11 = v19.size.width;
  v12 = v19.size.height;
  CGContextSetCompositeOperation();
  -[UIColor setFill](self->_baseColor, "setFill");
  v20.origin.x = v9;
  v20.origin.y = v10;
  v20.size.width = v11;
  v20.size.height = v12;
  CGContextFillEllipseInRect(CurrentContext, v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v22 = CGRectInset(v21, 0.5, 0.5);
  v13 = v22.origin.x;
  v14 = v22.origin.y;
  v15 = v22.size.width;
  v16 = v22.size.height;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFill");

  v23.origin.x = v13;
  v23.origin.y = v14;
  v23.size.width = v15;
  v23.size.height = v16;
  CGContextFillEllipseInRect(CurrentContext, v23);
}

- (UIColor)baseColor
{
  return self->_baseColor;
}

- (void)setBaseColor:(id)a3
{
  objc_storeStrong((id *)&self->_baseColor, a3);
}

- (EKDayOccurrenceView)occurrenceView
{
  return (EKDayOccurrenceView *)objc_loadWeakRetained((id *)&self->_occurrenceView);
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseColor, 0);
  objc_destroyWeak((id *)&self->_occurrenceView);
}

@end
