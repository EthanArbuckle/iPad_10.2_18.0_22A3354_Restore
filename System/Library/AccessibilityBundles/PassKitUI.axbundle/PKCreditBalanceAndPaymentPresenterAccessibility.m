@implementation PKCreditBalanceAndPaymentPresenterAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKCreditBalanceAndPaymentPresenter");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardCreditAccountItem"), CFSTR("account"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardCreditAccountItem"), CFSTR("mostRecentTransactions"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardCreditAccountItem"), CFSTR("pendingPayments"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardCreditAccountItem"), CFSTR("upcomingScheduledPayments"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKCreditBalanceAndPaymentPresenter"), CFSTR("_configurePaymentDueCell:forItem:inCollectionView:forIndexPath:"), "v", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("PKCreditAccountController"), CFSTR("paymentEducationStateForAccount:mostRecentTransactions:pendingPayments:upcomingScheduledPayments:"), "Q", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKCreditPaymentDueCell"), CFSTR("payButtonImage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKCreditPaymentDueCell"), CFSTR("payButton"), "@", 0);

}

- (void)_configurePaymentDueCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PKCreditBalanceAndPaymentPresenterAccessibility;
  -[PKCreditBalanceAndPaymentPresenterAccessibility _configurePaymentDueCell:forItem:inCollectionView:forIndexPath:](&v25, sel__configurePaymentDueCell_forItem_inCollectionView_forIndexPath_, v10, v11, v12, v13);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v20 = MEMORY[0x24BDAC760];
  v14 = v11;
  AXPerformSafeBlock();
  v15 = v22[3];

  _Block_object_dispose(&v21, 8);
  objc_msgSend(v10, "safeValueForKey:", CFSTR("payButtonImage"), v20, 3221225472, __114__PKCreditBalanceAndPaymentPresenterAccessibility__configurePaymentDueCell_forItem_inCollectionView_forIndexPath___block_invoke, &unk_2502E3A98);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    switch(v15)
    {
      case 0:
        v17 = CFSTR("more.info.button");
        goto LABEL_5;
      case 2:
      case 7:
      case 9:
        v17 = CFSTR("completed.button");
LABEL_5:
        accessibilityLocalizedString(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safeUIViewForKey:", CFSTR("payButton"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAccessibilityLabel:", v18);

        break;
      default:
        break;
    }
  }

}

void __114__PKCreditBalanceAndPaymentPresenterAccessibility__configurePaymentDueCell_forItem_inCollectionView_forIndexPath___block_invoke(uint64_t a1)
{
  Class v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = NSClassFromString(CFSTR("PKCreditAccountController"));
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("account"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("mostRecentTransactions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("pendingPayments"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("upcomingScheduledPayments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[objc_class paymentEducationStateForAccount:mostRecentTransactions:pendingPayments:upcomingScheduledPayments:](v2, "paymentEducationStateForAccount:mostRecentTransactions:pendingPayments:upcomingScheduledPayments:", v6, v3, v4, v5);

}

@end
