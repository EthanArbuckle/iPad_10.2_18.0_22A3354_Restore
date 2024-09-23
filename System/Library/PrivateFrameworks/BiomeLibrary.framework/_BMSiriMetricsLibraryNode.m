@implementation _BMSiriMetricsLibraryNode

+ (id)OnDeviceDigestExperimentMetrics
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
  objc_msgSend(a1, "configurationForOnDeviceDigestExperimentMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMSiriOnDeviceDigestExperimentMetrics columns](BMSiriOnDeviceDigestExperimentMetrics, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Siri.Metrics.OnDeviceDigestExperimentMetrics"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Siri.Metrics.OnDeviceDigestExperimentMetrics"), v9, v2);

  return v10;
}

+ (id)OnDeviceDigestSegmentsCohorts
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
  objc_msgSend(a1, "configurationForOnDeviceDigestSegmentsCohorts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMSiriOnDeviceDigestSegmentsCohorts columns](BMSiriOnDeviceDigestSegmentsCohorts, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Siri.Metrics.OnDeviceDigestSegmentsCohorts"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Siri.Metrics.OnDeviceDigestSegmentsCohorts"), v9, v2);

  return v10;
}

+ (id)OnDeviceDigestUsageMetrics
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
  objc_msgSend(a1, "configurationForOnDeviceDigestUsageMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMSiriOnDeviceDigestUsageMetrics columns](BMSiriOnDeviceDigestUsageMetrics, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Siri.Metrics.OnDeviceDigestUsageMetrics"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Siri.Metrics.OnDeviceDigestUsageMetrics"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForOnDeviceDigestExperimentMetrics
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Siri.Metrics.OnDeviceDigestExperimentMetrics"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForOnDeviceDigestExperimentMetrics
{
  return 0;
}

+ (id)configurationForOnDeviceDigestExperimentMetrics
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForOnDeviceDigestExperimentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForOnDeviceDigestExperimentMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Siri.Metrics.OnDeviceDigestExperimentMetrics"), objc_opt_class(), v3, v4, &unk_1E5F1C858, 0);

  return v5;
}

+ (id)storeConfigurationForOnDeviceDigestSegmentsCohorts
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Siri.Metrics.OnDeviceDigestSegmentsCohorts"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForOnDeviceDigestSegmentsCohorts
{
  return 0;
}

+ (id)configurationForOnDeviceDigestSegmentsCohorts
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForOnDeviceDigestSegmentsCohorts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForOnDeviceDigestSegmentsCohorts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Siri.Metrics.OnDeviceDigestSegmentsCohorts"), objc_opt_class(), v3, v4, &unk_1E5F1C870, 0);

  return v5;
}

+ (id)storeConfigurationForOnDeviceDigestUsageMetrics
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Siri.Metrics.OnDeviceDigestUsageMetrics"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForOnDeviceDigestUsageMetrics
{
  return 0;
}

+ (id)configurationForOnDeviceDigestUsageMetrics
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForOnDeviceDigestUsageMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForOnDeviceDigestUsageMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Siri.Metrics.OnDeviceDigestUsageMetrics"), objc_opt_class(), v3, v4, &unk_1E5F1C888, 0);

  return v5;
}

+ (id)identifier
{
  return CFSTR("Metrics");
}

+ (id)streamNames
{
  return &unk_1E5F1C8A0;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMSiriOnDeviceDigestExperimentMetrics validKeyPaths](BMSiriOnDeviceDigestExperimentMetrics, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  +[BMSiriOnDeviceDigestSegmentsCohorts validKeyPaths](BMSiriOnDeviceDigestSegmentsCohorts, "validKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  +[BMSiriOnDeviceDigestUsageMetrics validKeyPaths](BMSiriOnDeviceDigestUsageMetrics, "validKeyPaths");
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
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("OnDeviceDigestExperimentMetrics")))
  {
    objc_msgSend(a1, "OnDeviceDigestExperimentMetrics");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("OnDeviceDigestSegmentsCohorts")))
  {
    objc_msgSend(a1, "OnDeviceDigestSegmentsCohorts");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("OnDeviceDigestUsageMetrics")))
    {
      v6 = 0;
      goto LABEL_8;
    }
    objc_msgSend(a1, "OnDeviceDigestUsageMetrics");
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
