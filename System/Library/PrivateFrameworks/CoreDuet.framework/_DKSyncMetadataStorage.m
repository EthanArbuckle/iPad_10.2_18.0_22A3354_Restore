@implementation _DKSyncMetadataStorage

+ (id)windowStreamNameWithSourceDeviceID:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v6[0] = CFSTR("/knowledge-sync-addition-window");
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bookmarkStreamNameWithSourceDeviceID:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v6[0] = CFSTR("/knowledge-sync-deletion-bookmark");
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)eventFromFetchedWindow:(void *)a3 windowStreamName:(void *)a4 transportName:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  objc_opt_self();
  +[_DKAnyStringIdentifier type](_DKAnyStringIdentifier, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSyncWindow startDate]((uint64_t)v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSyncType urgency]((uint64_t)v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKEvent eventWithStream:startDate:endDate:identifierStringValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v10, v12, v13, v6, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setCreationDate:", v11);
  return v14;
}

+ (id)eventFromStartDate:(void *)a3 endDate:(void *)a4 bookmarkStreamName:(void *)a5 transportName:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a2;
  objc_opt_self();
  +[_DKAnyStringIdentifier type](_DKAnyStringIdentifier, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEvent eventWithStream:startDate:endDate:identifierStringValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v13, v11, v10, v8, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setCreationDate:", v14);
  return v15;
}

@end
