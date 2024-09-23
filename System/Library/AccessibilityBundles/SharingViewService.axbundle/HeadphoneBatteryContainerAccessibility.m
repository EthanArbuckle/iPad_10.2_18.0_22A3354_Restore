@implementation HeadphoneBatteryContainerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SharingViewService.HeadphoneBatteryContainer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SharingViewService.HeadphoneBatteryContainer"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SharingViewService.HeadphoneBatteryContainer"), CFSTR("UIView"));

}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  double v3;
  double v4;
  BOOL result;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HeadphoneBatteryContainerAccessibility;
  -[HeadphoneBatteryContainerAccessibility accessibilityFrame](&v7, sel_accessibilityFrame);
  result = 1;
  if (fabs(v3) >= 0.001 && fabs(v4) >= 0.001 && v3 > 0.0 && v4 > 0.0)
  {
    v6.receiver = self;
    v6.super_class = (Class)HeadphoneBatteryContainerAccessibility;
    return -[HeadphoneBatteryContainerAccessibility _accessibilityOverridesInvalidFrames](&v6, sel__accessibilityOverridesInvalidFrames);
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
  objc_super v19;
  CGRect result;

  v19.receiver = self;
  v19.super_class = (Class)HeadphoneBatteryContainerAccessibility;
  -[HeadphoneBatteryContainerAccessibility accessibilityFrame](&v19, sel_accessibilityFrame);
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
      objc_msgSend(v12, "accessibilityFrame");
      v8 = v14;
    }

  }
  v15 = v5;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

@end
