@implementation VUIMenuSectionHeaderCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIMenuSectionHeaderCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("VUIMenuSectionHeaderCollectionViewCell"), CFSTR("titleLabel"), "@");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[VUIMenuSectionHeaderCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIMenuSectionHeaderCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73C0] | -[VUIMenuSectionHeaderCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
