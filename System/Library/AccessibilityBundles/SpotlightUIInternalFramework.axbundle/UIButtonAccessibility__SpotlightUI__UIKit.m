@implementation UIButtonAccessibility__SpotlightUI__UIKit

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
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  v17.receiver = self;
  v17.super_class = (Class)UIButtonAccessibility__SpotlightUI__UIKit;
  -[UIButtonAccessibility__SpotlightUI__UIKit accessibilityFrame](&v17, sel_accessibilityFrame);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIButtonAccessibility__SpotlightUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("SPUIShowMoreButton"));

  if (v12)
    v13 = v10 + -30.0;
  else
    v13 = v10;
  if (v12)
    v14 = v6 + 15.0;
  else
    v14 = v6;
  v15 = v4;
  v16 = v8;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

@end
