@implementation _BMIntelligencePlatformLibraryNode

+ (id)identifier
{
  return CFSTR("IntelligencePlatform");
}

+ (id)FeatureStore
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
  objc_msgSend(a1, "configurationForFeatureStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMIntelligencePlatformFeatureStore columns](BMIntelligencePlatformFeatureStore, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("IntelligencePlatform.FeatureStore"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("IntelligencePlatform.FeatureStore"), v9, v2);

  return v10;
}

+ (id)MessageTerms
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
  objc_msgSend(a1, "configurationForMessageTerms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMIntelligencePlatformMessageTerms columns](BMIntelligencePlatformMessageTerms, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("IntelligencePlatform.MessageTerms"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("IntelligencePlatform.MessageTerms"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForFeatureStore
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("IntelligencePlatform.FeatureStore"), 0, 0x40000, 3, v2);

  return v3;
}

+ (id)syncPolicyForFeatureStore
{
  return 0;
}

+ (id)configurationForFeatureStore
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForFeatureStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForFeatureStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("IntelligencePlatform.FeatureStore"), objc_opt_class(), v3, v4, &unk_1E5F1CF30, 0);

  return v5;
}

+ (id)storeConfigurationForMessageTerms
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("IntelligencePlatform.MessageTerms"), 0, 0x100000, 3, v2);

  return v3;
}

+ (id)syncPolicyForMessageTerms
{
  return 0;
}

+ (id)configurationForMessageTerms
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForMessageTerms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForMessageTerms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("IntelligencePlatform.MessageTerms"), objc_opt_class(), v3, v4, &unk_1E5F1CF48, 0);

  return v5;
}

+ (id)ECR
{
  return (id)objc_opt_class();
}

+ (id)EntityTagging
{
  return (id)objc_opt_class();
}

+ (id)Views
{
  return (id)objc_opt_class();
}

+ (id)streamNames
{
  return &unk_1E5F1CF60;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMIntelligencePlatformFeatureStore validKeyPaths](BMIntelligencePlatformFeatureStore, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  +[BMIntelligencePlatformMessageTerms validKeyPaths](BMIntelligencePlatformMessageTerms, "validKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  v5 = (void *)objc_msgSend(v2, "copy");
  return v5;
}

+ (id)streamWithName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("FeatureStore")))
  {
    objc_msgSend(a1, "FeatureStore");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("MessageTerms")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "MessageTerms");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

+ (id)sublibraries
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ECR");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "EntityTagging", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(a1, "Views");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
