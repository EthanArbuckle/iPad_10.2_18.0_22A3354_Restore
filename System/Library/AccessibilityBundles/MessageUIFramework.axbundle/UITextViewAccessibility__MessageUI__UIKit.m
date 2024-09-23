@implementation UITextViewAccessibility__MessageUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  -[UITextViewAccessibility__MessageUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("subjectField")))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("subject.text"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v5);

    v9.receiver = self;
    v9.super_class = (Class)UITextViewAccessibility__MessageUI__UIKit;
    -[UITextViewAccessibility__MessageUI__UIKit accessibilityLabel](&v9, sel_accessibilityLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v4, "appendString:", v6);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextViewAccessibility__MessageUI__UIKit;
    -[UITextViewAccessibility__MessageUI__UIKit accessibilityLabel](&v8, sel_accessibilityLabel);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  int v4;
  void *v5;
  UIView *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  -[UITextViewAccessibility__MessageUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("subjectField"));

  if (v4)
  {
    objc_opt_class();
    -[UITextViewAccessibility__MessageUI__UIKit superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (UIView *)objc_claimAutoreleasedReturnValue();

    -[UITextViewAccessibility__MessageUI__UIKit frame](self, "frame");
    v8 = v7;
    v10 = v9;
    -[UIView frame](v6, "frame");
    v24.origin.x = 0.0;
    v24.origin.y = v8;
    v24.size.height = v10;
    v25 = UIAccessibilityConvertFrameToScreenCoordinates(v24, v6);
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)UITextViewAccessibility__MessageUI__UIKit;
    -[UITextViewAccessibility__MessageUI__UIKit accessibilityFrame](&v23, sel_accessibilityFrame);
    x = v15;
    y = v16;
    width = v17;
    height = v18;
  }
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

@end
