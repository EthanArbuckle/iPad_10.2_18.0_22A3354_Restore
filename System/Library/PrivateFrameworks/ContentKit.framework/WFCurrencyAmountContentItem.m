@implementation WFCurrencyAmountContentItem

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Currency Code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("currencyAmount.currencyCode"), v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  WFLocalizedContentPropertyNameMarker(CFSTR("Currency Amount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("currencyAmount.amount"), v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)coercions
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_opt_class();
  objc_msgSend(a1, "stringCoercionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v6 = objc_opt_class();
  objc_msgSend(a1, "numberCoercionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  v9 = objc_opt_class();
  objc_msgSend(a1, "decimalNumberCoercionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  v12 = objc_opt_class();
  objc_msgSend(a1, "quantityCoercionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Scripting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFLocalizedString(CFSTR("Currency Amount"));
}

+ (id)pluralTypeDescription
{
  return WFLocalizedString(CFSTR("Currency Amounts"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Currency Amounts"));
}

+ (id)stringCoercionHandler
{
  return +[WFCoercionHandler block:](WFCoercionHandler, "block:", &__block_literal_global_14550);
}

+ (id)numberCoercionHandler
{
  return +[WFCoercionHandler block:](WFCoercionHandler, "block:", &__block_literal_global_36_14548);
}

+ (id)decimalNumberCoercionHandler
{
  return +[WFCoercionHandler block:](WFCoercionHandler, "block:", &__block_literal_global_37_14547);
}

+ (id)quantityCoercionHandler
{
  return +[WFCoercionHandler block:](WFCoercionHandler, "block:", &__block_literal_global_38);
}

id __54__WFCurrencyAmountContentItem_quantityCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  WFQuantityValue *v3;
  void *v4;
  void *v5;
  WFQuantityValue *v6;
  void *v7;

  objc_msgSend(a2, "currencyAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [WFQuantityValue alloc];
  objc_msgSend(v2, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFQuantityValue initWithMagnitude:unitString:](v3, "initWithMagnitude:unitString:", v4, v5);

  +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __59__WFCurrencyAmountContentItem_decimalNumberCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "currencyAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __52__WFCurrencyAmountContentItem_numberCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "currencyAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __52__WFCurrencyAmountContentItem_stringCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "currencyAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v3, "setNumberStyle:", 2);
  objc_msgSend(v2, "currencyCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrencyCode:", v4);

  objc_msgSend(v2, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (INCurrencyAmount)currencyAmount
{
  return (INCurrencyAmount *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = (void (**)(id, void *))a3;
    -[WFCurrencyAmountContentItem currencyAmount](self, "currencyAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v6, "setNumberStyle:", 2);
    objc_msgSend(v5, "currencyCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCurrencyCode:", v7);

    objc_msgSend(v5, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromNumber:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);

  }
  return 1;
}

@end
