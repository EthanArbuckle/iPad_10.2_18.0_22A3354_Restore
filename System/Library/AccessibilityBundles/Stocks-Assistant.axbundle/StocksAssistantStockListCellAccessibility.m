@implementation StocksAssistantStockListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StocksAssistantStockListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
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
  void *v11;
  void *v12;

  -[StocksAssistantStockListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_companyNameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[StocksAssistantStockListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tickerLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[StocksAssistantStockListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attributeTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[StocksAssistantStockListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attributeValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length") && objc_msgSend(v10, "length"))
  {
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)accessibilityValue
{
  void *v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  -[StocksAssistantStockListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stock"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("changeIsNegative")))
    v3 = CFSTR("stock.down");
  else
    v3 = CFSTR("stock.up");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v5 = MEMORY[0x24BDAC760];
  v22 = 0;
  v16 = v2;
  AXPerformSafeBlock();
  v6 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v15 = v16;
  AXPerformSafeBlock();
  v7 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v4, v6, v7, v5, 3221225472, __63__StocksAssistantStockListCellAccessibility_accessibilityValue__block_invoke_2, &unk_250395868);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("stock.price"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeValueForKey:", CFSTR("formattedPrice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringWithFormat:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __63__StocksAssistantStockListCellAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "formattedChangePercent:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__StocksAssistantStockListCellAccessibility_accessibilityValue__block_invoke_2(uint64_t a1)
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

@end
