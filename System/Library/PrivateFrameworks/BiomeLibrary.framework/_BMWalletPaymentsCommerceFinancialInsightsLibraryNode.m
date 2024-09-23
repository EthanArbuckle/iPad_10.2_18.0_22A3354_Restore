@implementation _BMWalletPaymentsCommerceFinancialInsightsLibraryNode

+ (id)PaymentRingSuggestions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "configurationForPaymentRingSuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMWalletPaymentsCommercePaymentRingSuggestions columns](BMWalletPaymentsCommercePaymentRingSuggestions, "columns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMEventTimestampSQLColumn();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  BMEventBodyDataSQLColumn();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  BMEventClassNameSQLColumn();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("WalletPaymentsCommerce.FinancialInsights.PaymentRingSuggestions"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("WalletPaymentsCommerce.FinancialInsights.PaymentRingSuggestions"), v9, v2);

  return v10;
}

+ (id)RecurringSendSuggestions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "configurationForRecurringSendSuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMWalletPaymentsCommerceRecurringSendSuggestions columns](BMWalletPaymentsCommerceRecurringSendSuggestions, "columns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMEventTimestampSQLColumn();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  BMEventBodyDataSQLColumn();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  BMEventClassNameSQLColumn();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("WalletPaymentsCommerce.FinancialInsights.RecurringSendSuggestions"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("WalletPaymentsCommerce.FinancialInsights.RecurringSendSuggestions"), v9, v2);

  return v10;
}

+ (id)Search
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "configurationForSearch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMWalletPaymentsCommerceSearch columns](BMWalletPaymentsCommerceSearch, "columns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMEventTimestampSQLColumn();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  BMEventBodyDataSQLColumn();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  BMEventClassNameSQLColumn();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("WalletPaymentsCommerce.FinancialInsights.Search"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("WalletPaymentsCommerce.FinancialInsights.Search"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForPaymentRingSuggestions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("WalletPaymentsCommerce.FinancialInsights.PaymentRingSuggestions"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForPaymentRingSuggestions
{
  return 0;
}

+ (id)spaceAttributionForPaymentRingSuggestions
{
  return CFSTR("com.apple.Passbook");
}

+ (id)configurationForPaymentRingSuggestions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForPaymentRingSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForPaymentRingSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("WalletPaymentsCommerce.FinancialInsights.PaymentRingSuggestions"), objc_opt_class(), v3, v4, &unk_1E5F1BA48, 0);

  return v5;
}

+ (id)storeConfigurationForRecurringSendSuggestions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("WalletPaymentsCommerce.FinancialInsights.RecurringSendSuggestions"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForRecurringSendSuggestions
{
  return 0;
}

+ (id)spaceAttributionForRecurringSendSuggestions
{
  return CFSTR("com.apple.Passbook");
}

+ (id)configurationForRecurringSendSuggestions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForRecurringSendSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForRecurringSendSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("WalletPaymentsCommerce.FinancialInsights.RecurringSendSuggestions"), objc_opt_class(), v3, v4, &unk_1E5F1BA60, 0);

  return v5;
}

+ (id)storeConfigurationForSearch
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("WalletPaymentsCommerce.FinancialInsights.Search"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForSearch
{
  return 0;
}

+ (id)spaceAttributionForSearch
{
  return CFSTR("com.apple.Passbook");
}

+ (id)configurationForSearch
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForSearch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("WalletPaymentsCommerce.FinancialInsights.Search"), objc_opt_class(), v3, v4, &unk_1E5F1BA78, 0);

  return v5;
}

+ (id)identifier
{
  return CFSTR("FinancialInsights");
}

+ (id)streamNames
{
  return &unk_1E5F1BA90;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMWalletPaymentsCommercePaymentRingSuggestions validKeyPaths](BMWalletPaymentsCommercePaymentRingSuggestions, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  +[BMWalletPaymentsCommerceRecurringSendSuggestions validKeyPaths](BMWalletPaymentsCommerceRecurringSendSuggestions, "validKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  +[BMWalletPaymentsCommerceSearch validKeyPaths](BMWalletPaymentsCommerceSearch, "validKeyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  v6 = (void *)objc_msgSend(v2, "copy");
  return v6;
}

+ (id)streamWithName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PaymentRingSuggestions")))
  {
    objc_msgSend(a1, "PaymentRingSuggestions");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("RecurringSendSuggestions")))
  {
    objc_msgSend(a1, "RecurringSendSuggestions");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Search")))
    {
      v6 = 0;
      goto LABEL_8;
    }
    objc_msgSend(a1, "Search");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_8:

  return v6;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
