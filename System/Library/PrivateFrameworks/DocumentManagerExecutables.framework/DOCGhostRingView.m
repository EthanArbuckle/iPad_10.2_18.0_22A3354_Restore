@implementation DOCGhostRingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (DOCGhostRingView)initWithFrame:(CGRect)a3
{
  DOCGhostRingView *v3;
  DOCGhostRingView *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCGhostRingView;
  v3 = -[DOCGhostRingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DOCGhostRingView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineCap:", *MEMORY[0x24BDE5CE8]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

  }
  return v4;
}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCGhostRingView;
  v4 = a3;
  -[DOCGhostRingView setTintColor:](&v8, sel_setTintColor_, v4);
  -[DOCGhostRingView layer](self, "layer", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "CGColor");

  objc_msgSend(v5, "setStrokeColor:", v7);
}

- (void)_updateShapePath
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v7;
  double MidX;
  double MidY;
  void *v10;
  id v11;
  double v12;
  id v13;
  CGRect v14;
  CGRect v15;

  -[DOCGhostRingView layer](self, "layer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[DOCGhostRingView bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v7 = v14.size.width * 0.5;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MidY = CGRectGetMidY(v15);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v7, -1.57079633, 4.71238898);
  v11 = objc_retainAutorelease(v10);
  objc_msgSend(v13, "setPath:", objc_msgSend(v11, "CGPath"));
  objc_msgSend(v13, "setBounds:", x, y, width, height);
  if (width >= height)
    v12 = height;
  else
    v12 = width;
  objc_msgSend(v13, "setLineWidth:", v12 / 36.0 * 3.0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCGhostRingView;
  -[DOCGhostRingView layoutSubviews](&v3, sel_layoutSubviews);
  -[DOCGhostRingView _updateShapePath](self, "_updateShapePath");
}

@end
