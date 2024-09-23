@implementation MTCollectionSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTCollectionSectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCollectionSectionHeaderView"), CFSTR("textLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  double v2;
  double v3;

  -[MTCollectionSectionHeaderViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  return v3 == *(double *)(MEMORY[0x24BDBF148] + 8) && v2 == *MEMORY[0x24BDBF148];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MTCollectionSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

@end
