@implementation FMR1GlyphButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FMFindingUI.FMR1GlyphButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("FMFindingUI.FMR1GlyphButton"), CFSTR("UIView"));
}

- (id)accessibilityPath
{
  double v3;
  UIBezierPath *v4;
  void *v5;

  -[FMR1GlyphButtonAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("bounds"));
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", 0.0, 0.0, v3, v3);
  v4 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityConvertPathToScreenCoordinates(v4, (UIView *)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMR1GlyphButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[FMR1GlyphButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
