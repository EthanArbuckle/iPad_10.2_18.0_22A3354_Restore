@implementation CNAutocompleteResultsTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNAutocompleteResultsTableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNAutocompleteResultsTableView"), CFSTR("UITableView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableView"), CFSTR("selectRowAtIndexPath:animated:scrollPosition:"), "v", "@", "B", "q", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("table.results.label"));
}

@end
