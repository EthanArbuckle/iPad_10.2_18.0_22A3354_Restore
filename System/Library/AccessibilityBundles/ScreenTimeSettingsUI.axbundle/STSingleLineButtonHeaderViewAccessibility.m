@implementation STSingleLineButtonHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STSingleLineButtonHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STSingleLineButtonHeaderView"), CFSTR("STSingleLineHeaderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSingleLineHeaderView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSingleLineButtonHeaderView"), CFSTR("button"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[STSingleLineButtonHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v4);
  v5 = (void *)MEMORY[0x24BDBCE30];
  -[STSingleLineButtonHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 2, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
