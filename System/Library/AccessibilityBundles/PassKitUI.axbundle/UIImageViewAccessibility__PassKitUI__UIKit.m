@implementation UIImageViewAccessibility__PassKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect result;

  -[UIImageViewAccessibility__PassKitUI__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("LogoImage"));

  if (v4)
  {
    -[UIImageViewAccessibility__PassKitUI__UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("LogoRect"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rectValue");
    CGRectInset(v23, -20.0, -20.0);
    UIAccessibilityFrameForBounds();
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)UIImageViewAccessibility__PassKitUI__UIKit;
    -[UIImageViewAccessibility__PassKitUI__UIKit accessibilityFrame](&v22, sel_accessibilityFrame);
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

@end
