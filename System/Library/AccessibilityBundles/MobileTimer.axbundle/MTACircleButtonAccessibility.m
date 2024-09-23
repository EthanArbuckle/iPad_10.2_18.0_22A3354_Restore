@implementation MTACircleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTACircleButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityPath
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v6;
  double v7;
  double v8;
  void *v9;
  double MidX;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  -[MTACircleButtonAccessibility accessibilityFrame](self, "accessibilityFrame");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  v6 = CGRectGetWidth(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v7 = CGRectGetHeight(v13);
  if (v6 >= v7)
    v7 = v6;
  v8 = v7 * 0.5;
  v9 = (void *)MEMORY[0x24BDF6870];
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  return (id)objc_msgSend(v9, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMidY(v15), v8, 0.0, 6.28318531);
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  float v3;
  BOOL v4;

  -[MTACircleButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("alpha"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3 == 1.0;

  return v4;
}

@end
