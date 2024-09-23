@implementation _BMTextUnderstandingDocumentUnderstandingLibraryNode

+ (id)Poem
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
  objc_msgSend(a1, "configurationForPoem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMTextUnderstandingPoem columns](BMTextUnderstandingPoem, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("TextUnderstanding.DocumentUnderstanding.Poem"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("TextUnderstanding.DocumentUnderstanding.Poem"), v9, v2);

  return v10;
}

+ (id)PoemAnalytics
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
  objc_msgSend(a1, "configurationForPoemAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMTextUnderstandingPoemAnalytics columns](BMTextUnderstandingPoemAnalytics, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("TextUnderstanding.DocumentUnderstanding.PoemAnalytics"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("TextUnderstanding.DocumentUnderstanding.PoemAnalytics"), v9, v2);

  return v10;
}

+ (id)PoemBuffer
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
  objc_msgSend(a1, "configurationForPoemBuffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMTextUnderstandingPoemBuffer columns](BMTextUnderstandingPoemBuffer, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("TextUnderstanding.DocumentUnderstanding.PoemBuffer"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("TextUnderstanding.DocumentUnderstanding.PoemBuffer"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForPoem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("TextUnderstanding.DocumentUnderstanding.Poem"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForPoem
{
  return 0;
}

+ (id)configurationForPoem
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForPoem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForPoem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("TextUnderstanding.DocumentUnderstanding.Poem"), objc_opt_class(), v3, v4, &unk_1E5F1DA70, 0);

  return v5;
}

+ (id)storeConfigurationForPoemAnalytics
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("TextUnderstanding.DocumentUnderstanding.PoemAnalytics"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForPoemAnalytics
{
  return 0;
}

+ (id)configurationForPoemAnalytics
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForPoemAnalytics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForPoemAnalytics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("TextUnderstanding.DocumentUnderstanding.PoemAnalytics"), objc_opt_class(), v3, v4, &unk_1E5F1DA88, 0);

  return v5;
}

+ (id)storeConfigurationForPoemBuffer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("TextUnderstanding.DocumentUnderstanding.PoemBuffer"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForPoemBuffer
{
  return 0;
}

+ (id)configurationForPoemBuffer
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForPoemBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForPoemBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("TextUnderstanding.DocumentUnderstanding.PoemBuffer"), objc_opt_class(), v3, v4, &unk_1E5F1DAA0, 0);

  return v5;
}

+ (id)identifier
{
  return CFSTR("DocumentUnderstanding");
}

+ (id)streamNames
{
  return &unk_1E5F1DAB8;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMTextUnderstandingPoem validKeyPaths](BMTextUnderstandingPoem, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  +[BMTextUnderstandingPoemAnalytics validKeyPaths](BMTextUnderstandingPoemAnalytics, "validKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  +[BMTextUnderstandingPoemBuffer validKeyPaths](BMTextUnderstandingPoemBuffer, "validKeyPaths");
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
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Poem")))
  {
    objc_msgSend(a1, "Poem");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("PoemAnalytics")))
  {
    objc_msgSend(a1, "PoemAnalytics");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PoemBuffer")))
    {
      v6 = 0;
      goto LABEL_8;
    }
    objc_msgSend(a1, "PoemBuffer");
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
