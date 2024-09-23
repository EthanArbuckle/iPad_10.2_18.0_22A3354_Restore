@implementation _BMIntelligenceEngineInteractionLibraryNode

+ (id)Donation
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
  objc_msgSend(a1, "configurationForDonation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMIntelligenceEngineInteraction columns](BMIntelligenceEngineInteraction, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("IntelligenceEngine.Interaction.Donation"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("IntelligenceEngine.Interaction.Donation"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForDonation
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D024B0]);
  v3 = (void *)objc_msgSend(v2, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 5242880, *MEMORY[0x1E0D024A0], 31536000.0);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("IntelligenceEngine.Interaction.Donation"), 0, 0x100000, 3, v3);

  return v4;
}

+ (id)syncPolicyForDonation
{
  return 0;
}

+ (id)spaceAttributionForDonation
{
  return CFSTR("com.apple.intelligenceflowd");
}

+ (id)configurationForDonation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForDonation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForDonation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("IntelligenceEngine.Interaction.Donation"), objc_opt_class(), v3, v4, &unk_1E5F1E670, 0);

  return v5;
}

+ (id)identifier
{
  return CFSTR("Interaction");
}

+ (id)streamNames
{
  return &unk_1E5F1E688;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMIntelligenceEngineInteraction validKeyPaths](BMIntelligenceEngineInteraction, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

+ (id)streamWithName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Donation")))
  {
    objc_msgSend(a1, "Donation");
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
