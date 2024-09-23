@implementation TitleSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NowPlayingUI.TitleSectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.TitleSectionHeaderView"), CFSTR("accessibilityTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.TitleSectionHeaderView"), CFSTR("accessibilitySystemStyleButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.TitleSectionHeaderView"), CFSTR("accessibilityAdditionalContentView"), "@", 0);

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
  return (id)-[TitleSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitle"));
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
