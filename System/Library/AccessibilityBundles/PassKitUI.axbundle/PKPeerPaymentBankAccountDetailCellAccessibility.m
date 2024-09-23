@implementation PKPeerPaymentBankAccountDetailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPeerPaymentBankAccountDetailCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("PKPeerPaymentBankAccountDetailCell"), CFSTR("UITableViewCell"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  char v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentBankAccountDetailCellAccessibility;
  -[PKPeerPaymentBankAccountDetailCellAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  v7 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __93__PKPeerPaymentBankAccountDetailCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2502E3938;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __93__PKPeerPaymentBankAccountDetailCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
