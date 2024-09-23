@implementation DRSEnableDataGatheringQuery

- (id)protobufRepresentation
{
  DRSProtoEnableDataGatheringRequest *v3;
  DRSProtoRequestDescription *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  NSObject *v12;
  uint8_t v13[16];

  if (-[DRSEnableDataGatheringQuery response](self, "response") == 2)
  {
    v3 = objc_alloc_init(DRSProtoEnableDataGatheringRequest);
    v4 = objc_alloc_init(DRSProtoRequestDescription);
    -[DRSEnableDataGatheringQuery teamID](self, "teamID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSProtoRequestDescription setTeamId:](v4, "setTeamId:", v5);

    -[DRSEnableDataGatheringQuery issueCategory](self, "issueCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSProtoRequestDescription setIssueCategory:](v4, "setIssueCategory:", v6);

    -[DRSEnableDataGatheringQuery contextDictionaryData](self, "contextDictionaryData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSProtoRequestDescription setContextDictionaryData:](v4, "setContextDictionaryData:", v7);

    -[DRSEnableDataGatheringQuery queryDate](self, "queryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    -[DRSProtoRequestDescription setRequestTime:](v4, "setRequestTime:", (unint64_t)v9);

    -[DRSProtoEnableDataGatheringRequest setRequestDescription:](v3, "setRequestDescription:", v4);
    -[DRSEnableDataGatheringQuery logType](self, "logType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSProtoEnableDataGatheringRequest setLogType:](v3, "setLogType:", v10);

    -[DRSProtoEnableDataGatheringRequest setIsContinue:](v3, "setIsContinue:", -[DRSEnableDataGatheringQuery isContinue](self, "isContinue"));
    return v3;
  }
  else
  {
    DPLogHandle_CKInvernessError();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BadEnableDataGatheringQuery", "Tried to create a protobuf for a query that was not in RETRY state", v13, 2u);
    }

    return 0;
  }
}

- (DRSDecisionServerBatchRequest)pbBatchInstance
{
  return (DRSDecisionServerBatchRequest *)objc_alloc_init(DRSProtoEnableDataGatheringRequestBatch);
}

- (Class)pbBatchResponseClass
{
  return (Class)objc_opt_class();
}

- (NSString)functionName
{
  return (NSString *)CFSTR("shouldEnableDataGatheringBatch");
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v18;
  void *v19;
  id v20;
  void *v21;

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[DRSEnableDataGatheringQuery build](self, "build");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSEnableDataGatheringQuery queryID](self, "queryID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSEnableDataGatheringQuery responseString](self, "responseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSEnableDataGatheringQuery rejectionReason](self, "rejectionReason");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("-");
  v7 = -[DRSEnableDataGatheringQuery attemptCount](self, "attemptCount");
  -[DRSEnableDataGatheringQuery teamID](self, "teamID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSEnableDataGatheringQuery issueCategory](self, "issueCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSEnableDataGatheringQuery logType](self, "logType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DRSEnableDataGatheringQuery isContinue](self, "isContinue"))
    v11 = CFSTR("Continue");
  else
    v11 = CFSTR("Initial");
  -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "debugDescription");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("-");
  if (v13)
    v15 = (const __CFString *)v13;
  v16 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@ %@ %@ %@ %u %@/%@ %@ %@ %@"), v19, v18, v3, v6, v7, v8, v9, v10, v11, v15);

  return (NSString *)v16;
}

- (NSString)responseString
{
  unsigned int v2;

  v2 = -[DRSEnableDataGatheringQuery response](self, "response");
  if (v2 > 3)
    return (NSString *)CFSTR("UNKNOWN");
  else
    return &off_1EA3D1E90[(char)v2]->isa;
}

+ (id)entityName
{
  return CFSTR("DRSEnableDataGatheringQueryMO");
}

- (id)_initWithMO_ON_MOC_QUEUE:(id)a3
{
  id v4;
  DRSEnableDataGatheringQuery *v5;
  uint64_t v6;
  NSData *contextDictionaryData;
  void *v8;
  uint64_t v9;
  NSDictionary *contextDictionary;
  void *v11;
  uint64_t v12;
  NSString *teamID;
  uint64_t v14;
  NSString *issueCategory;
  uint64_t v16;
  NSString *build;
  uint64_t v18;
  NSDate *queryDate;
  uint64_t v20;
  NSString *logType;
  uint64_t v22;
  NSUUID *queryID;
  uint64_t v24;
  NSString *rejectionReason;
  DRSEnableDataGatheringQuery *v26;
  NSObject *v28;
  uint8_t v29[16];
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)DRSEnableDataGatheringQuery;
  v5 = -[DRSEnableDataGatheringQuery init](&v30, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "contextDictionaryData");
  v6 = objc_claimAutoreleasedReturnValue();
  contextDictionaryData = v5->_contextDictionaryData;
  v5->_contextDictionaryData = (NSData *)v6;

  if (!v5->_contextDictionaryData)
    goto LABEL_4;
  -[DRSEnableDataGatheringQuery contextDictionaryData](v5, "contextDictionaryData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DRSDictionaryForData((uint64_t)v8);
  v9 = objc_claimAutoreleasedReturnValue();
  contextDictionary = v5->_contextDictionary;
  v5->_contextDictionary = (NSDictionary *)v9;

  -[DRSEnableDataGatheringQuery contextDictionary](v5, "contextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
LABEL_4:
    objc_msgSend(v4, "teamID");
    v12 = objc_claimAutoreleasedReturnValue();
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v12;

    objc_msgSend(v4, "issueCategory");
    v14 = objc_claimAutoreleasedReturnValue();
    issueCategory = v5->_issueCategory;
    v5->_issueCategory = (NSString *)v14;

    objc_msgSend(v4, "build");
    v16 = objc_claimAutoreleasedReturnValue();
    build = v5->_build;
    v5->_build = (NSString *)v16;

    objc_msgSend(v4, "queryDate");
    v18 = objc_claimAutoreleasedReturnValue();
    queryDate = v5->_queryDate;
    v5->_queryDate = (NSDate *)v18;

    objc_msgSend(v4, "logType");
    v20 = objc_claimAutoreleasedReturnValue();
    logType = v5->_logType;
    v5->_logType = (NSString *)v20;

    v5->_response = objc_msgSend(v4, "response");
    objc_msgSend(v4, "queryID");
    v22 = objc_claimAutoreleasedReturnValue();
    queryID = v5->_queryID;
    v5->_queryID = (NSUUID *)v22;

    v5->_attemptCount = objc_msgSend(v4, "attemptCount");
    objc_msgSend(v4, "rejectionReason");
    v24 = objc_claimAutoreleasedReturnValue();
    rejectionReason = v5->_rejectionReason;
    v5->_rejectionReason = (NSString *)v24;

    v5->_isContinue = objc_msgSend(v4, "isContinue");
LABEL_5:
    v26 = v5;
    goto LABEL_6;
  }
  DPLogHandle_CoreDataError();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MalformedEnableDataGatheringQueryMO", "Could not convert context dict data into dict", v29, 2u);
  }

  v26 = 0;
LABEL_6:

  return v26;
}

- (DRSEnableDataGatheringQuery)initWithXPCDict:(id)a3
{
  id v4;
  const char *string;
  const char *v6;
  char *v7;
  const void *data;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  BOOL v15;
  BOOL v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  const __CFString *v20;
  DRSEnableDataGatheringQuery *v21;
  DRSEnableDataGatheringQuery *v22;
  uint64_t v23;
  NSString *teamID;
  uint64_t v25;
  NSString *issueCategory;
  uint64_t v27;
  NSString *logType;
  uint64_t v29;
  NSDate *queryDate;
  uint64_t v31;
  NSUUID *queryID;
  void *v33;
  uint64_t v34;
  NSString *build;
  NSString *rejectionReason;
  DRSEnableDataGatheringQuery *v37;
  uint64_t v38;
  objc_super v40;
  size_t length;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  string = xpc_dictionary_get_string(v4, "TeamID");
  v6 = xpc_dictionary_get_string(v4, "Category");
  v7 = (char *)xpc_dictionary_get_string(v4, "LogType");
  length = 0;
  data = xpc_dictionary_get_data(v4, "ContextDict", &length);

  if (data)
    v9 = length == 0;
  else
    v9 = 1;
  if (v9)
  {
    v12 = 0;
    v10 = 0;
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    DRSDictionaryForData((uint64_t)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v11 == 0;
    if (v11)
      v14 = v11;

  }
  if (string)
    v15 = v6 == 0;
  else
    v15 = 1;
  v16 = v15 || v7 == 0;
  if (v16 || !v12 && length)
  {
    DPLogHandle_ServiceXPCError();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      if (string)
        v18 = string;
      else
        v18 = "MISSING";
      if (!v6)
        v6 = "MISSING";
      if (v7)
        v19 = v7;
      else
        v19 = "MISSING";
      if (v13)
      {
        v20 = CFSTR("MALFORMED");
      }
      else
      {
        objc_msgSend(v12, "debugDescription");
        v38 = objc_claimAutoreleasedReturnValue();
        v7 = (char *)v38;
        v20 = CFSTR("-");
        if (v38)
          v20 = (const __CFString *)v38;
      }
      *(_DWORD *)buf = 136446978;
      v43 = v18;
      v44 = 2082;
      v45 = v6;
      v46 = 2082;
      v47 = v19;
      v48 = 2114;
      v49 = v20;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MalformedEnableDataGatheringRequest", "Received invalid log gathering query from %{public, name=teamID}s/%{public, name=issueCategory}s/%{public, name=logType}s %{public, name=contextDictionaryDescription}@", buf, 0x2Au);
      if (!v13)

    }
    v37 = 0;
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)DRSEnableDataGatheringQuery;
    v21 = -[DRSEnableDataGatheringQuery init](&v40, sel_init);
    v22 = v21;
    if (v21)
    {
      objc_storeStrong((id *)&v21->_contextDictionary, v12);
      objc_storeStrong((id *)&v22->_contextDictionaryData, v10);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v23 = objc_claimAutoreleasedReturnValue();
      teamID = v22->_teamID;
      v22->_teamID = (NSString *)v23;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v25 = objc_claimAutoreleasedReturnValue();
      issueCategory = v22->_issueCategory;
      v22->_issueCategory = (NSString *)v25;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
      v27 = objc_claimAutoreleasedReturnValue();
      logType = v22->_logType;
      v22->_logType = (NSString *)v27;

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v29 = objc_claimAutoreleasedReturnValue();
      queryDate = v22->_queryDate;
      v22->_queryDate = (NSDate *)v29;

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v31 = objc_claimAutoreleasedReturnValue();
      queryID = v22->_queryID;
      v22->_queryID = (NSUUID *)v31;

      v22->_response = 2;
      v22->_attemptCount = 0;
      +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "build");
      v34 = objc_claimAutoreleasedReturnValue();
      build = v22->_build;
      v22->_build = (NSString *)v34;

      rejectionReason = v22->_rejectionReason;
      v22->_rejectionReason = 0;

      v22->_isContinue = 0;
    }
    self = v22;
    v37 = self;
  }

  return v37;
}

+ (id)_ON_MOC_QUEUE_enableDataGatheringQueryForID:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a4;
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("queryID == %@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(a1, "_ON_MOC_QUEUE_enableDataGatheringQueriesForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v9, v8, 0, 0, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v16;
  if (!v10 || !objc_msgSend(v10, "count"))
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v10, "count") != 1)
  {
    DPLogHandle_CoreDataError();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      v14 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138543618;
      v18 = v6;
      v19 = 2048;
      v20 = v14;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "QueryMangedObjectFetchUnexpectedMatches", "Query for UUID %{public}@ found %lu objects", buf, 0x16u);
    }

    goto LABEL_8;
  }
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v12;
}

+ (id)_ON_MOC_QUEUE_enableDataGatheringQueriesForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v23;

  v12 = a4;
  v13 = (void *)MEMORY[0x1E0C97B48];
  v14 = a5;
  v15 = a3;
  objc_msgSend(a1, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchRequestWithEntityName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setPredicate:", v15);
  objc_msgSend(v17, "setSortDescriptors:", v14);

  if (a6)
    objc_msgSend(v17, "setFetchLimit:", a6);
  v23 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v17, &v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v23;
  v20 = v19;
  if (v19)
  {
    v21 = 0;
    *a7 = objc_retainAutorelease(v19);
  }
  else
  {
    v21 = v18;
  }

  return v21;
}

+ (id)mostRecentDateFirstSortDescriptor
{
  if (mostRecentDateFirstSortDescriptor_onceToken_0 != -1)
    dispatch_once(&mostRecentDateFirstSortDescriptor_onceToken_0, &__block_literal_global_9);
  return (id)mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor_0;
}

void __64__DRSEnableDataGatheringQuery_mostRecentDateFirstSortDescriptor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("queryDate"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor_0;
  mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor_0 = v0;

}

+ (id)leastRecentDateFirstSortDescriptor
{
  if (leastRecentDateFirstSortDescriptor_onceToken_0 != -1)
    dispatch_once(&leastRecentDateFirstSortDescriptor_onceToken_0, &__block_literal_global_34);
  return (id)leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor_0;
}

void __65__DRSEnableDataGatheringQuery_leastRecentDateFirstSortDescriptor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("queryDate"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor_0;
  leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor_0 = v0;

}

+ (id)enableDataGatheringQueriesForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__5;
  v38 = __Block_byref_object_dispose__5;
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  v33 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __120__DRSEnableDataGatheringQuery_enableDataGatheringQueriesForFilterPredicate_context_sortDescriptors_fetchLimit_errorOut___block_invoke;
  v20[3] = &unk_1EA3D1E70;
  v26 = a1;
  v15 = v12;
  v21 = v15;
  v16 = v13;
  v22 = v16;
  v17 = v14;
  v23 = v17;
  v24 = &v28;
  v27 = a6;
  v25 = &v34;
  objc_msgSend(v16, "performBlockAndWait:", v20);
  if (a7)
    *a7 = objc_retainAutorelease((id)v29[5]);
  v18 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

void __120__DRSEnableDataGatheringQuery_enableDataGatheringQueriesForFilterPredicate_context_sortDescriptors_fetchLimit_errorOut___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  DRSEnableDataGatheringQuery *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = (void *)a1[9];
  v6 = a1[10];
  v31 = 0;
  objc_msgSend(v5, "_ON_MOC_QUEUE_enableDataGatheringQueriesForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v2, v3, v4, v6, &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  v9 = v31;
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v8);
  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v16 = [DRSEnableDataGatheringQuery alloc];
          v17 = -[DRSEnableDataGatheringQuery _initWithMO_ON_MOC_QUEUE:](v16, "_initWithMO_ON_MOC_QUEUE:", v15, (_QWORD)v27);
          if (!v17)
          {
            v19 = (void *)MEMORY[0x1E0CB35C8];
            v32 = *MEMORY[0x1E0CB2D50];
            v33 = CFSTR("Failed to create query for queryMO");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelinePersistenceError"), 0, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v22 = *(_QWORD *)(a1[7] + 8);
            v23 = *(void **)(v22 + 40);
            *(_QWORD *)(v22 + 40) = v21;
            v24 = v21;

            v25 = *(_QWORD *)(a1[8] + 8);
            v26 = *(void **)(v25 + 40);
            *(_QWORD *)(v25 + 40) = 0;

            goto LABEL_12;
          }
          v18 = (void *)v17;
          objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

+ (id)cachedQueryResponseForQuery:(id)a3 inContext:(id)a4 errorOut:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v7, "teamID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "issueCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("teamID == %@ AND issueCategory == %@ AND logType == %@ AND build == %@"), v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[DRSEnableDataGatheringQuery mostRecentDateFirstSortDescriptor](DRSEnableDataGatheringQuery, "mostRecentDateFirstSortDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  objc_msgSend(a1, "enableDataGatheringQueriesForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v14, v8, v16, 1, &v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v30;
  if (v17 && objc_msgSend(v17, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = v17;
    v20 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v20)
    {
      v25 = v8;
      v21 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v7, "doesMatchCachedQuery:", v23) & 1) != 0)
          {
            v20 = v23;
            goto LABEL_14;
          }
        }
        v20 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v20)
          continue;
        break;
      }
LABEL_14:
      v8 = v25;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)enableDataGatheringQueryForID:(id)a3 context:(id)a4
{
  __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a4;
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("queryID == %@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(a1, "enableDataGatheringQueriesForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v9, v8, 0, 1, &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v23;
  if (!v10 || !objc_msgSend(v10, "count"))
  {
    if (v11)
    {
      DPLogHandle_CoreDataError();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v13))
      {
        objc_msgSend(v11, "localizedDescription");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v16 = CFSTR("Unknown");
        if (v14)
          v16 = (const __CFString *)v14;
        *(_DWORD *)buf = 138543362;
        v25 = v16;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "QueryMangedObjectFetchFailure", "Failed to fetch a query object based on MO ID: %{public}@", buf, 0xCu);

      }
      goto LABEL_15;
    }
    DPLogHandle_EnableDataGatheringQuery();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v6;
      v17 = "QueryMangedObjectFetchMiss";
      v18 = "No cached query with MO ID %{public}@";
      v19 = v13;
      v20 = 12;
LABEL_14:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v17, v18, buf, v20);
    }
LABEL_15:

    v12 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v10, "count") != 1)
  {
    DPLogHandle_EnableDataGatheringQueryError();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      v21 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138543618;
      v25 = v6;
      v26 = 2048;
      v27 = v21;
      v17 = "QueryMangedObjectFetchUnexpectedMatches";
      v18 = "Query for UUID %{public}@ found %lu objects";
      v19 = v13;
      v20 = 22;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v12;
}

- (void)updateContextWithDataGatheringQuery_ON_MOC_QUEUE:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DRSEnableDataGatheringQueryMO *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[DRSEnableDataGatheringQuery queryID](self, "queryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ON_MOC_QUEUE_enableDataGatheringQueryForID:context:", v6, v4);
  v7 = (DRSEnableDataGatheringQueryMO *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    DPLogHandle_EnableDataGatheringQuery();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      -[DRSEnableDataGatheringQuery queryID](self, "queryID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v9;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "QueryMangedObjectFetchMiss", "No cached query with MO ID %{public}@", (uint8_t *)&v18, 0xCu);

    }
    v7 = -[DRSEnableDataGatheringQueryMO initWithContext:]([DRSEnableDataGatheringQueryMO alloc], "initWithContext:", v4);
    -[DRSEnableDataGatheringQuery teamID](self, "teamID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQueryMO setTeamID:](v7, "setTeamID:", v10);

    -[DRSEnableDataGatheringQuery issueCategory](self, "issueCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQueryMO setIssueCategory:](v7, "setIssueCategory:", v11);

    -[DRSEnableDataGatheringQuery logType](self, "logType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQueryMO setLogType:](v7, "setLogType:", v12);

    -[DRSEnableDataGatheringQuery contextDictionaryData](self, "contextDictionaryData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQueryMO setContextDictionaryData:](v7, "setContextDictionaryData:", v13);

    -[DRSEnableDataGatheringQuery build](self, "build");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQueryMO setBuild:](v7, "setBuild:", v14);

    -[DRSEnableDataGatheringQuery queryDate](self, "queryDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQueryMO setQueryDate:](v7, "setQueryDate:", v15);

    -[DRSEnableDataGatheringQuery queryID](self, "queryID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQueryMO setQueryID:](v7, "setQueryID:", v16);

  }
  -[DRSEnableDataGatheringQueryMO setResponse:](v7, "setResponse:", -[DRSEnableDataGatheringQuery response](self, "response"));
  -[DRSEnableDataGatheringQueryMO setAttemptCount:](v7, "setAttemptCount:", (__int16)-[DRSEnableDataGatheringQuery attemptCount](self, "attemptCount"));
  -[DRSEnableDataGatheringQuery rejectionReason](self, "rejectionReason");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSEnableDataGatheringQueryMO setRejectionReason:](v7, "setRejectionReason:", v17);

  -[DRSEnableDataGatheringQueryMO setIsContinue:](v7, "setIsContinue:", -[DRSEnableDataGatheringQuery isContinue](self, "isContinue"));
}

- (BOOL)isEqualToDataGatheringQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;
  void *v39;
  int v40;
  int v41;
  int v42;

  v4 = a3;
  -[DRSEnableDataGatheringQuery teamID](self, "teamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "teamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_19;
  -[DRSEnableDataGatheringQuery issueCategory](self, "issueCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "issueCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v10)
    goto LABEL_19;
  -[DRSEnableDataGatheringQuery logType](self, "logType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (!v13)
    goto LABEL_19;
  -[DRSEnableDataGatheringQuery build](self, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if (!v16)
    goto LABEL_19;
  -[DRSEnableDataGatheringQuery queryDate](self, "queryDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToDate:", v18);

  if (!v19)
    goto LABEL_19;
  -[DRSEnableDataGatheringQuery queryID](self, "queryID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if (!v22)
    goto LABEL_19;
  -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23
    && (v24 = (void *)v23,
        objc_msgSend(v4, "contextDictionary"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v25,
        v24,
        v25))
  {
    -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextDictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqualToDictionary:", v27);

    if ((v28 & 1) == 0)
      goto LABEL_19;
  }
  else
  {
    -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      goto LABEL_18;
    objc_msgSend(v4, "contextDictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      goto LABEL_19;
  }
  -[DRSEnableDataGatheringQuery rejectionReason](self, "rejectionReason");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    objc_msgSend(v4, "rejectionReason");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      -[DRSEnableDataGatheringQuery rejectionReason](self, "rejectionReason");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rejectionReason");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqualToString:", v35);

      if ((v36 & 1) == 0)
        goto LABEL_19;
      goto LABEL_22;
    }
  }
  -[DRSEnableDataGatheringQuery rejectionReason](self, "rejectionReason");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v4, "rejectionReason");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
    goto LABEL_19;
LABEL_22:
  v40 = -[DRSEnableDataGatheringQuery attemptCount](self, "attemptCount");
  if (v40 == objc_msgSend(v4, "attemptCount"))
  {
    v41 = -[DRSEnableDataGatheringQuery isContinue](self, "isContinue");
    if (v41 == objc_msgSend(v4, "isContinue"))
    {
      v42 = -[DRSEnableDataGatheringQuery response](self, "response");
      v37 = v42 == objc_msgSend(v4, "response");
      goto LABEL_20;
    }
  }
LABEL_19:
  v37 = 0;
LABEL_20:

  return v37;
}

- (BOOL)doesMatchCachedQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  BOOL v25;

  v4 = a3;
  -[DRSEnableDataGatheringQuery teamID](self, "teamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "teamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[DRSEnableDataGatheringQuery issueCategory](self, "issueCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "issueCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      -[DRSEnableDataGatheringQuery logType](self, "logType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
      {
        -[DRSEnableDataGatheringQuery build](self, "build");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "build");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if (v16)
        {
          -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17
            && (v18 = (void *)v17,
                objc_msgSend(v4, "contextDictionary"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v19,
                v18,
                v19))
          {
            -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "contextDictionary");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "isEqualToDictionary:", v21);

            if ((v22 & 1) != 0)
              goto LABEL_14;
          }
          else
          {
            -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {

            }
            else
            {
              objc_msgSend(v4, "contextDictionary");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v24)
              {
LABEL_14:
                v25 = 1;
                goto LABEL_13;
              }
            }
          }
        }
      }
    }
  }
  v25 = 0;
LABEL_13:

  return v25;
}

- (BOOL)submitQuery
{
  void *v2;
  NSObject *v4;
  void *v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  int v13;
  NSObject *v14;
  void *v15;
  os_signpost_id_t v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  ++self->_attemptCount;
  DPLogHandle_CKInverness();
  v4 = objc_claimAutoreleasedReturnValue();
  -[DRSEnableDataGatheringQuery queryID](self, "queryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    -[DRSEnableDataGatheringQuery queryID](self, "queryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQuery teamID](self, "teamID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQuery issueCategory](self, "issueCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQuery logType](self, "logType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "debugDescription");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = CFSTR("-");
    }
    v19 = 138544386;
    v20 = v7;
    v21 = 2114;
    v22 = v8;
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = v10;
    v27 = 2114;
    v28 = v12;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EnableDataGatheringQuery", "Began request to decision server to enable data gathering for query ID %{public}@, %{public, name=teamID}@/%{public, name=issueCategory}@/%{public, name=logType}@ %{public, name=contextDictionary}@", (uint8_t *)&v19, 0x34u);
    if (v11)
    {

    }
  }

  v13 = -[DRSEnableDataGatheringQuery response](self, "response");
  if (v13 != 2)
  {
    DPLogHandle_CKInverness();
    v14 = objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQuery queryID](self, "queryID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hash");

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      -[DRSEnableDataGatheringQuery responseString](self, "responseString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_INTERVAL_END, v16, "EnableDataGatheringQuery", "FAILED: Query in unexpected state: %{public}@", (uint8_t *)&v19, 0xCu);

    }
  }
  return v13 == 2;
}

- (void)queryFinishedWithDecision:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  os_signpost_id_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  NSString *rejectionReason;
  void *v19;
  os_signpost_id_t v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  int v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = -[DRSEnableDataGatheringQuery attemptCount](self, "attemptCount");
    DPLogHandle_CKInverness();
    v9 = objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQuery queryID](self, "queryID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hash");

    v12 = v11 - 1;
    if (v8 < 3)
    {
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        objc_msgSend(v7, "localizedDescription");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = CFSTR("Unknown");
        if (v25)
          v27 = (const __CFString *)v25;
        v28 = 138543362;
        v29 = v27;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_INTERVAL_END, v11, "EnableDataGatheringQuery", "Attempt failed due to error: %{public}@", (uint8_t *)&v28, 0xCu);

      }
    }
    else
    {
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        objc_msgSend(v7, "localizedDescription");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        v15 = CFSTR("Unknown");
        if (v13)
          v15 = (const __CFString *)v13;
        v28 = 138543362;
        v29 = v15;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_INTERVAL_END, v11, "EnableDataGatheringQuery", "Query invalidated due to attempt count. Last error:%{public}@", (uint8_t *)&v28, 0xCu);

      }
      self->_response = 3;
      objc_msgSend(v7, "localizedDescription");
      v16 = objc_claimAutoreleasedReturnValue();
      v9 = v16;
      if (v16)
        v17 = (__CFString *)v16;
      else
        v17 = CFSTR("Unknown");
      objc_storeStrong((id *)&self->_rejectionReason, v17);
    }
  }
  else
  {
    self->_response = objc_msgSend(v6, "requestAccepted");
    rejectionReason = self->_rejectionReason;
    self->_rejectionReason = 0;

    DPLogHandle_CKInverness();
    v9 = objc_claimAutoreleasedReturnValue();
    -[DRSEnableDataGatheringQuery queryID](self, "queryID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hash");

    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      -[DRSEnableDataGatheringQuery responseString](self, "responseString");
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[DRSEnableDataGatheringQuery rejectionReason](self, "rejectionReason");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = CFSTR("-");
      if (v22)
        v24 = (const __CFString *)v22;
      v28 = 138543618;
      v29 = v21;
      v30 = 2114;
      v31 = v24;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_INTERVAL_END, v20, "EnableDataGatheringQuery", "Query successful with response: %{public}@, rejection reason: %{public}@", (uint8_t *)&v28, 0x16u);

    }
  }

}

- (id)jsonCompatibleDictionaryRepresentation
{
  void *v3;
  id v4;
  id v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1DF0B6DC4](self, a2);
  v4 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[DRSEnableDataGatheringQuery build](self, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("build"));

  -[DRSEnableDataGatheringQuery queryDate](self, "queryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("date"));

  -[DRSEnableDataGatheringQuery teamID](self, "teamID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("teamID"));

  -[DRSEnableDataGatheringQuery issueCategory](self, "issueCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("issueCategory"));

  -[DRSEnableDataGatheringQuery responseString](self, "responseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("response"));

  -[DRSEnableDataGatheringQuery logType](self, "logType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("logType"));

  -[DRSEnableDataGatheringQuery queryID](self, "queryID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("queryID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[DRSEnableDataGatheringQuery attemptCount](self, "attemptCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("uploadAttemptCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSEnableDataGatheringQuery isContinue](self, "isContinue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("isContinue"));

  -[DRSEnableDataGatheringQuery rejectionReason](self, "rejectionReason");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[DRSEnableDataGatheringQuery rejectionReason](self, "rejectionReason");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("rejectionReason"));

  }
  -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB36D8];
    -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend(v20, "isValidJSONObject:", v21);

    if ((_DWORD)v20)
    {
      -[DRSEnableDataGatheringQuery contextDictionary](self, "contextDictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("contextDictionary"));

    }
    else
    {
      DPLogHandle_Request();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v23))
      {
        -[DRSEnableDataGatheringQuery debugDescription](self, "debugDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v24;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SkippedContextDictionaryJSONSerialization", "Context dictionary for %{public}@ cannot be serialized in JSON", (uint8_t *)&v26, 0xCu);

      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("<Could not serialize>"), CFSTR("contextDictionary"));
    }
  }

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSString)issueCategory
{
  return self->_issueCategory;
}

- (NSString)logType
{
  return self->_logType;
}

- (NSString)build
{
  return self->_build;
}

- (NSDate)queryDate
{
  return self->_queryDate;
}

- (NSUUID)queryID
{
  return self->_queryID;
}

- (unsigned)response
{
  return self->_response;
}

- (void)setResponse:(unsigned __int8)a3
{
  self->_response = a3;
}

- (NSData)contextDictionaryData
{
  return self->_contextDictionaryData;
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (unsigned)attemptCount
{
  return self->_attemptCount;
}

- (NSString)rejectionReason
{
  return self->_rejectionReason;
}

- (void)setRejectionReason:(id)a3
{
  objc_storeStrong((id *)&self->_rejectionReason, a3);
}

- (BOOL)isContinue
{
  return self->_isContinue;
}

- (void)setIsContinue:(BOOL)a3
{
  self->_isContinue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectionReason, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_storeStrong((id *)&self->_contextDictionaryData, 0);
  objc_storeStrong((id *)&self->_queryID, 0);
  objc_storeStrong((id *)&self->_queryDate, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_logType, 0);
  objc_storeStrong((id *)&self->_issueCategory, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
}

@end
