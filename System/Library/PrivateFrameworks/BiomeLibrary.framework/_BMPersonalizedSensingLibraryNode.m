@implementation _BMPersonalizedSensingLibraryNode

+ (id)MomentsContext
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
  objc_msgSend(a1, "configurationForMomentsContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMPersonalizedSensingMomentsContext columns](BMPersonalizedSensingMomentsContext, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("PersonalizedSensing.MomentsContext"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("PersonalizedSensing.MomentsContext"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForMomentsContext
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D024B0]);
  v3 = (void *)objc_msgSend(v2, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, *MEMORY[0x1E0D024A0], 2419200.0);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("PersonalizedSensing.MomentsContext"), 0, 0x100000, 2, v3);

  return v4;
}

+ (id)syncPolicyForMomentsContext
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
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[4];
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 2);
  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v19 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v18 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMDevicePlatformAsKeyString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v17[0] = v2;
  BMDevicePlatformAsKeyString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v17[1] = v4;
  BMDevicePlatformAsKeyString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v9;
  v17[2] = v6;
  BMDevicePlatformAsKeyString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  v17[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("CCF6077C-15C7-411E-998E-7F68DFAD26DA"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027B0]), "initWithPolicyDictionary:syncUUID:legacySyncID:eventClass:", v11, v12, 0, objc_opt_class());

  return v13;
}

+ (id)configurationForMomentsContext
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForMomentsContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForMomentsContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("PersonalizedSensing.MomentsContext"), objc_opt_class(), v3, v4, &unk_1E5F1DA28, 0);

  return v5;
}

+ (id)identifier
{
  return CFSTR("PersonalizedSensing");
}

+ (id)streamNames
{
  return &unk_1E5F1DA40;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMPersonalizedSensingMomentsContext validKeyPaths](BMPersonalizedSensingMomentsContext, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

+ (id)streamWithName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MomentsContext")))
  {
    objc_msgSend(a1, "MomentsContext");
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
