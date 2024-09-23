@implementation _BMSiriAudioLibraryNode

+ (id)CompanionContext
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
  objc_msgSend(a1, "configurationForCompanionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMSiriCompanionContext columns](BMSiriCompanionContext, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Siri.Audio.CompanionContext"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Siri.Audio.CompanionContext"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForCompanionContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Siri.Audio.CompanionContext"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForCompanionContext
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
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 2);
  v16[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v15 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMDevicePlatformAsKeyString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v14[0] = v3;
  BMDevicePlatformAsKeyString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v14[1] = v5;
  BMDevicePlatformAsKeyString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("35D8B8AF-E1A6-4DB0-ABDC-ECAF5CFF4503"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027B0]), "initWithPolicyDictionary:syncUUID:legacySyncID:eventClass:", v9, v10, 0, objc_opt_class());

  return v11;
}

+ (id)configurationForCompanionContext
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForCompanionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForCompanionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Siri.Audio.CompanionContext"), objc_opt_class(), v3, v4, &unk_1E5F1D0B0, 0);

  return v5;
}

+ (id)identifier
{
  return CFSTR("Audio");
}

+ (id)streamNames
{
  return &unk_1E5F1D0C8;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMSiriCompanionContext validKeyPaths](BMSiriCompanionContext, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

+ (id)streamWithName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CompanionContext")))
  {
    objc_msgSend(a1, "CompanionContext");
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
