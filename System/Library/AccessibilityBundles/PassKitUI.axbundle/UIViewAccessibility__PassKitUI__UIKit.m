@implementation UIViewAccessibility__PassKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  void *v3;
  char v4;
  objc_super v6;

  -[UIViewAccessibility__PassKitUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", kAXPriceViewIdentifier);

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__PassKitUI__UIKit;
  return -[UIViewAccessibility__PassKitUI__UIKit _accessibilityUseAccessibilityFrameForHittest](&v6, sel__accessibilityUseAccessibilityFrameForHittest);
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  void *v3;
  char v4;
  objc_super v6;

  -[UIViewAccessibility__PassKitUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", kAXPriceViewIdentifier);

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__PassKitUI__UIKit;
  return -[UIViewAccessibility__PassKitUI__UIKit _accessibilityOverridesInvalidFrames](&v6, sel__accessibilityOverridesInvalidFrames);
}

- (CGRect)accessibilityFrame
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
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
  double v22;
  objc_super v23;
  CGRect result;

  -[UIViewAccessibility__PassKitUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", kAXPriceViewIdentifier);

  if (v4
    && (-[UIViewAccessibility__PassKitUI__UIKit _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_8), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "accessibilityFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)UIViewAccessibility__PassKitUI__UIKit;
    -[UIViewAccessibility__PassKitUI__UIKit accessibilityFrame](&v23, sel_accessibilityFrame);
    v8 = v15;
    v10 = v16;
    v12 = v17;
    v14 = v18;
  }
  v19 = v8;
  v20 = v10;
  v21 = v12;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

@end
