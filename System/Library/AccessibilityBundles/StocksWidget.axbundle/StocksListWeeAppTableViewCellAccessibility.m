@implementation StocksListWeeAppTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StocksListWeeAppTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityStocksRowDataType
{
  return __UIAccessibilityGetAssociatedInteger();
}

- (void)setAccessibilityStocksRowDataType:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInteger();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("StocksListWeeAppTableViewCell"), CFSTR("stock"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("StocksListWeeAppTableViewCell"), CFSTR("_priceLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("StocksListWeeAppTableViewCell"), CFSTR("boxButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("companyName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("StocksListWeeAppTableViewCell"), CFSTR("_boxLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("marketcap"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("Stock"), CFSTR("BlankValueString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("changeIsNegative"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("changeIsZero"), "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("Stock"), CFSTR("formattedStringForString: fractionDigits: percentStyle:"), "@", "@", "I", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("formattedChangePercent:"), "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("change"), "@", 0);

}

- (id)_accessibilityBoxButtonLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  -[StocksListWeeAppTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stock"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("marketcap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)MEMORY[0x234920D64](CFSTR("Stock")), "safeValueForKey:", CFSTR("BlankValueString"));
  v4 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "floatValue");
    AXFormatFloat();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDD16F0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "integerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringFromNumber:numberStyle:", v8, 5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("marketcap.value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  v11 = v2;
  AXPerformSafeBlock();
  v12 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  v27 = (void *)v4;
  if (objc_msgSend(v11, "safeBoolForKey:", CFSTR("changeIsZero")))
  {
    accessibilityLocalizedString(CFSTR("no.change"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_msgSend(v11, "safeBoolForKey:", CFSTR("changeIsNegative"));
    v15 = (void *)MEMORY[0x24BDD17C8];
    if (v14)
      v16 = CFSTR("negative.change");
    else
      v16 = CFSTR("positive.change");
    accessibilityLocalizedString(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  v18 = v11;
  AXPerformSafeBlock();
  v19 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  if (objc_msgSend(v18, "safeBoolForKey:", CFSTR("changeIsZero")))
  {
    accessibilityLocalizedString(CFSTR("no.change"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = objc_msgSend(v18, "safeBoolForKey:", CFSTR("changeIsNegative"));
    v22 = (void *)MEMORY[0x24BDD17C8];
    if (v21)
      v23 = CFSTR("down.value");
    else
      v23 = CFSTR("up.value");
    accessibilityLocalizedString(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v24, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  __UIAXStringForVariables();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

void __74__StocksListWeeAppTableViewCellAccessibility__accessibilityBoxButtonLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "formattedChangePercent:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __74__StocksListWeeAppTableViewCellAccessibility__accessibilityBoxButtonLabel__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x234920D64](CFSTR("Stock"));
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("change"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedStringForString:fractionDigits:percentStyle:", v6, 2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

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
  void *v11;

  -[StocksListWeeAppTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[StocksListWeeAppTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_priceLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[StocksListWeeAppTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("boxButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("companyName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StocksListWeeAppTableViewCellAccessibility;
  -[StocksListWeeAppTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[StocksListWeeAppTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("boxButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  -[StocksListWeeAppTableViewCellAccessibility _accessibilityBoxButtonLabel](self, "_accessibilityBoxButtonLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)updateValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StocksListWeeAppTableViewCellAccessibility;
  -[StocksListWeeAppTableViewCellAccessibility updateValues](&v3, sel_updateValues);
  -[StocksListWeeAppTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (StocksListWeeAppTableViewCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  StocksListWeeAppTableViewCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)StocksListWeeAppTableViewCellAccessibility;
  v4 = -[StocksListWeeAppTableViewCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[StocksListWeeAppTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

@end
