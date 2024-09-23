@implementation _BMFindMyLibraryNode

+ (id)identifier
{
  return CFSTR("FindMy");
}

+ (id)ContactActivity
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
  objc_msgSend(a1, "configurationForContactActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMFindMyContactActivity columns](BMFindMyContactActivity, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("FindMy.ContactActivity"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("FindMy.ContactActivity"), v9, v2);

  return v10;
}

+ (id)LocationChange
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
  objc_msgSend(a1, "configurationForLocationChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMFindMyLocationChange columns](BMFindMyLocationChange, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("FindMy.LocationChange"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("FindMy.LocationChange"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForContactActivity
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 86400.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("FindMy.ContactActivity"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForContactActivity
{
  return 0;
}

+ (id)spaceAttributionForContactActivity
{
  return CFSTR("com.apple.findmy");
}

+ (id)configurationForContactActivity
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForContactActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForContactActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("FindMy.ContactActivity"), objc_opt_class(), v3, v4, &unk_1E5F1FDB0, 0);

  return v5;
}

+ (id)storeConfigurationForLocationChange
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("FindMy.LocationChange"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForLocationChange
{
  return 0;
}

+ (id)spaceAttributionForLocationChange
{
  return CFSTR("com.apple.findmy");
}

+ (id)configurationForLocationChange
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForLocationChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForLocationChange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("FindMy.LocationChange"), objc_opt_class(), v3, v4, &unk_1E5F1FDC8, 0);

  return v5;
}

+ (id)streamNames
{
  return &unk_1E5F1FDE0;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMFindMyContactActivity validKeyPaths](BMFindMyContactActivity, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  +[BMFindMyLocationChange validKeyPaths](BMFindMyLocationChange, "validKeyPaths");
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
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ContactActivity")))
  {
    objc_msgSend(a1, "ContactActivity");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("LocationChange")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "LocationChange");
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
