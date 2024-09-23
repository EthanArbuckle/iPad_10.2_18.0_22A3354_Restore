@implementation SummaryActivityRingsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SummaryActivityRingsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("ARUIRingsView"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, MEMORY[0x23491D424](CFSTR("ARUIRingsView"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SummaryActivityRingsViewAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:classExclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:classExclusions:", 0, 1, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SummaryActivityRingsViewAccessibility;
  return *MEMORY[0x24BDF7410] | -[SummaryActivityRingsViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
