@implementation AVPictureInPictureUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  void *v14;
  double v15;
  double v16;
  objc_super v17;
  CGPoint result;
  CGRect v19;
  CGRect v20;

  -[AVPictureInPictureUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PIPUIView"));

  if (v4)
  {
    -[AVPictureInPictureUIViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPIPConvertedBoundsKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "floatValue");
      v8 = v7;
    }
    else
    {
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v13 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](v13, "bounds");
      v20 = UIAccessibilityConvertFrameToScreenCoordinates(v19, v13);
      v20.origin.x = v20.size.width * 0.5;
      v8 = v20.size.width * 0.5;
      *(float *)&v20.origin.x = v8;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20.origin.x, v20.origin.y);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureUIViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v14, CFSTR("AXPIPConvertedBoundsKey"));

    }
    v10 = v8;
    v12 = 1.0;

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)AVPictureInPictureUIViewAccessibility;
    -[AVPictureInPictureUIViewAccessibility accessibilityActivationPoint](&v17, sel_accessibilityActivationPoint);
    v10 = v9;
    v12 = v11;
  }
  v15 = v10;
  v16 = v12;
  result.y = v16;
  result.x = v15;
  return result;
}

- (BOOL)_accessibilityIsUsingRemoteParentActivateAction
{
  void *v3;
  char v4;
  objc_super v6;

  -[AVPictureInPictureUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PIPUIView"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)AVPictureInPictureUIViewAccessibility;
  return -[AVPictureInPictureUIViewAccessibility _accessibilityIsUsingRemoteParentActivateAction](&v6, sel__accessibilityIsUsingRemoteParentActivateAction);
}

@end
