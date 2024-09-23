@implementation PKTransactionHistoryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKTransactionHistoryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKTransactionHistoryViewController"), CFSTR("_detailsButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKTransactionHistoryViewController"), CFSTR("_phoneButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKTransactionHistoryViewController"), CFSTR("_messageButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKTransactionHistoryViewController"), CFSTR("_barButtonItems"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKTransactionHistoryViewControllerAccessibility;
  -[PKTransactionHistoryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[PKTransactionHistoryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_detailsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("details.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[PKTransactionHistoryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_phoneButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("phone.contact.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[PKTransactionHistoryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_messageButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("message.contact.button"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

}

- (id)_barButtonItems
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryViewControllerAccessibility;
  -[PKTransactionHistoryViewControllerAccessibility _barButtonItems](&v5, sel__barButtonItems);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionHistoryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
