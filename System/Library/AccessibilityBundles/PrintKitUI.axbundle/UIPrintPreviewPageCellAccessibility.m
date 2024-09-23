@implementation UIPrintPreviewPageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPrintPreviewPageCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPrintPreviewPageCell"), CFSTR("pageLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPrintPreviewPageCell"), CFSTR("checkmarkImageView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[UIPrintPreviewPageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  return 0;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("print.preview.cell.double.tap.hint"));
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

  -[UIPrintPreviewPageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageLabel"));
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
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPrintPreviewPageCellAccessibility;
  v3 = -[UIPrintPreviewPageCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[UIPrintPreviewPageCellAccessibility _axIsPageInSelection](self, "_axIsPageInSelection");
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (BOOL)_axIsPageInSelection
{
  void *v2;
  double v3;
  BOOL v4;

  -[UIPrintPreviewPageCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("checkmarkImageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3 > 0.1;

  return v4;
}

@end
