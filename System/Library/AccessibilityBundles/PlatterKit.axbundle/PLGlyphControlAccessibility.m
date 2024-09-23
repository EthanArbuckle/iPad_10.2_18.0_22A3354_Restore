@implementation PLGlyphControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLGlyphControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLGlyphControl"), CFSTR("_backgroundMaterialView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLGlyphControl"), CFSTR("_cornerRadius"), "d", 0);

}

- (id)accessibilityPath
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  UIBezierPath *v14;
  UIView *v15;
  void *v16;

  -[PLGlyphControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundMaterialView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)MEMORY[0x24BDF6870];
  -[PLGlyphControlAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("_cornerRadius"));
  objc_msgSend(v12, "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, v13);
  v14 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  -[PLGlyphControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundMaterialView"));
  v15 = (UIView *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityConvertPathToScreenCoordinates(v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[PLGlyphControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundMaterialView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
