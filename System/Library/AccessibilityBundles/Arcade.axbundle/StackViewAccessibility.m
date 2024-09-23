@implementation StackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.StackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[StackViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityNonHiddenSubviews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
