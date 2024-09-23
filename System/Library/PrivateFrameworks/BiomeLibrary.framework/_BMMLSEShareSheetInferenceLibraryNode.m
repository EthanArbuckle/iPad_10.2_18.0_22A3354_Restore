@implementation _BMMLSEShareSheetInferenceLibraryNode

+ (id)AppSuggestions
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
  objc_msgSend(a1, "configurationForAppSuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMMLSEShareSheetInferenceAppSuggestions columns](BMMLSEShareSheetInferenceAppSuggestions, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("MLSE.ShareSheet.Inference.AppSuggestions"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("MLSE.ShareSheet.Inference.AppSuggestions"), v9, v2);

  return v10;
}

+ (id)PeopleSuggestions
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
  objc_msgSend(a1, "configurationForPeopleSuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMMLSEShareSheetInferencePeopleSuggestions columns](BMMLSEShareSheetInferencePeopleSuggestions, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("MLSE.ShareSheet.Inference.PeopleSuggestions"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("MLSE.ShareSheet.Inference.PeopleSuggestions"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForAppSuggestions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("MLSE.ShareSheet.Inference.AppSuggestions"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForAppSuggestions
{
  return 0;
}

+ (id)configurationForAppSuggestions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForAppSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForAppSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("MLSE.ShareSheet.Inference.AppSuggestions"), objc_opt_class(), v3, v4, &unk_1E5F1AD58, 0);

  return v5;
}

+ (id)storeConfigurationForPeopleSuggestions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("MLSE.ShareSheet.Inference.PeopleSuggestions"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForPeopleSuggestions
{
  return 0;
}

+ (id)configurationForPeopleSuggestions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForPeopleSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForPeopleSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("MLSE.ShareSheet.Inference.PeopleSuggestions"), objc_opt_class(), v3, v4, &unk_1E5F1AD70, 0);

  return v5;
}

+ (id)identifier
{
  return CFSTR("Inference");
}

+ (id)streamNames
{
  return &unk_1E5F1AD88;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMMLSEShareSheetInferenceAppSuggestions validKeyPaths](BMMLSEShareSheetInferenceAppSuggestions, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  +[BMMLSEShareSheetInferencePeopleSuggestions validKeyPaths](BMMLSEShareSheetInferencePeopleSuggestions, "validKeyPaths");
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
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("AppSuggestions")))
  {
    objc_msgSend(a1, "AppSuggestions");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PeopleSuggestions")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "PeopleSuggestions");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
