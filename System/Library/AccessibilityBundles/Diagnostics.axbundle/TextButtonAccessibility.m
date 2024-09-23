@implementation TextButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Diagnostics.TextButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.TextButton"), CFSTR("button"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[TextButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("button"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TextButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[TextButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
