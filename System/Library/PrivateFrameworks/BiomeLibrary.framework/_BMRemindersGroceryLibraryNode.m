@implementation _BMRemindersGroceryLibraryNode

+ (id)MiscategorizedGroceryItem
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
  objc_msgSend(a1, "configurationForMiscategorizedGroceryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMRemindersMiscategorizedGroceryItem columns](BMRemindersMiscategorizedGroceryItem, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Reminders.Grocery.MiscategorizedGroceryItem"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Reminders.Grocery.MiscategorizedGroceryItem"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForMiscategorizedGroceryItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Reminders.Grocery.MiscategorizedGroceryItem"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForMiscategorizedGroceryItem
{
  return 0;
}

+ (id)spaceAttributionForMiscategorizedGroceryItem
{
  return CFSTR("com.apple.reminders");
}

+ (id)configurationForMiscategorizedGroceryItem
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForMiscategorizedGroceryItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForMiscategorizedGroceryItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Reminders.Grocery.MiscategorizedGroceryItem"), objc_opt_class(), v3, v4, &unk_1E5F1E340, 0);

  return v5;
}

+ (id)identifier
{
  return CFSTR("Grocery");
}

+ (id)streamNames
{
  return &unk_1E5F1E358;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMRemindersMiscategorizedGroceryItem validKeyPaths](BMRemindersMiscategorizedGroceryItem, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

+ (id)streamWithName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MiscategorizedGroceryItem")))
  {
    objc_msgSend(a1, "MiscategorizedGroceryItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
