@implementation VKTourGuideAccessibilityElement

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  -[VKTourGuideAccessibilityElement userLocationMarker](self, "userLocationMarker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  v11 = CGRectGetMidX(v16) + -60.0;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  v12 = CGRectGetMidY(v17) + -60.0;
  v13 = 120.0;
  v14 = v11;
  v15 = 120.0;
  result.size.height = v15;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v14;
  return result;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[VKTourGuideAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityTourStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityPath
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v6;
  double MidX;
  double MidY;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  -[VKTourGuideAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v6 = (void *)MEMORY[0x24BDF6870];
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return (id)objc_msgSend(v6, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, CGRectGetWidth(v12) * 0.5, 0.0, 6.28318531);
}

- (BOOL)pointInside:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id v6;
  const CGPath *v7;
  BOOL v8;
  BOOL result;
  CGPoint v10;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  -[VKTourGuideAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  v11.x = x;
  v11.y = y;
  result = 0;
  if (CGRectContainsPoint(v12, v11))
  {
    -[VKTourGuideAccessibilityElement accessibilityPath](self, "accessibilityPath");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const CGPath *)objc_msgSend(v6, "CGPath");
    v10.x = x;
    v10.y = y;
    v8 = CGPathContainsPoint(v7, 0, v10, 0);

    if (v8)
      return 1;
  }
  return result;
}

- (id)_accessibilityScrollStatus
{
  void *v2;
  void *v3;

  -[VKTourGuideAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityScrollStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (VKTourGuideAccessibilityElement)initWithAccessibilityContainer:(id)a3 userLocationMarker:(id)a4
{
  id v7;
  VKTourGuideAccessibilityElement *v8;
  VKTourGuideAccessibilityElement *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VKTourGuideAccessibilityElement;
  v8 = -[VKTourGuideAccessibilityElement initWithAccessibilityContainer:](&v11, sel_initWithAccessibilityContainer_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong(&v8->_userLocationMarker, a4);

  return v9;
}

- (id)userLocationMarker
{
  return self->_userLocationMarker;
}

- (void)setUserLocationMarker:(id)a3
{
  objc_storeStrong(&self->_userLocationMarker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userLocationMarker, 0);
}

@end
