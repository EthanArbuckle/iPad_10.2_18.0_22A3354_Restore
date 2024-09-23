@implementation SUUISwooshViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUISwooshView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setTitle:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUISwooshViewAccessibility;
  -[SUUISwooshViewAccessibility setTitle:](&v5, sel_setTitle_, a3);
  -[SUUISwooshViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF7410] | *MEMORY[0x24BDF73C0]);

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  return 0.0;
}

@end
