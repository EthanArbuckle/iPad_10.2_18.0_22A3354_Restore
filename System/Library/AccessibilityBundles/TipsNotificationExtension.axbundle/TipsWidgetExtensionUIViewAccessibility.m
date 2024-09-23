@implementation TipsWidgetExtensionUIViewAccessibility

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

  -[TipsWidgetExtensionUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", kAXSingleTipsViewIdentifier);

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)TipsWidgetExtensionUIViewAccessibility;
  return -[TipsWidgetExtensionUIViewAccessibility _accessibilityUseAccessibilityFrameForHittest](&v6, sel__accessibilityUseAccessibilityFrameForHittest);
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  void *v3;
  char v4;
  objc_super v6;

  -[TipsWidgetExtensionUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", kAXSingleTipsViewIdentifier);

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)TipsWidgetExtensionUIViewAccessibility;
  return -[TipsWidgetExtensionUIViewAccessibility _accessibilityOverridesInvalidFrames](&v6, sel__accessibilityOverridesInvalidFrames);
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
  CGRect result;

  -[TipsWidgetExtensionUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", kAXSingleTipsViewIdentifier);

  if (v4)
  {
    -[TipsWidgetExtensionUIViewAccessibility superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)TipsWidgetExtensionUIViewAccessibility;
    -[TipsWidgetExtensionUIViewAccessibility accessibilityFrame](&v22, sel_accessibilityFrame);
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
