@implementation TitleSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.TitleSectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TitleSectionHeaderView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TitleSectionHeaderView"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TitleSectionHeaderView"), CFSTR("accessibilitySystemStyleButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TitleSectionHeaderView"), CFSTR("accessibilityAdditionalContentView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[TitleSectionHeaderViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TitleSectionHeaderViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[TitleSectionHeaderViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[TitleSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TitleSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TitleSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySystemStyleButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[TitleSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAdditionalContentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);

  return v3;
}

@end
