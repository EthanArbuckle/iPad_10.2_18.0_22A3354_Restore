@implementation MonogramSimulationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MonogramPosterExtension.MonogramSimulationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MonogramPosterExtension.MonogramSimulationView"), CFSTR("UIView"));
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("monogram.description"));
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "frame");
  v12 = v11 * 0.25;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v22 = CGRectInset(v21, 0.0, v12);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v6;
  void *v7;
  void *v8;
  id v9;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "accessibilityFrame"), v11.x = x, v11.y = y, CGRectContainsPoint(v12, v11)))
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

@end
