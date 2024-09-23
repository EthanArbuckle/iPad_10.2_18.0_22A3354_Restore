@implementation SUUIProductPageTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIProductPageTableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("SUUIScreenshotsView"));
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIProductPageTableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __79__SUUIProductPageTableViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSClassFromString(CFSTR("SUUIScreenshotsView"));
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_msgSend(v2, "_accessibilityViewIsVisible") & 1) != 0)
      v3 = 1;
  }

  return v3;
}

@end
