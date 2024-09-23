@implementation SeymourUI_MarketingHeaderBannerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.MarketingHeaderBannerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.MarketingHeaderBannerCell"), CFSTR("accessibilityConfigureForPlayback:"), "v", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, MEMORY[0x23491D424](CFSTR("SeymourUI.PlayButton"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SeymourUI_MarketingHeaderBannerCellAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:classExclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:classExclusions:", 0, 1, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)accessibilityConfigureForPlayback:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  _QWORD *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SeymourUI_MarketingHeaderBannerCellAccessibility;
  v5 = *MEMORY[0x24BDF73B0] | (unint64_t)-[SeymourUI_MarketingHeaderBannerCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v6 = (_QWORD *)MEMORY[0x24BDF7408];
  if (!v3)
    v6 = (_QWORD *)MEMORY[0x24BDF73D8];
  -[SeymourUI_MarketingHeaderBannerCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *v6 | v5);
}

@end
