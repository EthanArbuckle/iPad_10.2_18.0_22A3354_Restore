@implementation HeadphoneMovieBatteryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HeadphoneProxService.HeadphoneMovieBatteryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("HeadphoneProxService.HeadphoneMovieBatteryView"));
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  double v3;
  double v4;
  BOOL result;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HeadphoneMovieBatteryViewAccessibility;
  -[HeadphoneMovieBatteryViewAccessibility accessibilityFrame](&v7, sel_accessibilityFrame);
  result = 1;
  if (fabs(v3) >= 0.001 && fabs(v4) >= 0.001 && v3 > 0.0 && v4 > 0.0)
  {
    v6.receiver = self;
    v6.super_class = (Class)HeadphoneMovieBatteryViewAccessibility;
    return -[HeadphoneMovieBatteryViewAccessibility _accessibilityOverridesInvalidFrames](&v6, sel__accessibilityOverridesInvalidFrames);
  }
  return result;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)HeadphoneMovieBatteryViewAccessibility;
  -[HeadphoneMovieBatteryViewAccessibility accessibilityFrame](&v21, sel_accessibilityFrame);
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  if (fabs(v2) < 0.001 || fabs(v3) < 0.001 || v2 <= 0.0 || v3 <= 0.0)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "accessibilityFrame");
      v5 = v13;
      v7 = v14;
      v8 = v15;
      v9 = v16;
    }

  }
  v17 = v5;
  v18 = v7;
  v19 = v8;
  v20 = v9;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end
