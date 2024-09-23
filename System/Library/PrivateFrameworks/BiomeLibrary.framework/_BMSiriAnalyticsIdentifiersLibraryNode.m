@implementation _BMSiriAnalyticsIdentifiersLibraryNode

+ (id)HomeSeed
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
  objc_msgSend(a1, "configurationForHomeSeed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMSiriHomeSeed columns](BMSiriHomeSeed, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Siri.AnalyticsIdentifiers.HomeSeed"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Siri.AnalyticsIdentifiers.HomeSeed"), v9, v2);

  return v10;
}

+ (id)UserAggregationId
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
  objc_msgSend(a1, "configurationForUserAggregationId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMSiriUserAggregationId columns](BMSiriUserAggregationId, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Siri.AnalyticsIdentifiers.UserAggregationId"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Siri.AnalyticsIdentifiers.UserAggregationId"), v9, v2);

  return v10;
}

+ (id)UserSamplingId
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
  objc_msgSend(a1, "configurationForUserSamplingId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMSiriUserSamplingId columns](BMSiriUserSamplingId, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Siri.AnalyticsIdentifiers.UserSamplingId"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Siri.AnalyticsIdentifiers.UserSamplingId"), v9, v2);

  return v10;
}

+ (id)UserSeed
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
  objc_msgSend(a1, "configurationForUserSeed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMSiriUserSeed columns](BMSiriUserSeed, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Siri.AnalyticsIdentifiers.UserSeed"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Siri.AnalyticsIdentifiers.UserSeed"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForHomeSeed
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2505600.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Siri.AnalyticsIdentifiers.HomeSeed"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForHomeSeed
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[8];
  _QWORD v30[8];
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 3);
  v35[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v34 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v33 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 3);
  v32 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v31 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMDevicePlatformAsKeyString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  v7 = v2;
  v24 = (void *)v2;
  v30[0] = v2;
  BMDevicePlatformAsKeyString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v8;
  v30[1] = v7;
  BMDevicePlatformAsKeyString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  v22 = (void *)v3;
  v30[2] = v3;
  BMDevicePlatformAsKeyString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v10;
  v30[3] = v3;
  BMDevicePlatformAsKeyString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v11;
  v30[4] = v21;
  BMDevicePlatformAsKeyString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v12;
  v13 = v4;
  v20 = (void *)v4;
  v30[5] = v4;
  BMDevicePlatformAsKeyString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v14;
  v30[6] = v13;
  BMDevicePlatformAsKeyString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v15;
  v30[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("35B696BC-2762-41E3-9498-C6CEE401ADB9"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027B0]), "initWithPolicyDictionary:syncUUID:legacySyncID:eventClass:", v16, v17, 0, objc_opt_class());

  return v18;
}

+ (id)configurationForHomeSeed
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForHomeSeed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForHomeSeed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Siri.AnalyticsIdentifiers.HomeSeed"), objc_opt_class(), v3, v4, &unk_1E5F1FC30, 0);

  return v5;
}

+ (id)storeConfigurationForUserAggregationId
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 48643200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Siri.AnalyticsIdentifiers.UserAggregationId"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForUserAggregationId
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[8];
  _QWORD v30[8];
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 3);
  v35[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 3);
  v34 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v33 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v32 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 3);
  v31 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMDevicePlatformAsKeyString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  v7 = v2;
  v24 = (void *)v2;
  v30[0] = v2;
  BMDevicePlatformAsKeyString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v8;
  v30[1] = v7;
  BMDevicePlatformAsKeyString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  v22 = (void *)v3;
  v30[2] = v3;
  BMDevicePlatformAsKeyString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v10;
  v30[3] = v3;
  BMDevicePlatformAsKeyString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v11;
  v30[4] = v21;
  BMDevicePlatformAsKeyString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v12;
  v13 = v4;
  v20 = (void *)v4;
  v30[5] = v4;
  BMDevicePlatformAsKeyString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v14;
  v30[6] = v13;
  BMDevicePlatformAsKeyString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v15;
  v30[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9B3BB3E8-DB19-4624-AA4A-50097329A86C"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027B0]), "initWithPolicyDictionary:syncUUID:legacySyncID:eventClass:", v16, v17, 0, objc_opt_class());

  return v18;
}

+ (id)configurationForUserAggregationId
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForUserAggregationId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForUserAggregationId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Siri.AnalyticsIdentifiers.UserAggregationId"), objc_opt_class(), v3, v4, &unk_1E5F1FC48, 0);

  return v5;
}

+ (id)storeConfigurationForUserSamplingId
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 17366400.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Siri.AnalyticsIdentifiers.UserSamplingId"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForUserSamplingId
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[8];
  _QWORD v30[8];
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 3);
  v35[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 3);
  v34 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v33 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v32 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 3);
  v31 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMDevicePlatformAsKeyString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  v7 = v2;
  v24 = (void *)v2;
  v30[0] = v2;
  BMDevicePlatformAsKeyString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v8;
  v30[1] = v7;
  BMDevicePlatformAsKeyString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  v22 = (void *)v3;
  v30[2] = v3;
  BMDevicePlatformAsKeyString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v10;
  v30[3] = v3;
  BMDevicePlatformAsKeyString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v11;
  v30[4] = v21;
  BMDevicePlatformAsKeyString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v12;
  v13 = v4;
  v20 = (void *)v4;
  v30[5] = v4;
  BMDevicePlatformAsKeyString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v14;
  v30[6] = v13;
  BMDevicePlatformAsKeyString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v15;
  v30[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("23F3900D-BC06-406F-A65B-536BF3205823"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027B0]), "initWithPolicyDictionary:syncUUID:legacySyncID:eventClass:", v16, v17, 0, objc_opt_class());

  return v18;
}

+ (id)configurationForUserSamplingId
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForUserSamplingId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForUserSamplingId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Siri.AnalyticsIdentifiers.UserSamplingId"), objc_opt_class(), v3, v4, &unk_1E5F1FC60, 0);

  return v5;
}

+ (id)storeConfigurationForUserSeed
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2505600.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Siri.AnalyticsIdentifiers.UserSeed"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForUserSeed
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[8];
  _QWORD v30[8];
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 3);
  v35[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 3);
  v34 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v33 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 1);
  v32 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A8]), "initWithTransportType:direction:", 2, 3);
  v31 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMDevicePlatformAsKeyString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  v7 = v2;
  v24 = (void *)v2;
  v30[0] = v2;
  BMDevicePlatformAsKeyString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v8;
  v30[1] = v7;
  BMDevicePlatformAsKeyString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  v22 = (void *)v3;
  v30[2] = v3;
  BMDevicePlatformAsKeyString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v10;
  v30[3] = v3;
  BMDevicePlatformAsKeyString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v11;
  v30[4] = v21;
  BMDevicePlatformAsKeyString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v12;
  v13 = v4;
  v20 = (void *)v4;
  v30[5] = v4;
  BMDevicePlatformAsKeyString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v14;
  v30[6] = v13;
  BMDevicePlatformAsKeyString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v15;
  v30[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C77E2ABD-DFCE-4DC4-9A62-D747818A3D9E"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027B0]), "initWithPolicyDictionary:syncUUID:legacySyncID:eventClass:", v16, v17, 0, objc_opt_class());

  return v18;
}

+ (id)configurationForUserSeed
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForUserSeed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForUserSeed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Siri.AnalyticsIdentifiers.UserSeed"), objc_opt_class(), v3, v4, &unk_1E5F1FC78, 0);

  return v5;
}

+ (id)identifier
{
  return CFSTR("AnalyticsIdentifiers");
}

+ (id)streamNames
{
  return &unk_1E5F1FC90;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMSiriHomeSeed validKeyPaths](BMSiriHomeSeed, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  +[BMSiriUserAggregationId validKeyPaths](BMSiriUserAggregationId, "validKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  +[BMSiriUserSamplingId validKeyPaths](BMSiriUserSamplingId, "validKeyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  +[BMSiriUserSeed validKeyPaths](BMSiriUserSeed, "validKeyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v2, "copy");
  return v7;
}

+ (id)streamWithName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSeed")))
  {
    objc_msgSend(a1, "HomeSeed");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("UserAggregationId")))
  {
    objc_msgSend(a1, "UserAggregationId");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("UserSamplingId")))
  {
    objc_msgSend(a1, "UserSamplingId");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("UserSeed")))
    {
      v6 = 0;
      goto LABEL_10;
    }
    objc_msgSend(a1, "UserSeed");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_10:

  return v6;
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
