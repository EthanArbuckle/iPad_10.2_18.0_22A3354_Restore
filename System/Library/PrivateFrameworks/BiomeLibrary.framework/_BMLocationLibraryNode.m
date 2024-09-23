@implementation _BMLocationLibraryNode

+ (id)identifier
{
  return CFSTR("Location");
}

+ (id)HashedCoordinates
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
  objc_msgSend(a1, "configurationForHashedCoordinates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMLocationHashedCoordinates columns](BMLocationHashedCoordinates, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Location.HashedCoordinates"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Location.HashedCoordinates"), v9, v2);

  return v10;
}

+ (id)MicroLocationVisit
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
  objc_msgSend(a1, "configurationForMicroLocationVisit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMLocationMicroLocationVisit columns](BMLocationMicroLocationVisit, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Location.MicroLocationVisit"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Location.MicroLocationVisit"), v9, v2);

  return v10;
}

+ (id)PlaceInference
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
  objc_msgSend(a1, "configurationForPlaceInference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMLocationPlaceInference columns](BMLocationPlaceInference, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Location.PlaceInference"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Location.PlaceInference"), v9, v2);

  return v10;
}

+ (id)Semantic
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
  objc_msgSend(a1, "configurationForSemantic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMLocationSemantic columns](BMLocationSemantic, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Location.Semantic"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Location.Semantic"), v9, v2);

  return v10;
}

+ (id)SignificantVisit
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
  objc_msgSend(a1, "configurationForSignificantVisit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMLocationSignificantVisit columns](BMLocationSignificantVisit, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Location.SignificantVisit"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Location.SignificantVisit"), v9, v2);

  return v10;
}

+ (id)Visit
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
  objc_msgSend(a1, "configurationForVisit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMLocationVisit columns](BMLocationVisit, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Location.Visit"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Location.Visit"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForHashedCoordinates
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Location.HashedCoordinates"), 0, 0x100000, 3, v2);

  return v3;
}

+ (id)syncPolicyForHashedCoordinates
{
  return 0;
}

+ (id)configurationForHashedCoordinates
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForHashedCoordinates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForHashedCoordinates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Location.HashedCoordinates"), objc_opt_class(), v3, v4, &unk_1E5F1E298, 0);

  return v5;
}

+ (id)storeConfigurationForMicroLocationVisit
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 4233600.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Location.MicroLocationVisit"), 0, 0x100000, 3, v2);

  return v3;
}

+ (id)syncPolicyForMicroLocationVisit
{
  return 0;
}

+ (id)configurationForMicroLocationVisit
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForMicroLocationVisit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForMicroLocationVisit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Location.MicroLocationVisit"), objc_opt_class(), v3, v4, &unk_1E5F1E2B0, 0);

  return v5;
}

+ (id)storeConfigurationForPlaceInference
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Location.PlaceInference"), 0, 0x100000, 5, v2);

  return v3;
}

+ (id)syncPolicyForPlaceInference
{
  return 0;
}

+ (id)configurationForPlaceInference
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForPlaceInference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForPlaceInference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Location.PlaceInference"), objc_opt_class(), v3, v4, &unk_1E5F1E2C8, 0);

  return v5;
}

+ (id)storeConfigurationForSemantic
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Location.Semantic"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForSemantic
{
  return 0;
}

+ (id)configurationForSemantic
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForSemantic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForSemantic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Location.Semantic"), objc_opt_class(), v3, v4, &unk_1E5F1E2E0, 0);

  return v5;
}

+ (id)storeConfigurationForSignificantVisit
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Location.SignificantVisit"), 0, 0x100000, 3, v2);

  return v3;
}

+ (id)syncPolicyForSignificantVisit
{
  return 0;
}

+ (id)configurationForSignificantVisit
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForSignificantVisit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForSignificantVisit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Location.SignificantVisit"), objc_opt_class(), v3, v4, &unk_1E5F1E2F8, 0);

  return v5;
}

+ (id)storeConfigurationForVisit
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Location.Visit"), 0, 0x100000, 2, v2);

  return v3;
}

+ (id)syncPolicyForVisit
{
  return 0;
}

+ (id)configurationForVisit
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForVisit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForVisit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Location.Visit"), objc_opt_class(), v3, v4, &unk_1E5F1E310, 0);

  return v5;
}

+ (id)Emergency
{
  return (id)objc_opt_class();
}

+ (id)MicroLocation
{
  return (id)objc_opt_class();
}

+ (id)PointOfInterest
{
  return (id)objc_opt_class();
}

+ (id)streamNames
{
  return &unk_1E5F1E328;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMLocationHashedCoordinates validKeyPaths](BMLocationHashedCoordinates, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  +[BMLocationMicroLocationVisit validKeyPaths](BMLocationMicroLocationVisit, "validKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  +[BMLocationPlaceInference validKeyPaths](BMLocationPlaceInference, "validKeyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  +[BMLocationSemantic validKeyPaths](BMLocationSemantic, "validKeyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  +[BMLocationSignificantVisit validKeyPaths](BMLocationSignificantVisit, "validKeyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v7);

  +[BMLocationVisit validKeyPaths](BMLocationVisit, "validKeyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v8);

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

+ (id)streamWithName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HashedCoordinates")))
  {
    objc_msgSend(a1, "HashedCoordinates");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("MicroLocationVisit")))
  {
    objc_msgSend(a1, "MicroLocationVisit");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("PlaceInference")))
  {
    objc_msgSend(a1, "PlaceInference");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Semantic")))
  {
    objc_msgSend(a1, "Semantic");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("SignificantVisit")))
  {
    objc_msgSend(a1, "SignificantVisit");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Visit")))
    {
      v6 = 0;
      goto LABEL_14;
    }
    objc_msgSend(a1, "Visit");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_14:

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
  objc_msgSend(a1, "Emergency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "MicroLocation", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(a1, "PointOfInterest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
