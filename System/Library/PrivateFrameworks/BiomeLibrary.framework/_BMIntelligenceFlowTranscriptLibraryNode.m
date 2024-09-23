@implementation _BMIntelligenceFlowTranscriptLibraryNode

+ (id)Datastream
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "configurationForDatastream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMIntelligenceFlowTranscriptDatastreamEvent columns](BMIntelligenceFlowTranscriptDatastreamEvent, "columns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMEventTimestampSQLColumn();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  BMEventBodyDataSQLColumn();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  BMEventClassNameSQLColumn();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  BMEventBookmarkSQLColumns();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldPath:protoDataType:convertedType:", CFSTR("identifiers.clientSessionId"), 2, 1, &unk_1E5F1FEB8, 13, 0);
  v19[0] = v11;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldPath:protoDataType:convertedType:", CFSTR("identifiers.clientRequestId"), 2, 1, &unk_1E5F1FED0, 13, 0);
  v19[1] = v12;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldPath:protoDataType:convertedType:", CFSTR("identifiers.sessionId"), 6, 1, &unk_1E5F1FEE8, 14, 3);
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02728]), "initWithTableName:columns:", CFSTR("IntelligenceFlow.Transcript.Datastream"), v15);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02798]), "initWithIdentifier:schema:configuration:", CFSTR("IntelligenceFlow.Transcript.Datastream"), v16, v2);

  return v17;
}

+ (id)storeConfigurationForDatastream
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", 0, 0, 52428800, 1000, 604800.0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newLibraryStoreConfigForStreamIdentifier:domain:segmentSize:protectionClass:pruningPolicy:", CFSTR("IntelligenceFlow.Transcript.Datastream"), 0, 0x100000, 3, v2);

  return v3;
}

+ (id)syncPolicyForDatastream
{
  return 0;
}

+ (id)spaceAttributionForDatastream
{
  return CFSTR("com.apple.intelligenceflow.intelligenceflowd");
}

+ (id)configurationForDatastream
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "storeConfigurationForDatastream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncPolicyForDatastream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D027A0]), "initWithStreamIdentifier:eventClass:storeConfig:syncPolicy:alternativeNames:internalMetadata:", CFSTR("IntelligenceFlow.Transcript.Datastream"), objc_opt_class(), v3, v4, &unk_1E5F1FF00, 0);

  return v5;
}

+ (id)identifier
{
  return CFSTR("Transcript");
}

+ (id)streamNames
{
  return &unk_1E5F1FF18;
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[BMIntelligenceFlowTranscriptDatastreamEvent validKeyPaths](BMIntelligenceFlowTranscriptDatastreamEvent, "validKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

+ (id)streamWithName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Datastream")))
  {
    objc_msgSend(a1, "Datastream");
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
