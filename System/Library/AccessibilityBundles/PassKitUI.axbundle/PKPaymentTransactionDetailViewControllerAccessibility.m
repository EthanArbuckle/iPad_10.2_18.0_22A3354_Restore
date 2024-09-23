@implementation PKPaymentTransactionDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentTransactionDetailViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentTransactionDetailViewController"), CFSTR("_tableView:actionButtonCellForSection:"), "@", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentTransactionDetailViewController"), CFSTR("_transactionIdentifierCellForTableView:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentTransactionDetailViewController"), CFSTR("_handleTransactionHeaderTapRecognizer:"), "v", "@", 0);

}

- (id)_transactionIdentifierCellForTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentTransactionDetailViewControllerAccessibility;
  -[PKPaymentTransactionDetailViewControllerAccessibility _transactionIdentifierCellForTableView:](&v11, sel__transactionIdentifierCellForTableView_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);
  objc_msgSend(v5, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __96__PKPaymentTransactionDetailViewControllerAccessibility__transactionIdentifierCellForTableView___block_invoke;
  v8[3] = &unk_2502E3938;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "_setAccessibilityLabelBlock:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v5;
}

id __96__PKPaymentTransactionDetailViewControllerAccessibility__transactionIdentifierCellForTableView___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDFEA60];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "detailTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "axAttributedStringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEBB8]);
  return v5;
}

- (void)_handleTransactionHeaderTapRecognizer:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTransactionDetailViewControllerAccessibility;
  -[PKPaymentTransactionDetailViewControllerAccessibility _handleTransactionHeaderTapRecognizer:](&v3, sel__handleTransactionHeaderTapRecognizer_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_tableView:(id)a3 actionButtonCellForSection:(unint64_t)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentTransactionDetailViewControllerAccessibility;
  -[PKPaymentTransactionDetailViewControllerAccessibility _tableView:actionButtonCellForSection:](&v6, sel__tableView_actionButtonCellForSection_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  return v4;
}

@end
