@implementation UITableViewAccessibility__MessageUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("_UIPopoverView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeView"), CFSTR("_activeRecipientView"), "MFMailComposeRecipientTextView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFAutocompleteResultsTableViewController"), CFSTR("delegate"), "@", 0);

}

- (BOOL)accessibilityViewIsModal
{
  void *v3;
  char v4;
  objc_super v6;

  -[UITableViewAccessibility__MessageUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MessageRecipientSearchTable"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UITableViewAccessibility__MessageUI__UIKit;
  return -[UITableViewAccessibility__MessageUI__UIKit accessibilityViewIsModal](&v6, sel_accessibilityViewIsModal);
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  -[UITableViewAccessibility__MessageUI__UIKit _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIPopoverView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    || (-[UITableViewAccessibility__MessageUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("MessageRecipientSearchTable")),
        v4,
        !v5))
  {
    v11.receiver = self;
    v11.super_class = (Class)UITableViewAccessibility__MessageUI__UIKit;
    -[UITableViewAccessibility__MessageUI__UIKit _accessibilityObscuredScreenAllowedViews](&v11, sel__accessibilityObscuredScreenAllowedViews);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITableViewAccessibility__MessageUI__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("_activeRecipientView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
}

@end
