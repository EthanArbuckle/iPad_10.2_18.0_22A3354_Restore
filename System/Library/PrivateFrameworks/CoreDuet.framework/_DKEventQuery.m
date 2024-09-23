@implementation _DKEventQuery

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKEventQuery;
  v4 = a3;
  -[_DKQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventStreams, CFSTR("eventStreams"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_offset, CFSTR("offset"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_limit, CFSTR("limit"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortDescriptors, CFSTR("sortDescriptors"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupByProperties, CFSTR("groupByProperties"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_readMetadata, CFSTR("readMetadata"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_deduplicateValues, CFSTR("deduplicateValues"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_resultType, CFSTR("resultType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceIDs, CFSTR("deviceIDs"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_returnsDistinctResults, CFSTR("returnsDistinctResults"));

}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSArray)excludedMetadataKeys
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (id)executeUsingCoreDataStorage:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  _BOOL4 v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v56;
  uint64_t v57;
  _DKBiomeQuery *v58;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _DKEventQuery *v65;
  id v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  id v81[2];

  v5 = a3;
  -[_DKEventQuery readMetadata](self, "readMetadata");
  -[_DKEventQuery deduplicateValues](self, "deduplicateValues");
  kdebug_trace();
  -[_DKEventQuery explicitEventStreamsOrEventStreamsInPredicate](self, "explicitEventStreamsOrEventStreamsInPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _streamNameFromStreams(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _cdknowledge_signpost_query_begin(v7);

  if (self->_disableBiomeShim)
  {
    v8 = v6;
    v9 = 0;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    v11 = 1;
  }
  else
  {
    +[_DKBiomeQuery biomeExclusiveStreamsFromEventStreams:](_DKBiomeQuery, "biomeExclusiveStreamsFromEventStreams:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKBiomeQuery duetExclusiveStreamsFromEventStreams:](_DKBiomeQuery, "duetExclusiveStreamsFromEventStreams:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "count") != 0;
    v11 = objc_msgSend(v8, "count") != 0;
  }
  v61 = v10;
  if (_os_feature_enabled_impl()
    && !+[_DKBiomeQuery shimDisabled](_DKBiomeQuery, "shimDisabled"))
  {
    if (!objc_msgSend(v10, "count") && !objc_msgSend(v8, "count"))
    {
      _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[_DKEventQuery executeUsingCoreDataStorage:error:].cold.7((uint64_t)v13, self, v14);

    }
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  v60 = v8;
  +[_DKEventQuery constructFetchRequestPredicateForEventStreams:predicate:deviceIDs:](_DKEventQuery, "constructFetchRequestPredicateForEventStreams:predicate:deviceIDs:", v8, self->_predicate, self->_deviceIDs);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_DKEventQuery resultType](self, "resultType");
  if (-[_DKEventQuery resultType](self, "resultType") == 1)
  {
    -[_DKEventQuery groupByProperties](self, "groupByProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (!v16)
      goto LABEL_22;
  }
  else
  {
    v18 = 0;
    if (!v16)
      goto LABEL_22;
  }
  if (!v18 && v9 && v11)
  {
    _CDCurrentOrXPCProcessName();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v5;
    v22 = a4;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[_DKEventQuery executeUsingCoreDataStorage:error:].cold.6(self, (uint64_t)v19, v20);

    v23 = 0;
    goto LABEL_38;
  }
LABEL_22:
  if (((v12 | !v9) & 1) != 0)
  {
    v23 = 0;
    v21 = v5;
  }
  else
  {
    v57 = MEMORY[0x193FEE914]();
    v56 = os_transaction_create();
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[_DKEventQuery executeUsingCoreDataStorage:error:].cold.5(v24, v25, v26, v27, v28, v29, v30, v31);

    v81[0] = 0;
    v58 = -[_DKBiomeQuery initWithDKEventQuery:]([_DKBiomeQuery alloc], "initWithDKEventQuery:", self);
    -[_DKBiomeQuery executeBiomeQueryError:](v58, "executeBiomeQueryError:", v81);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v81[0];
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[_DKEventQuery executeUsingCoreDataStorage:error:].cold.4(v33, v34, v35, v36, v37, v38, v39, v40);

    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v32)
    {
      v21 = v5;
      v44 = (void *)v56;
      v43 = (void *)v57;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[_DKEventQuery executeUsingCoreDataStorage:error:].cold.3();
    }
    else
    {
      v45 = os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG);
      v21 = v5;
      if (v18)
      {
        v44 = (void *)v56;
        v43 = (void *)v57;
        if (v45)
          -[_DKEventQuery executeUsingCoreDataStorage:error:].cold.1(v23);
      }
      else
      {
        v44 = (void *)v56;
        v43 = (void *)v57;
        if (v45)
          -[_DKEventQuery executeUsingCoreDataStorage:error:].cold.2(v23);
      }
    }

    objc_msgSend(v23, "count");
    objc_msgSend(v32, "code");
    kdebug_trace();
    _cdknowledge_signpost_query_end(objc_msgSend(v23, "count"), objc_msgSend(v32, "code"));

    objc_autoreleasePoolPop(v43);
    if (!v11)
    {
      objc_msgSend(v23, "count");
      objc_msgSend(0, "code");
      kdebug_trace();
      _cdknowledge_signpost_query_end(objc_msgSend(v23, "count"), objc_msgSend(0, "code"));
      v51 = v23;
      v54 = v51;
      goto LABEL_45;
    }
  }
  v22 = a4;
LABEL_38:
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__24;
  v79 = __Block_byref_object_dispose__24;
  v80 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__24;
  v73 = __Block_byref_object_dispose__24;
  v74 = 0;
  v46 = -[_DKQuery executeConcurrently](self, "executeConcurrently");
  v47 = *MEMORY[0x1E0CB2AC0];
  if (v46)
    objc_msgSend(v21, "privateManagedObjectContextFor:", v47);
  else
    objc_msgSend(v21, "managedObjectContextFor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)os_transaction_create();
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke;
  v62[3] = &unk_1E26E6890;
  v50 = v48;
  v63 = v50;
  v64 = v15;
  v65 = self;
  v67 = &v69;
  v68 = &v75;
  v51 = v23;
  v66 = v51;
  objc_msgSend(v50, "performWithOptions:andBlock:", 4, v62);
  if (v22)
  {
    v52 = (void *)v70[5];
    if (v52)
      *v22 = objc_retainAutorelease(v52);
  }
  objc_msgSend((id)v76[5], "count");
  objc_msgSend((id)v70[5], "code");
  kdebug_trace();
  v53 = objc_msgSend((id)v76[5], "count");
  _cdknowledge_signpost_query_end(v53, objc_msgSend((id)v70[5], "code"));
  v54 = (id)v76[5];

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);

LABEL_45:
  return v54;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (id)explicitEventStreamsOrEventStreamsInPredicate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[_DKEventQuery eventStreams](self, "eventStreams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[_DKEventQuery eventStreams](self, "eventStreams");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_DKEventQuery predicate](self, "predicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKBiomeQuery eventStreamsFromPredicate:](_DKBiomeQuery, "eventStreamsFromPredicate:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSArray)eventStreams
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)readMetadata
{
  return self->_readMetadata;
}

- (BOOL)deduplicateValues
{
  return self->_deduplicateValues;
}

- (id)handleResults:(id)a3 error:(id)a4
{
  id v6;
  void (**resultsHandler)(id, _DKEventQuery *, id, id);

  v6 = a3;
  resultsHandler = (void (**)(id, _DKEventQuery *, id, id))self->_resultsHandler;
  if (resultsHandler)
    resultsHandler[2](resultsHandler, self, v6, a4);
  return v6;
}

- (NSArray)sortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (NSArray)groupByProperties
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)returnsDistinctResults
{
  return self->_returnsDistinctResults;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 48, 1);
}

+ (id)eventQueryWithPredicate:(id)a3 eventStreams:(id)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 sortDescriptors:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:eventStreams:offset:limit:sortDescriptors:resultHandler:", v14, v13, a5, a6, v12, 0);

  return v15;
}

- (_DKEventQuery)initWithPredicate:(id)a3 eventStreams:(id)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 sortDescriptors:(id)a7 resultHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  _DKEventQuery *v18;
  _DKEventQuery *v19;
  uint64_t v20;
  id resultsHandler;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *defaultQueue;
  uint64_t v25;
  NSSet *deviceIDs;
  id v28;
  objc_super v29;

  v28 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)_DKEventQuery;
  v18 = -[_DKEventQuery init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_predicate, a3);
    v19->_offset = a5;
    v19->_limit = a6;
    objc_storeStrong((id *)&v19->_sortDescriptors, a7);
    objc_storeStrong((id *)&v19->_eventStreams, a4);
    v20 = MEMORY[0x193FEEAF4](v17);
    resultsHandler = v19->_resultsHandler;
    v19->_resultsHandler = (id)v20;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("com.apple.coreduet.eventquery", v22);
    defaultQueue = v19->_defaultQueue;
    v19->_defaultQueue = (OS_dispatch_queue *)v23;

    v19->_readMetadata = 1;
    *(_WORD *)&v19->_deduplicateValues = 1;
    v19->_disableBiomeShim = 0;
    +[_DKEventQuery onlyLocalDevice](_DKEventQuery, "onlyLocalDevice");
    v25 = objc_claimAutoreleasedReturnValue();
    deviceIDs = v19->_deviceIDs;
    v19->_deviceIDs = (NSSet *)v25;

  }
  return v19;
}

+ (id)constructFetchRequestPredicateForEventStreams:(id)a3 predicate:(id)a4 deviceIDs:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v15), "name", (_QWORD)v35);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v13);
  }

  +[_DKEventQuery allDevices](_DKEventQuery, "allDevices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v9, "isEqualToSet:", v17);

  if ((v18 & 1) == 0)
  {
    +[_DKEventQuery onlyLocalDevice](_DKEventQuery, "onlyLocalDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v9, "isEqualToSet:", v19);

    if (v20)
    {
      +[_DKQuery predicateForEventsWithNullSourceDeviceID](_DKQuery, "predicateForEventsWithNullSourceDeviceID");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_DKEventQuery onlyRemoteDevice](_DKEventQuery, "onlyRemoteDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v9, "isEqualToSet:", v22);

      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0CB3528];
        +[_DKQuery predicateForEventsWithNullSourceDeviceID](_DKQuery, "predicateForEventsWithNullSourceDeviceID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "notPredicateWithSubpredicate:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          goto LABEL_16;
        goto LABEL_19;
      }
      +[_DKQuery predicateForEventsWithSourceDeviceIDs:](_DKQuery, "predicateForEventsWithSourceDeviceIDs:", v9);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)v21;
    if (v21)
    {
LABEL_16:
      if (v8)
      {
        v27 = (void *)MEMORY[0x1E0CB3528];
        v40[0] = v8;
        v40[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "andPredicateWithSubpredicates:", v28);
        v29 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v29;
      }
      else
      {
        v8 = v26;
      }
    }
LABEL_19:

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v10, "count", (_QWORD)v35))
  {
    v30 = (void *)MEMORY[0x1E0CB3528];
    +[_DKQuery predicateForEventsWithStreamNames:](_DKQuery, "predicateForEventsWithStreamNames:", v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v31;
    v39[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "andPredicateWithSubpredicates:", v32);
    v33 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v33;
  }

  return v8;
}

+ (id)onlyLocalDevice
{
  if (onlyLocalDevice_onceToken != -1)
    dispatch_once(&onlyLocalDevice_onceToken, &__block_literal_global_7_0);
  return (id)onlyLocalDevice_set;
}

+ (id)allDevices
{
  if (allDevices_onceToken != -1)
    dispatch_once(&allDevices_onceToken, &__block_literal_global_10_2);
  return (id)allDevices_set;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedMetadataKeys, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_groupByProperties, 0);
  objc_storeStrong((id *)&self->_deviceIDs, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_eventStreams, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_defaultQueue, 0);
}

+ (id)expressionForEventDuration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("startDate.timeIntervalSinceReferenceDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("endDate.timeIntervalSinceReferenceDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35D0];
  v8[0] = v3;
  v8[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionForFunction:arguments:", CFSTR("from:subtract:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_DKEventQuery)initWithCoder:(id)a3
{
  id v4;
  _DKEventQuery *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *eventStreams;
  uint64_t v11;
  NSPredicate *predicate;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *sortDescriptors;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *groupByProperties;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSSet *deviceIDs;
  _DKEventQuery *v28;
  objc_super v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_DKEventQuery;
  v5 = -[_DKQuery initWithCoder:](&v30, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("eventStreams"));
    v9 = objc_claimAutoreleasedReturnValue();
    eventStreams = v5->_eventStreams;
    v5->_eventStreams = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
    v11 = objc_claimAutoreleasedReturnValue();
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v11;

    v5->_offset = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("offset"));
    v5->_limit = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("limit"));
    v13 = (void *)MEMORY[0x1E0C99E60];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("sortDescriptors"));
    v16 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("groupByProperties"));
    v21 = objc_claimAutoreleasedReturnValue();
    groupByProperties = v5->_groupByProperties;
    v5->_groupByProperties = (NSArray *)v21;

    v5->_readMetadata = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("readMetadata"));
    v5->_deduplicateValues = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_deduplicateValues"));
    v5->_resultType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("resultType"));
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("deviceIDs"));
    v26 = objc_claimAutoreleasedReturnValue();
    deviceIDs = v5->_deviceIDs;
    v5->_deviceIDs = (NSSet *)v26;

    v5->_returnsDistinctResults = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("returnsDistinctResults"));
    v28 = v5;

  }
  return v5;
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (void)setReadMetadata:(BOOL)a3
{
  self->_readMetadata = a3;
}

- (void)setGroupByProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setDeduplicateValues:(BOOL)a3
{
  self->_deduplicateValues = a3;
}

+ (id)predicateForEventsOfMinimumDuration:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend((id)objc_opt_class(), "expressionForEventDuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expressionForConstantValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v4, v7, 0, 3, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)onlyRemoteDevice
{
  if (onlyRemoteDevice_onceToken != -1)
    dispatch_once(&onlyRemoteDevice_onceToken, &__block_literal_global_11_0);
  return (id)onlyRemoteDevice_set;
}

+ (id)eventQueryWithPredicate:(id)a3 eventStreams:(id)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 sortDescriptors:(id)a7 resultHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v14 = a8;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:eventStreams:offset:limit:sortDescriptors:resultHandler:", v17, v16, a5, a6, v15, v14);

  return v18;
}

- (_DKEventQuery)init
{
  return -[_DKEventQuery initWithPredicate:eventStreams:offset:limit:sortDescriptors:resultHandler:](self, "initWithPredicate:eventStreams:offset:limit:sortDescriptors:resultHandler:", 0, 0, 0, 0, 0, 0);
}

- (id)constructFetchRequestPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_DKEventQuery eventStreams](self, "eventStreams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery deviceIDs](self, "deviceIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventQuery constructFetchRequestPredicateForEventStreams:predicate:deviceIDs:](_DKEventQuery, "constructFetchRequestPredicateForEventStreams:predicate:deviceIDs:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForEventsOfMaximumDuration:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend((id)objc_opt_class(), "expressionForEventDuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expressionForConstantValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v4, v7, 0, 1, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setEventStreams:", self->_eventStreams);
  objc_msgSend(v4, "setPredicate:", self->_predicate);
  objc_msgSend(v4, "setOffset:", self->_offset);
  objc_msgSend(v4, "setLimit:", self->_limit);
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors);
  objc_msgSend(v4, "setGroupByProperties:", self->_groupByProperties);
  objc_msgSend(v4, "setReadMetadata:", self->_readMetadata);
  objc_msgSend(v4, "setDeduplicateValues:", self->_deduplicateValues);
  objc_msgSend(v4, "setResultType:", self->_resultType);
  objc_msgSend(v4, "setDeviceIDs:", self->_deviceIDs);
  objc_msgSend(v4, "setReturnsDistinctResults:", self->_returnsDistinctResults);
  objc_msgSend(v4, "setExecuteConcurrently:", -[_DKQuery executeConcurrently](self, "executeConcurrently"));
  return v4;
}

- (id)description
{
  NSSet *deviceIDs;
  void *v4;
  __CFString *v5;
  NSSet *v6;
  void *v7;
  NSSet *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  deviceIDs = self->_deviceIDs;
  +[_DKEventQuery allDevices](_DKEventQuery, "allDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(deviceIDs) = -[NSSet isEqualToSet:](deviceIDs, "isEqualToSet:", v4);

  if ((deviceIDs & 1) != 0)
  {
    v5 = CFSTR("All");
  }
  else
  {
    v6 = self->_deviceIDs;
    +[_DKEventQuery onlyRemoteDevice](_DKEventQuery, "onlyRemoteDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = -[NSSet isEqualToSet:](v6, "isEqualToSet:", v7);

    if ((v6 & 1) != 0)
    {
      v5 = CFSTR("OnlyRemote");
    }
    else
    {
      v8 = self->_deviceIDs;
      +[_DKEventQuery onlyLocalDevice](_DKEventQuery, "onlyLocalDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = -[NSSet isEqualToSet:](v8, "isEqualToSet:", v9);

      if ((v8 & 1) != 0)
      {
        v5 = CFSTR("OnlyLocal");
      }
      else
      {
        _CDPrettyPrintCollection(self->_deviceIDs, 0, 0, 0);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray valueForKeyPath:](self->_eventStreams, "valueForKeyPath:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:{eventStreams=%@; predicate=%@; limit=%lu; offset=%lu; groupBy=%@; sort=%@; resultType=%ld; deviceIDs=%@ }}"),
    v12,
    v14,
    self->_predicate,
    self->_limit,
    self->_offset,
    self->_groupByProperties,
    self->_sortDescriptors,
    self->_resultType,
    v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setEventStreams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (NSSet)deviceIDs
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeviceIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (id)resultsHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setResultsHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void)setReturnsDistinctResults:(BOOL)a3
{
  self->_returnsDistinctResults = a3;
}

- (void)setExcludedMetadataKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)disableBiomeShim
{
  return self->_disableBiomeShim;
}

- (void)setDisableBiomeShim:(BOOL)a3
{
  self->_disableBiomeShim = a3;
}

- (void)executeUsingCoreDataStorage:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "unsignedIntegerValue");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v2, v3, "_DKBiomeQuery success, count: %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)executeUsingCoreDataStorage:(void *)a1 error:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "_DKBiomeQuery success, result count: %ld", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)executeUsingCoreDataStorage:error:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_ERROR, "_DKBiomeQuery failure, error: %@", v1, 0xCu);
}

- (void)executeUsingCoreDataStorage:(uint64_t)a3 error:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, a1, a3, "_DKBiomeQuery completed Biome-shimmed query", a5, a6, a7, a8, 0);
}

- (void)executeUsingCoreDataStorage:(uint64_t)a3 error:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, a1, a3, "_DKBiomeQuery starting Biome-shimmed query", a5, a6, a7, a8, 0);
}

- (void)executeUsingCoreDataStorage:(NSObject *)a3 error:.cold.6(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint8_t v10[14];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "resultType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "constructFetchRequestPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_8();
  v11 = a2;
  v12 = v8;
  v13 = v9;
  _os_log_fault_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_FAULT, "Query contains mix of Biome/CoreDuet streams and a non-event result type (%@). %@: %@", v10, 0x20u);

}

- (void)executeUsingCoreDataStorage:(NSObject *)a3 error:.cold.7(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "constructFetchRequestPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_8();
  v7 = v5;
  _os_log_fault_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_FAULT, "Query does not specify any stream list. Client: %@, Predicate: %@", v6, 0x16u);

}

@end
