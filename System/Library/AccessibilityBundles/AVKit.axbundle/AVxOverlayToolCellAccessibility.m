@implementation AVxOverlayToolCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVxOverlayToolCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;
  objc_super v6;

  _UIAccessibilityFocusedElements();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", self);

  if (!v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)AVxOverlayToolCellAccessibility;
  return -[AVxOverlayToolCellAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
