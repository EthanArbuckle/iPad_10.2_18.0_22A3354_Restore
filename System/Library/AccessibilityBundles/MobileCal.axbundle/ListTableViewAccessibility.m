@implementation ListTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ListTableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("ListTableView"), CFSTR("UITableView"));
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("events.container"));
}

- (id)_accessibilityFirstContainedElementForTechnology:(id)a3 honoringGroups:(BOOL)a4 shouldAlwaysScroll:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visibleCells");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_accessibilityFirstContainedElementForTechnology:honoringGroups:shouldAlwaysScroll:", v7, v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_accessibilityFauxTableViewCellsDisabled
{
  return 1;
}

@end
