@implementation STSingleLineHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STSingleLineHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSingleLineHeaderView"), CFSTR("titleLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[STSingleLineHeaderViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSingleLineHeaderViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[STSingleLineHeaderViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
