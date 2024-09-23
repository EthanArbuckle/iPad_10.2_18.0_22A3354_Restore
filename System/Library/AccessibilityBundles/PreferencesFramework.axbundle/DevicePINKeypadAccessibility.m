@implementation DevicePINKeypadAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DevicePINKeypad");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("DevicePINPane"));
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  return 1;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
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
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;
  CGRect v20;

  -[DevicePINKeypadAccessibility bounds](self, "bounds");
  UIAccessibilityFrameForBounds();
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  -[DevicePINKeypadAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("DevicePINPane")));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "accessibilityFrame");
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v18 = CGRectIntersection(v17, v20);
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

@end
