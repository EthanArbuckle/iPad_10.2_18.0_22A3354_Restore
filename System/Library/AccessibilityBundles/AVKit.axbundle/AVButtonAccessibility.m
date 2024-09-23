@implementation AVButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVButton"), CFSTR("hasAlternateAppearance"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIButton"), CFSTR("imageView"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __CFString *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  char v17;

  -[AVButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Right Secondary Control"));

  if (v5)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = CFSTR("next.track");
LABEL_12:
      accessibilityLocalizedString(v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  else
  {
    -[AVButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Left Secondary Control"));

    if (!v9)
    {
      v17 = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageAsset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safeStringForKey:", CFSTR("assetName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("rectangle.split.2x2")) & 1) != 0)
      {
        v7 = CFSTR("multiview.button");
      }
      else
      {
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("fitness.edit.video.metrics")))
        {

          v16.receiver = self;
          v16.super_class = (Class)AVButtonAccessibility;
          -[AVButtonAccessibility accessibilityLabel](&v16, sel_accessibilityLabel);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        v7 = CFSTR("metrics.button");
      }
      goto LABEL_12;
    }
    objc_msgSend(v3, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = CFSTR("previous.track");
      goto LABEL_12;
    }
  }
  v10 = v6;
LABEL_13:
  v14 = v10;

LABEL_14:
  return v14;
}

- (CGRect)accessibilityFrame
{
  double v2;
  CGFloat x;
  double v4;
  CGFloat y;
  double v6;
  CGFloat width;
  double v8;
  CGFloat height;
  void *v10;
  void *v11;
  char isKindOfClass;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  v19.receiver = self;
  v19.super_class = (Class)AVButtonAccessibility;
  -[AVButtonAccessibility accessibilityFrame](&v19, sel_accessibilityFrame);
  x = v2;
  y = v4;
  width = v6;
  height = v8;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("AVMobileChromelessDisplayModeControlsView"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v13 = CGRectGetWidth(v20) * -0.75;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v14 = CGRectGetHeight(v21) * -0.75;
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v23 = CGRectInset(v22, v13, v14);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

@end
