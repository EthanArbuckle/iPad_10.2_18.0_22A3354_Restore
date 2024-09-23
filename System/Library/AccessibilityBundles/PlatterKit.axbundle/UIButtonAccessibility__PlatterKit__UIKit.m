@implementation UIButtonAccessibility__PlatterKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  UIButtonAccessibility__PlatterKit__UIKit *v11;
  void *v12;
  int v13;
  UIView *v14;
  UIView *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;

  v28.receiver = self;
  v28.super_class = (Class)UIButtonAccessibility__PlatterKit__UIKit;
  -[UIButtonAccessibility__PlatterKit__UIKit accessibilityFrame](&v28, sel_accessibilityFrame);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = self;
  -[UIButtonAccessibility__PlatterKit__UIKit accessibilityIdentification](v11, "accessibilityIdentification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("HeaderAppIcon"));

  if (v13)
  {
    -[UIButtonAccessibility__PlatterKit__UIKit superview](v11, "superview");
    v14 = (UIView *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      -[UIView bounds](v14, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      -[UIButtonAccessibility__PlatterKit__UIKit frame](v11, "frame");
      v33.origin.x = v17;
      v33.origin.y = v19;
      v33.size.width = v21;
      v33.size.height = v23;
      v30 = CGRectIntersection(v29, v33);
      v31 = UIAccessibilityConvertFrameToScreenCoordinates(v30, v15);
      x = v31.origin.x;
      y = v31.origin.y;
      width = v31.size.width;
      height = v31.size.height;
    }

  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

@end
