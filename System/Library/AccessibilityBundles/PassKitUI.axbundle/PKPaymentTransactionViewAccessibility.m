@implementation PKPaymentTransactionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentTransactionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentTransactionView"), CFSTR("_primaryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentTransactionView"), CFSTR("_secondaryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentTransactionView"), CFSTR("_tertiaryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentTransactionView"), CFSTR("_transactionValueLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentTransactionView"), CFSTR("transactionValueAttributedText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentTransactionView"), CFSTR("_bonusImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentTransactionView"), CFSTR("_badgeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentTransactionView"), CFSTR("transactionValueAttributedText"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v25;

  -[PKPaymentTransactionViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_primaryLabel, _secondaryLabel, _tertiaryLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("station.to"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("→"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[PKPaymentTransactionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("transactionValueAttributedText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithStringOrAttributedString:", v7);
  objc_msgSend(v8, "coalescedAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDF6658]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v7, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    accessibilityLocalizedString(CFSTR("cancelled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  -[PKPaymentTransactionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_badgeLabel"), v12, v13, CFSTR("__AXStringForVariablesSentinel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessibilityLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "length"))
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("cash.back.format"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v18, v16);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v19;
  }
  __UIAXStringForVariables();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentTransactionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_bonusImageView"), v16, CFSTR("__AXStringForVariablesSentinel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "_accessibilityViewIsVisible");

  if (v22)
  {
    accessibilityLocalizedString(CFSTR("transaction.bonus"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v23 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v23;
  }

  return v20;
}

@end
