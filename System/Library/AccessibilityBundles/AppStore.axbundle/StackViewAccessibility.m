@implementation StackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.StackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.StackView"), CFSTR("accessibilityNonHiddenSubviews"), "@", 0);
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
