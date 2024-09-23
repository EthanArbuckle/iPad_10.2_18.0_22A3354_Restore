@implementation CKRecipientSelectionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKRecipientSelectionController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKComposeRecipientView"), CFSTR("CNComposeRecipientTextView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTextView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNAutocompleteResultsTableViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKRecipientSearchListController"), CFSTR("CNAutocompleteResultsTableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipient"), CFSTR("displayString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKRecipientSelectionController"), CFSTR("searchListController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewController"), CFSTR("tableView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKRecipientSelectionController"), CFSTR("addRecipient:"), "v", "@", 0);

}

- (void)_updateLabelOnToField
{
  void *v2;
  void *v3;
  id v4;

  -[CKRecipientSelectionControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toField"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("textView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("to.field"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKRecipientSelectionControllerAccessibility;
  -[CKRecipientSelectionControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CKRecipientSelectionControllerAccessibility _updateLabelOnToField](self, "_updateLabelOnToField");
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CKRecipientSelectionControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("toField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[CKRecipientSelectionControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("searchListController.tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKRecipientSelectionControllerAccessibility;
  -[CKRecipientSelectionControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CKRecipientSelectionControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)addRecipient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKRecipientSelectionControllerAccessibility;
  v3 = a3;
  -[CKRecipientSelectionControllerAccessibility addRecipient:](&v8, sel_addRecipient_, v3);
  objc_msgSend(v3, "safeStringForKey:", CFSTR("displayString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("recipient.added.announcement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v7);
}

@end
