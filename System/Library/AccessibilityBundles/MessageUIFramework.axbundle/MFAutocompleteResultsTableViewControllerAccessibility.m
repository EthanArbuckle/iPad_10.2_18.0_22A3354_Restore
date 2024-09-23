@implementation MFAutocompleteResultsTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFAutocompleteResultsTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFAutocompleteResultsTableViewController"), CFSTR("_selectSearchResultsRecipientAtIndexPath:"), "v", "@", 0);
}

- (void)_selectSearchResultsRecipientAtIndexPath:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFAutocompleteResultsTableViewControllerAccessibility;
  -[MFAutocompleteResultsTableViewControllerAccessibility _selectSearchResultsRecipientAtIndexPath:](&v3, sel__selectSearchResultsRecipientAtIndexPath_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
