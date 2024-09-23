@implementation RootSideBarProfileViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.RootSideBarProfileView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("VUILabel"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDBCEE0];
  -[RootSideBarProfileViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_mappedArrayUsingBlock:", &__block_literal_global_187);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __57__RootSideBarProfileViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("VUILabel"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "axContainsString:", CFSTR("SideBarClockView"));

  }
  return v3;
}

uint64_t __57__RootSideBarProfileViewAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityLabel");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF73C0];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("profile.switcher.button.hint"));
}

@end
