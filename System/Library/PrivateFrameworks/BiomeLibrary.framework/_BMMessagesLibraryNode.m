@implementation _BMMessagesLibraryNode

+ (id)identifier
{
  return CFSTR("Messages");
}

+ (id)Media
{
  return (id)objc_opt_class();
}

+ (id)Read
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
  objc_msgSend(a1, "configurationForRead");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMMessagesRead columns](BMMessagesRead, "columns");
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

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("Messages.Read"), v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("Messages.Read"), v9, v2);

  return v10;
}

+ (id)storeConfigurationForRead
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 10000, 2419200.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("Messages.Read"), 0, 0x20000, 3, v2);

  return v3;
}

+ (id)syncPolicyForRead
{
  return 0;
}

+ (id)spaceAttributionForRead
{
  return CFSTR("com.apple.MobileSMS");
}

+ (id)configurationForRead
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForRead");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForRead");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("Messages.Read"), objc_opt_class(), v3, v4, &unk_1E5F1B040, 0);

  return v5;
}

+ (id)CommunicationSafety
{
  return (id)objc_opt_class();
}

+ (id)SharedWithYou
{
  return (id)objc_opt_class();
}

+ (id)streamNames
{
  return &unk_1E5F1B058;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMMessagesRead validKeyPaths](BMMessagesRead, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

+ (id)streamWithName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Read")))
  {
    objc_msgSend(a1, "Read");
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "CommunicationSafety");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "Media", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(a1, "SharedWithYou");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
