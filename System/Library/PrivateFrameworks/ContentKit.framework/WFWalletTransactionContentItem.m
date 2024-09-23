@implementation WFWalletTransactionContentItem

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Card or Pass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("transaction.paymentMethod"), v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Merchant"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("transaction.merchant.displayName"), v4, objc_opt_class(), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  WFLocalizedContentPropertyNameMarker(CFSTR("Amount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("transaction.currencyAmount"), v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)coercions
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v2 = objc_opt_class();
  +[WFCoercionHandler keyPath:](WFCoercionHandler, "keyPath:", CFSTR("transaction.transactionDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[WFCoercionHandler keyPath:](WFCoercionHandler, "keyPath:", CFSTR("transaction.currencyAmount"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v8 = objc_opt_class();
  +[WFCoercionHandler keyPath:](WFCoercionHandler, "keyPath:", CFSTR("transaction.paymentMethod"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Transaction"), CFSTR("Transaction"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Transactions"), CFSTR("Transactions"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Transactions"));
}

- (WFWalletTransaction)transaction
{
  return (WFWalletTransaction *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x24BDD9BD0]);
  v5 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:", *MEMORY[0x24BEC17B0]);
  -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentAttributionSet attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:](WFContentAttributionSet, "attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:", v5, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
