@implementation _TVListSectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVListSectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("TVButton"));
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[_TVListSectionViewCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)_accessibilitySupportsSemanticContext
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVListSectionViewCellAccessibility;
  return *MEMORY[0x24BDF73C0] | -[_TVListSectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
