@implementation WFAutomationEmptyStateCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFAutomationEmptyStateCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityChildren
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFAutomationEmptyStateCellAccessibility;
  -[WFAutomationEmptyStateCellAccessibility _accessibilityChildren](&v9, sel__accessibilityChildren);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_1);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);
  -[WFAutomationEmptyStateCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  return v3;
}

uint64_t __65__WFAutomationEmptyStateCellAccessibility__accessibilityChildren__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  NSClassFromString(CFSTR("UITableTextAccessibilityElement"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *a4 = 1;
  return isKindOfClass & 1;
}

@end
