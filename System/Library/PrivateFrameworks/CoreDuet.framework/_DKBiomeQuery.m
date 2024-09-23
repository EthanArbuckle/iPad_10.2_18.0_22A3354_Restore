@implementation _DKBiomeQuery

+ (id)eventStreamsFromPredicate:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    +[_DKBiomePredicateValueScanner searchForValuesForKey:inPredicate:](_DKBiomePredicateValueScanner, "searchForValuesForKey:inPredicate:", CFSTR("streamName"), a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (_DKBiomeQuery)initWithDKEventQuery:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  _DKBiomeQuery *v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "explicitEventStreamsOrEventStreamsInPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKBiomeQuery biomeExclusiveStreamsFromEventStreams:](_DKBiomeQuery, "biomeExclusiveStreamsFromEventStreams:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "limit");
  v6 = objc_msgSend(v3, "offset");
  objc_msgSend(v3, "sortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "resultType");
  objc_msgSend(v3, "groupByProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "returnsDistinctResults");
  v11 = objc_msgSend(v3, "readMetadata");
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "excludedMetadataKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v17) = v11;
  LOBYTE(v17) = v10;
  v15 = -[_DKBiomeQuery initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:](self, "initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:", v19, v5, v18, v6, v7, v8, v9, v17, v14);

  return v15;
}

- (_DKBiomeQuery)initWithEventStreams:(id)a3 predicate:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 sortDescriptors:(id)a7 resultType:(int64_t)a8 groupByProperties:(id)a9 returnDistinctResults:(BOOL)a10 readMetadata:(BOOL)a11 excludedMetadataKeys:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  _DKBiomeQuery *v24;
  uint64_t v25;
  NSArray *eventStreamNames;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  BOOL v38;
  unint64_t v39;
  id v40;
  unint64_t v41;
  void *v42;
  char v43;
  NSPredicate *predicate;
  NSPredicate *v45;
  unint64_t v46;
  unint64_t v48;
  id v49;
  unint64_t v50;
  id v51;
  id v52;
  id v53;
  id obj;
  _DKBiomeQuery *v55;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  _QWORD v63[2];
  _QWORD v64[2];
  _BYTE v65[128];
  uint64_t v66;

  v17 = a12;
  v18 = a9;
  v66 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v21 = a7;
  v22 = a9;
  v57 = a12;
  if (!objc_msgSend(v19, "count"))
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[_DKBiomeQuery initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:].cold.1((uint64_t)v20, v23);

    v18 = a9;
  }
  v62.receiver = self;
  v62.super_class = (Class)_DKBiomeQuery;
  v24 = -[_DKBiomeQuery init](&v62, sel_init);
  if (v24)
  {
    obj = a7;
    objc_msgSend(v19, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.name"));
    v25 = objc_claimAutoreleasedReturnValue();
    eventStreamNames = v24->_eventStreamNames;
    v55 = v24;
    v24->_eventStreamNames = (NSArray *)v25;

    if (AnalyticsIsEventUsed())
    {
      v48 = a5;
      v49 = v22;
      v50 = a6;
      v51 = v18;
      v52 = v20;
      v53 = v19;
      _CDCurrentOrXPCProcessName();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      v29 = CFSTR("unknown");
      if (v27)
        v29 = (__CFString *)v27;
      v30 = v29;

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v31 = v55->_eventStreamNames;
      v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v59 != v34)
              objc_enumerationMutation(v31);
            v36 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
            v63[0] = CFSTR("client");
            v63[1] = CFSTR("stream");
            v64[0] = v30;
            v64[1] = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2, v48, v49, v50, v51, v52, v53);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            AnalyticsSendEvent();

          }
          v33 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
        }
        while (v33);
      }

      v20 = v52;
      v19 = v53;
      v17 = a12;
      a6 = v50;
      v18 = v51;
      a5 = v48;
      v22 = v49;
    }
    v38 = a10;
    if (!v20)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v39 = a5;
    v40 = v22;
    v41 = a6;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v20, "isEqual:", v42);

    a6 = v41;
    v22 = v40;
    a5 = v39;
    v38 = a10;
    v17 = a12;
    if ((v43 & 1) == 0)
    {
      v45 = (NSPredicate *)v20;
      v24 = v55;
      predicate = v55->_predicate;
      v55->_predicate = v45;
    }
    else
    {
LABEL_19:
      v24 = v55;
      predicate = v55->_predicate;
      v55->_predicate = 0;
    }

    if (a5 <= 0x7FFFFFFE)
      v46 = a5;
    else
      v46 = 0;
    v24->_limit = v46;
    v24->_offset = a6;
    objc_storeStrong((id *)&v24->_sortDescriptors, obj);
    v24->_resultType = a8;
    objc_storeStrong((id *)&v24->_groupByProperties, v18);
    v24->_returnDistinctResults = v38;
    v24->_readMetadata = a11;
    objc_storeStrong((id *)&v24->_excludedMetadataKeys, v17);
  }

  return v24;
}

+ (id)biomeExclusiveStreamsFromEventStreams:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55___DKBiomeQuery_biomeExclusiveStreamsFromEventStreams___block_invoke;
  v4[3] = &__block_descriptor_40_e24_B16__0___DKEventStream_8l;
  v4[4] = a1;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)shimDisabled
{
  return 0;
}

+ (id)duetExclusiveStreamsFromEventStreams:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54___DKBiomeQuery_duetExclusiveStreamsFromEventStreams___block_invoke;
  v4[3] = &__block_descriptor_40_e24_B16__0___DKEventStream_8l;
  v4[4] = a1;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)executeBiomeQueryError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[_DKBiomeQuery prepareQuery:](self, "prepareQuery:"))
    return 0;
  -[_DKBiomeQuery _publisherForQueryReturningIndividualResults:error:](self, "_publisherForQueryReturningIndividualResults:error:", 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__20;
    v15 = __Block_byref_object_dispose__20;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40___DKBiomeQuery_executeBiomeQueryError___block_invoke_462;
    v10[3] = &unk_1E26E64C0;
    v10[4] = &v11;
    v7 = (id)objc_msgSend(v5, "sinkWithCompletion:shouldContinue:", &__block_literal_global_461, v10);
    v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)canShimDuetStreamNamed:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (v3 && (objc_msgSend(&unk_1E272BF38, "containsObject:", v3) & 1) == 0)
    v4 = objc_msgSend(v3, "containsString:", CFSTR("knowledge-sync")) ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (_DKBiomeQuery)initWithDeletionPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _DKBiomeQuery *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;

  v4 = a3;
  +[_DKBiomePredicateScanner searchForKeys:inPredicate:](_DKBiomePredicateScanner, "searchForKeys:inPredicate:", &unk_1E272BF20, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKBiomeQuery eventStreamsFromPredicate:](_DKBiomeQuery, "eventStreamsFromPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    +[_DKBiomeQuery biomeExclusiveStreamsFromEventStreams:](_DKBiomeQuery, "biomeExclusiveStreamsFromEventStreams:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      LOBYTE(v12) = 0;
      BYTE1(v12) = v5 != 0;
      self = -[_DKBiomeQuery initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:](self, "initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:", v7, v4, 0, 0, 0, 0, 0, v12, 0);
      v6 = v7;
      v8 = self;
    }
    else
    {
      v8 = 0;
      v6 = v7;
    }
  }
  else
  {
    _CDCurrentOrXPCProcessName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[_DKBiomeQuery initWithDeletionPredicate:].cold.1((uint64_t)v9, v4);

    v8 = 0;
  }

  return v8;
}

- (BOOL)prepareQuery:(id *)a3
{
  NSPredicate *predicate;
  BOOL v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  NSArray *v12;
  NSArray *sortDescriptors;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *context;
  void *v41;
  NSArray *obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint64_t v48;
  void *v49;
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  predicate = self->_predicate;
  v47 = 0;
  v6 = +[_DKPredicateValidator validatePredicate:allowedKeys:error:](_DKPredicateValidator, "validatePredicate:allowedKeys:error:", predicate, 0, &v47);
  v7 = v47;
  v8 = v7;
  if (v7)
    v9 = 0;
  else
    v9 = v6;
  if (!a3 || v9)
  {
    if (self->_resultType == 6)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("endDate"), 0);
      v51[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      sortDescriptors = self->_sortDescriptors;
      self->_sortDescriptors = v12;

    }
    v41 = v8;
    -[NSPredicate allowEvaluation](self->_predicate, "allowEvaluation");
    if (+[_DKPredicateValidator validateSortDescriptors:](_DKPredicateValidator, "validateSortDescriptors:", self->_sortDescriptors))
    {
      context = (void *)MEMORY[0x193FEE914]();
      v14 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_sortDescriptors, "count"));
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      obj = self->_sortDescriptors;
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v44 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v19, "key");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            +[_DKEvent keyPathForMOKeyPath:]((uint64_t)_DKEvent, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21
              && (objc_msgSend(v19, "key"),
                  v22 = (void *)objc_claimAutoreleasedReturnValue(),
                  v23 = objc_msgSend(v21, "isEqual:", v22),
                  v22,
                  !v23))
            {
              objc_msgSend(v19, "comparator");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                v25 = (void *)MEMORY[0x1E0CB3928];
                v26 = objc_msgSend(v19, "ascending");
                objc_msgSend(v19, "comparator");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "sortDescriptorWithKey:ascending:comparator:", v21, v26, v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v29 = objc_msgSend(v19, "selector");
                v30 = (void *)MEMORY[0x1E0CB3928];
                v31 = objc_msgSend(v19, "ascending");
                if (v29)
                  objc_msgSend(v30, "sortDescriptorWithKey:ascending:selector:", v21, v31, objc_msgSend(v19, "selector"));
                else
                  objc_msgSend(v30, "sortDescriptorWithKey:ascending:", v21, v31);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
              }
              -[NSArray addObject:](v14, "addObject:", v28);
              objc_msgSend(v28, "allowEvaluation");

            }
            else
            {
              -[NSArray addObject:](v14, "addObject:", v19);
              objc_msgSend(v19, "allowEvaluation");
            }

          }
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        }
        while (v16);
      }

      v32 = self->_sortDescriptors;
      self->_sortDescriptors = v14;

      objc_autoreleasePoolPop(context);
      v10 = 1;
    }
    else
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0CB2D50];
      v34 = (void *)MEMORY[0x1E0CB3940];
      -[NSArray valueForKey:](self->_sortDescriptors, "valueForKey:", CFSTR("key"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("invalid sort descriptors %@"), v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("BMQueryErrorDomain"), 3, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3)
        *a3 = objc_retainAutorelease(v38);

      v10 = 0;
    }
    v8 = v41;
  }
  else
  {
    v10 = 0;
    *a3 = objc_retainAutorelease(v7);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedMetadataKeys, 0);
  objc_storeStrong((id *)&self->_groupByProperties, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_eventStreamNames, 0);
}

- (id)_publisherForQueryReturningIndividualResults:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[6];
  _QWORD v20[4];
  _QWORD v21[5];

  v4 = a3;
  if (-[_DKBiomeQuery prepareQuery:](self, "prepareQuery:", a4))
  {
    -[_DKBiomeQuery bmdkEventStreams](self, "bmdkEventStreams");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKBiomeQuery _publisherForStreams:](self, "_publisherForStreams:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSArray count](self->_sortDescriptors, "count"))
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v7, "reduceWithInitial:nextPartialResult:", v8, &__block_literal_global_448);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_2;
      v21[3] = &unk_1E26E6368;
      v21[4] = self;
      objc_msgSend(v9, "mapWithTransform:", v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v18[0] = v10;
        v18[1] = 3221225472;
        v18[2] = __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_6;
        v18[3] = &unk_1E26E6438;
        v18[4] = self;
        objc_msgSend(v7, "flatMapWithTransform:", v18);
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v16 = (void *)v11;

        v7 = v16;
        return v7;
      }
      if (!self->_resultType)
      {
        objc_msgSend(v7, "mapWithTransform:", &__block_literal_global_457);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else
    {
      if (!self->_resultType)
      {
        objc_msgSend(v7, "mapWithTransform:", &__block_literal_global_451_0);
        v12 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v12;
      }
      if (self->_offset || self->_limit - 1 <= 0x7FFFFFFD)
      {
        v20[0] = 0;
        v20[1] = v20;
        v20[2] = 0x2020000000;
        v20[3] = 0;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_4;
        v19[3] = &unk_1E26E63D0;
        v19[4] = self;
        v19[5] = v20;
        objc_msgSend(v7, "filterWithIsIncluded:", v19);
        v13 = objc_claimAutoreleasedReturnValue();

        _Block_object_dispose(v20, 8);
        v7 = (void *)v13;
      }
      if (!v4)
      {
        v14 = (void *)objc_opt_new();
        objc_msgSend(v7, "reduceWithInitial:nextPartialResult:", v14, &__block_literal_global_453);
        v15 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v15;
      }
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)bmdkEventStreams
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v13;
  NSArray *obj;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_eventStreamNames;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v23;
    *(_QWORD *)&v5 = 138412290;
    v13 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v7);
        -[objc_class streamNameFromDKStreamName:](getBMDKEventStreamClass(), "streamNameFromDKStreamName:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v17 = &v16;
        v18 = 0x3032000000;
        v19 = __Block_byref_object_copy__20;
        v20 = __Block_byref_object_dispose__20;
        -[_DKBiomeQuery _getCachedStreamForBiomeStreamIdentifier:](self, "_getCachedStreamForBiomeStreamIdentifier:", v9);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        if (v17[5]
          || (v15[0] = MEMORY[0x1E0C809B0],
              v15[1] = 3221225472,
              v15[2] = __33___DKBiomeQuery_bmdkEventStreams__block_invoke,
              v15[3] = &unk_1E26E6300,
              v15[4] = v8,
              v15[5] = &v16,
              -[_DKBiomeQuery _setBiomeStreamWithBlock:](self, "_setBiomeStreamWithBlock:", v15),
              v17[5]))
        {
          objc_msgSend(v3, "addObject:", v13);
        }
        else
        {
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v13;
            v27 = v8;
            _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_INFO, "[Storage][Biome] Skipping Biome stream for DK stream %@", buf, 0xCu);
          }

        }
        _Block_object_dispose(&v16, 8);

        ++v7;
      }
      while (v4 != v7);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      v4 = v11;
    }
    while (v11);
  }

  return v3;
}

- (id)_publisherForStreams:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int64_t resultType;
  NSArray *groupByProperties;
  NSArray *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  NSArray *sortDescriptors;
  _QWORD v44[5];
  _QWORD v45[4];
  id v46;
  _DKBiomeQuery *v47;
  _QWORD v48[5];
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    if (self->_offset
      || self->_limit - 1 > 0x7FFFFFFD
      || self->_predicate
      || -[NSArray count](self->_sortDescriptors, "count")
      && (-[NSArray count](self->_sortDescriptors, "count") != 1
       || (-[NSArray firstObject](self->_sortDescriptors, "firstObject"),
           v36 = (void *)objc_claimAutoreleasedReturnValue(),
           objc_msgSend(v36, "key"),
           v37 = (void *)objc_claimAutoreleasedReturnValue(),
           v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("creationDate")),
           v37,
           v36,
           !v38)))
    {
      v15 = 0;
      v16 = 0;
    }
    else
    {
      -[NSArray firstObject](self->_sortDescriptors, "firstObject");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39
        && (v40 = (void *)v39,
            -[NSArray firstObject](self->_sortDescriptors, "firstObject"),
            v41 = (void *)objc_claimAutoreleasedReturnValue(),
            v42 = objc_msgSend(v41, "ascending"),
            v41,
            v40,
            !v42))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_limit);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_limit);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
      }
      sortDescriptors = self->_sortDescriptors;
      self->_sortDescriptors = (NSArray *)MEMORY[0x1E0C9AA60];

      self->_limit = 0;
    }
    objc_msgSend(v4, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", 0, 0, v16, v15, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v51;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v51 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x193FEE914]();
          objc_msgSend(v11, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", 0, 0, 0, 0, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          objc_autoreleasePoolPop(v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v8);
    }

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02460]), "initWithPublishers:", v5);
  }
  v18 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __38___DKBiomeQuery__publisherForStreams___block_invoke;
  v49[3] = &unk_1E26E6160;
  v49[4] = self;
  objc_msgSend(v14, "mapWithTransform:", v49);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_predicate)
  {
    v48[0] = v18;
    v48[1] = 3221225472;
    v48[2] = __38___DKBiomeQuery__publisherForStreams___block_invoke_2;
    v48[3] = &unk_1E26E6188;
    v48[4] = self;
    objc_msgSend(v19, "filterWithIsIncluded:", v48);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  v21 = (void *)MEMORY[0x193FEE914]();
  resultType = self->_resultType;
  if ((unint64_t)(resultType - 3) >= 4)
  {
    if (resultType == 2)
    {
      objc_msgSend(v19, "mapWithTransform:", &__block_literal_global_423);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (resultType != 1)
      {
LABEL_34:
        objc_autoreleasePoolPop(v21);
        v28 = v19;
        goto LABEL_35;
      }
      objc_msgSend(v19, "reduceWithInitial:nextPartialResult:", &unk_1E272B0B0, &__block_literal_global_420);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v34 = (void *)v30;

    v19 = v34;
    goto LABEL_34;
  }
  groupByProperties = self->_groupByProperties;
  if (!groupByProperties)
    groupByProperties = (NSArray *)&unk_1E272BF50;
  v24 = groupByProperties;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v24);
  v26 = v25;
  if (self->_resultType == 6)
    objc_msgSend(v25, "addObject:", CFSTR("endDate"));
  v45[0] = v18;
  v45[1] = 3221225472;
  v45[2] = __38___DKBiomeQuery__publisherForStreams___block_invoke_3;
  v45[3] = &unk_1E26E6230;
  v27 = v26;
  v46 = v27;
  v47 = self;
  objc_msgSend(v19, "mapWithTransform:", v45);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_resultType == 5)
  {
    v29 = 0;
  }
  else
  {
    objc_msgSend(v28, "groupByKey:", &__block_literal_global_439);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v18;
    v44[1] = 3221225472;
    v44[2] = __38___DKBiomeQuery__publisherForStreams___block_invoke_5;
    v44[3] = &unk_1E26E6298;
    v44[4] = self;
    objc_msgSend(v29, "aggregateWithInitial:nextPartialResult:", MEMORY[0x1E0C9AA70], v44);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "flatMapWithTransform:", &__block_literal_global_444);
    v32 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v32;
  }

  objc_autoreleasePoolPop(v21);
  if (v29)
  {
    v33 = (void *)MEMORY[0x193FEE914]();
    objc_msgSend(v29, "connect");
    objc_autoreleasePoolPop(v33);

  }
LABEL_35:

  return v28;
}

- (id)_getCachedStreamForBiomeStreamIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[_DKBiomeStreamCache sharedCache](_DKBiomeStreamCache, "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)executeDeletionQuery:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  NSArray *obj;
  NSObject *v22;
  _DKBiomeQuery *v23;
  _QWORD v24[7];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  NSObject *v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!-[_DKBiomeQuery prepareQuery:](self, "prepareQuery:"))
    return 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = self->_eventStreamNames;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v4)
  {
    v22 = 0;
    v23 = self;
    v5 = *(_QWORD *)v31;
    v6 = *MEMORY[0x1E0CB2AC0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x193FEE914]();
        v26 = 0;
        v27 = &v26;
        v28 = 0x2020000000;
        v29 = 0;
        v10 = (void *)objc_msgSend(objc_alloc(getBMDKEventStreamClass()), "initWithDKStreamIdentifier:contentProtection:", v8, v6);
        v11 = v10;
        if (v10)
        {
          v25 = 0;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __38___DKBiomeQuery_executeDeletionQuery___block_invoke;
          v24[3] = &unk_1E26E64E8;
          v24[4] = v23;
          v24[5] = &v26;
          v24[6] = &v34;
          objc_msgSend(v10, "pruneEventsWithError:predicateBlock:", &v25, v24);
          v12 = v25;
          if (v12)
          {
            +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v39 = v8;
              v40 = 2112;
              v41 = v12;
              _os_log_error_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_ERROR, "[Storage][Biome] Error encountered during deletion for DK stream %@ error:%@", buf, 0x16u);
            }

            if (!v22)
              v22 = v12;
          }
          v35[3] += v27[3];
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v15 = v35[3];
            v16 = v27[3];
            *(_DWORD *)buf = 134218498;
            v39 = v15;
            v40 = 2048;
            v41 = v16;
            v42 = 2112;
            v43 = v8;
            _os_log_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_INFO, "[Storage][Biome] Deleted a total of %lu events with %lu events from Biome for DK stream %@", buf, 0x20u);
          }

        }
        else
        {
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v8;
            _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_INFO, "[Storage][Biome] Skipping Biome stream during deletion for DK stream %@", buf, 0xCu);
          }
        }

        _Block_object_dispose(&v26, 8);
        objc_autoreleasePoolPop(v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    }
    while (v4);

    if (a3)
    {
      v17 = v22;
      if (v22)
      {
        v17 = objc_retainAutorelease(v22);
        *a3 = v17;
      }
    }
    else
    {
      v17 = v22;
    }
  }
  else
  {

    v17 = 0;
  }
  v18 = v35[3];
  _Block_object_dispose(&v34, 8);

  return v18;
}

- (void)_setBiomeStreamWithBlock:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = v3;
      +[_DKBiomeStreamCache sharedCache](_DKBiomeStreamCache, "sharedCache");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v6, v5);

      v3 = v6;
    }

  }
}

- (_DKBiomeQuery)initWithDeletionArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _DKBiomeQuery *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;

  v4 = a3;
  +[_DKBiomeQuery eventStreamsFromArray:](_DKBiomeQuery, "eventStreamsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    +[_DKBiomeQuery biomeExclusiveStreamsFromEventStreams:](_DKBiomeQuery, "biomeExclusiveStreamsFromEventStreams:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      +[_DKBiomeQuery deletionPredicateFromArray:](_DKBiomeQuery, "deletionPredicateFromArray:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v12) = 0;
      self = -[_DKBiomeQuery initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:](self, "initWithEventStreams:predicate:limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:", v6, v7, objc_msgSend(v4, "count"), 0, 0, 0, 0, v12, 0);

      v5 = v6;
      v8 = self;
    }
    else
    {
      v8 = 0;
      v5 = v6;
    }
  }
  else
  {
    _CDCurrentOrXPCProcessName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[_DKBiomeQuery initWithDeletionArray:].cold.1((uint64_t)v9, v4);

    v8 = 0;
  }

  return v8;
}

+ (id)eventStreamsFromArray:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v18 = "[Storage][Biome] Unable to initialize Biome deletion query with nil array";
LABEL_24:
      _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, v18, buf, 2u);
    }
LABEL_25:
    v17 = 0;
    goto LABEL_26;
  }
  if (!objc_msgSend(v3, "count"))
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v18 = "[Storage][Biome] Unable to initialize Biome deletion query with empty array";
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v20 = v4;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          objc_msgSend(v13, "stream");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v13, "stream");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, v15);

          }
        }
        else
        {
          v9 = 1;
        }
      }
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);

    v4 = v20;
    if ((v9 & 1) == 0)
      goto LABEL_19;
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[_DKBiomeQuery eventStreamsFromArray:].cold.1(v6);
  }

LABEL_19:
  -[NSObject allValues](v5, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v17;
}

+ (id)deletionPredicateFromArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(v3, "valueForKey:", CFSTR("UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v8;
}

- (id)filterExcludedMetadataWithDKEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (!-[NSSet containsObject:](self->_excludedMetadataKeys, "containsObject:", v16, (_QWORD)v19))
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v16);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

      objc_msgSend(v4, "setMetadata:", v10);
    }
  }
  return v4;
}

- (id)publisherForQueryWithError:(id *)a3
{
  return -[_DKBiomeQuery _publisherForQueryReturningIndividualResults:error:](self, "_publisherForQueryReturningIndividualResults:error:", 1, a3);
}

- (void)initWithEventStreams:(uint64_t)a1 predicate:(NSObject *)a2 limit:offset:sortDescriptors:resultType:groupByProperties:returnDistinctResults:readMetadata:excludedMetadataKeys:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_FAULT, "[Storage][Biome] Unable to determine stream list, predicate %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithDeletionArray:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "valueForKey:", CFSTR("class"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_18(&dword_18DDBE000, v3, v4, "Deletion array does not specify any streams. Client: %@, Array: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)initWithDeletionPredicate:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "cd_sanitizeForLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_18(&dword_18DDBE000, v3, v4, "Deletion predicate does not specify any streams. Client: %@, Predicate: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

+ (void)eventStreamsFromArray:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "[Storage][Biome] Deletion array contains _DKObject entries all stream enumeration needed", v1, 2u);
}

@end
