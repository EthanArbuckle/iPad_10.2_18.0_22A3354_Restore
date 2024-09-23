@implementation HUDashboardFilterCategoryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUDashboardFilterCategoryCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUDashboardFilterCategoryCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("HomeUI.DashboardFilterCategoryCell[class].ContentView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HomeUI.DashboardFilterCategoryCell[class].ContentView"), CFSTR("config"), "ContentConfiguration");
  objc_msgSend(v3, "validateSwiftStruct:", CFSTR("HomeUI.DashboardFilterCategoryCell[class].ContentConfiguration"));
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("HomeUI.DashboardFilterCategoryCell[class].ContentConfiguration"), CFSTR("text"), "Optional<String>");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("HomeUI.DashboardFilterCategoryCell[class].ContentConfiguration"), CFSTR("secondaryText"), "Optional<String>");

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSwiftStruct();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeSwiftStringForKey:", CFSTR("text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityHomeUILocalizedString(CFSTR("filter.cell.show.prefix"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  objc_msgSend(v5, "safeSwiftStringForKey:", CFSTR("secondaryText"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)accessibilityHint
{
  return accessibilityHomeUILocalizedString(CFSTR("filter.cell.hint"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUDashboardFilterCategoryCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HUDashboardFilterCategoryCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  return 1;
}

@end
