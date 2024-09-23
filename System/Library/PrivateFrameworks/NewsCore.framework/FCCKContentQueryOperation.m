@implementation FCCKContentQueryOperation

id __57__FCCKContentQueryOperation__ckRecordsFromQueryResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = *(void **)(a2 + 24);
  else
    v3 = 0;
  v4 = v3;
  -[FCCKProtocolTranslator recordFromPRecord:](v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __45__FCCKContentQueryOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(_QWORD *)(v4 + 456);
  else
    v5 = 0;
  v9 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%lu"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("X-Apple-CloudKit-Request-Priority"));

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(_QWORD *)(v7 + 440);
  else
    v8 = 0;
  objc_msgSend(v9, "addEntriesFromDictionary:", v8);

}

- (BOOL)validateOperation
{
  char v3;
  CKQuery *v4;
  char v5;
  char v6;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self && self->_database)
  {
    v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't issue query without a database"));
      v11 = 136315906;
      v12 = "-[FCCKContentQueryOperation validateOperation]";
      v13 = 2080;
      v14 = "FCCKContentQueryOperation.m";
      v15 = 1024;
      v16 = 75;
      v17 = 2114;
      v18 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

    }
    v3 = 0;
    if (!self)
      goto LABEL_13;
  }
  v4 = self->_query;
  if (!v4)
  {
    if (self->_cursor)
      goto LABEL_10;
LABEL_13:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't issue query without a query or cursor"));
      v11 = 136315906;
      v12 = "-[FCCKContentQueryOperation validateOperation]";
      v13 = 2080;
      v14 = "FCCKContentQueryOperation.m";
      v15 = 1024;
      v16 = 79;
      v17 = 2114;
      v18 = v10;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

    }
    v5 = 0;
    if (!self)
      goto LABEL_16;
    goto LABEL_11;
  }

LABEL_10:
  v5 = 1;
LABEL_11:
  if (self->_networkEventType)
  {
    v6 = 1;
    return v3 & v6 & v5;
  }
LABEL_16:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't issue a query without a valid network event type"));
    v11 = 136315906;
    v12 = "-[FCCKContentQueryOperation validateOperation]";
    v13 = 2080;
    v14 = "FCCKContentQueryOperation.m";
    v15 = 1024;
    v16 = 83;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

  }
  v6 = 0;
  return v3 & v6 & v5;
}

- (void)prepareOperation
{
  FCEdgeCacheHint *v3;
  FCEdgeCacheHint *v4;
  void *v5;
  int v6;
  const char *v7;

  if (self)
  {
    v3 = self->_edgeCacheHint;
    if (v3)
    {
      v4 = v3;
      NewsCoreUserDefaults();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("disable_cloudkit_edge_caching"));

      if (v6)
        objc_setProperty_nonatomic_copy(self, v7, 0, 448);
    }
  }
}

- (void)setResultCursor:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 480), a2);
}

- (void)performOperation
{
  CKQueryCursor *v2;
  id v3;
  FCCKDirectRequestOperation *v4;
  FCCKContentDatabase *database;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  FCCKContentDatabase *v11;
  BOOL v12;
  const char *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _BYTE *v19;
  _BYTE *v20;
  void *v21;
  FCCKContentQueryOperation *v22;
  CKQueryCursor *cursor;
  CKQueryCursor *v24;
  void *v25;
  id v26;
  id recordFetchedBlock;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  FCCKContentDatabase *v33;
  CKQuery *query;
  CKQuery *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  unint64_t resultsLimit;
  uint64_t v52;
  int v53;
  void *v54;
  void *v55;
  const char *v56;
  FCCKDirectRequestOperation *v57;
  FCCKContentQueryOperation *v58;
  id networkActivityBlock;
  BOOL v60;
  SEL v61;
  const char *v62;
  const char *v63;
  BOOL ignoreCache;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  void *v69;
  void *v70;
  FCCKDirectRequestOperation *selfa;
  _QWORD newValue[5];
  id v74;
  _QWORD v75[5];
  _QWORD v76[5];
  _QWORD v77[5];
  _QWORD v78[5];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id *v84;
  id location[18];

  location[16] = *(id *)MEMORY[0x1E0C80C00];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __45__FCCKContentQueryOperation_performOperation__block_invoke;
  v78[3] = &unk_1E463AA78;
  v78[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionary:", v78);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    if (-[FCCKContentDatabase shouldUseCloudd](self->_database, "shouldUseCloudd"))
    {
      v2 = self->_cursor;
      v3 = objc_alloc(MEMORY[0x1E0C95038]);
      if (v2)
      {
        selfa = (FCCKDirectRequestOperation *)objc_msgSend(v3, "initWithCursor:", self->_cursor);

      }
      else
      {
        selfa = (FCCKDirectRequestOperation *)objc_msgSend(v3, "initWithQuery:", self->_query);
      }
      -[FCCKDirectRequestOperation setResultsLimit:](selfa, "setResultsLimit:", self->_resultsLimit);
      -[FCCKDirectRequestOperation setDesiredKeys:](selfa, "setDesiredKeys:", self->_desiredKeys);
      recordFetchedBlock = self->_recordFetchedBlock;
      goto LABEL_26;
    }
    v4 = [FCCKDirectRequestOperation alloc];
    database = self->_database;
  }
  else
  {
    if ((objc_msgSend(0, "shouldUseCloudd") & 1) != 0)
    {
      selfa = (FCCKDirectRequestOperation *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithQuery:", 0);
      -[FCCKDirectRequestOperation setResultsLimit:](selfa, "setResultsLimit:", 0);
      -[FCCKDirectRequestOperation setDesiredKeys:](selfa, "setDesiredKeys:", 0);
      recordFetchedBlock = 0;
LABEL_26:
      -[FCCKDirectRequestOperation setRecordFetchedBlock:](selfa, "setRecordFetchedBlock:", recordFetchedBlock);
      -[FCCKDirectRequestOperation configuration](selfa, "configuration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "copy");
      v30 = v29;
      if (v29)
        v31 = v29;
      else
        v31 = (id)objc_opt_new();
      v32 = v31;

      objc_msgSend(v32, "setAdditionalRequestHTTPHeaders:", v70);
      -[FCCKDirectRequestOperation setConfiguration:](selfa, "setConfiguration:", v32);
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __45__FCCKContentQueryOperation_performOperation__block_invoke_2;
      v77[3] = &unk_1E4648368;
      v77[4] = self;
      -[FCCKDirectRequestOperation setQueryCompletionBlock:](selfa, "setQueryCompletionBlock:", v77);
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __45__FCCKContentQueryOperation_performOperation__block_invoke_3;
      v76[3] = &unk_1E4643350;
      v76[4] = self;
      -[FCCKDirectRequestOperation setRequestCompletedBlock:](selfa, "setRequestCompletedBlock:", v76);
      -[FCOperation associateChildOperation:](self, "associateChildOperation:", selfa);
      if (self)
        v33 = self->_database;
      else
        v33 = 0;
      -[FCCKContentDatabase addOperation:](v33, "addOperation:", selfa);

      goto LABEL_69;
    }
    v4 = [FCCKDirectRequestOperation alloc];
    database = 0;
  }
  -[FCCKContentDatabase networkReachability](database, "networkReachability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  selfa = -[FCCKDirectRequestOperation initWithNetworkReachability:](v4, "initWithNetworkReachability:", v6);

  if (selfa)
    selfa->_requestType = 2;
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __45__FCCKContentQueryOperation_performOperation__block_invoke_5;
  v75[3] = &unk_1E4648390;
  v75[4] = self;
  __45__FCCKContentQueryOperation_performOperation__block_invoke_5((uint64_t)v75);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (selfa)
    objc_setProperty_nonatomic_copy(selfa, v7, v8, 392);

  if (self)
  {
    -[FCCKContentDatabase containerIdentifier](self->_database, "containerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (selfa)
      objc_setProperty_nonatomic_copy(selfa, v9, v10, 400);

    v11 = self->_database;
  }
  else
  {
    objc_msgSend(0, "containerIdentifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (selfa)
      objc_setProperty_nonatomic_copy(selfa, v67, v68, 400);

    v11 = 0;
  }
  v12 = -[FCCKContentDatabase isProductionEnvironment](v11, "isProductionEnvironment");
  if (selfa)
    selfa->_production = v12;
  if (!self)
  {
    v54 = 0;
    goto LABEL_55;
  }
  v14 = (id *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  -[FCCKPRequestOperation setRequest:]((uint64_t)v14, v15);

  CKCreateGUID();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    v18 = v14[4];
    -[FCCKPOperation setOperationUUID:]((uint64_t)v18, v17);

    v19 = v14[4];
    if (v19)
    {
      v19[24] |= 1u;
      *((_DWORD *)v19 + 4) = 220;
    }

    v20 = v14[4];
    if (v20)
    {
      v20[24] |= 2u;
      v20[20] = 1;
    }
  }
  else
  {

    v20 = 0;
  }

  v21 = (void *)objc_opt_new();
  -[FCCKPRequestOperation setQueryRetrieveRequest:]((uint64_t)v14, v21);

  v22 = self;
  cursor = self->_cursor;
  if (cursor)
  {
    v24 = cursor;
    -[CKQueryCursor data](v24, "data");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPRequestOperation queryRetrieveRequest](v14);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    -[FCCKPQueryRetrieveRequest setContinuationMarker:]((uint64_t)v26, v25);
LABEL_34:

    v22 = self;
    goto LABEL_35;
  }
  if (self->_query)
  {
    +[FCCKProtocolTranslator sharedInstance]();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    query = self->_query;
    v83 = 0;
    v35 = query;
    -[FCCKProtocolTranslator pQueryFromQuery:error:]((uint64_t)v25, v35, &v83);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v83;
    -[FCCKPRequestOperation queryRetrieveRequest](v14);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCCKPQueryRetrieveRequest setQuery:]((uint64_t)v37, v36);
    goto LABEL_34;
  }
LABEL_35:
  if (v22->_desiredKeys)
  {
    v38 = (void *)objc_opt_new();
    -[FCCKPRequestOperation queryRetrieveRequest](v14);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryRetrieveRequest setRequestedFields:]((uint64_t)v39, v38);

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v40 = self->_desiredKeys;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v79, location, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v80;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v80 != v42)
            objc_enumerationMutation(v40);
          v44 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v43);
          v45 = (void *)objc_opt_new();
          objc_msgSend(v45, "setName:", v44);
          -[FCCKPRequestOperation queryRetrieveRequest](v14);
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = (void *)v46;
          if (v46)
            v48 = *(void **)(v46 + 32);
          else
            v48 = 0;
          v49 = v48;
          -[FCCKPRequestedFields addFields:]((uint64_t)v49, v45);

          ++v43;
        }
        while (v41 != v43);
        v50 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v79, location, 16);
        v41 = v50;
      }
      while (v50);
    }

    v22 = self;
  }
  resultsLimit = v22->_resultsLimit;
  if (resultsLimit)
  {
    -[FCCKPRequestOperation queryRetrieveRequest](v14);
    v52 = objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      v53 = -1;
      if (resultsLimit < 0xFFFFFFFF)
        v53 = resultsLimit;
      *(_BYTE *)(v52 + 48) |= 1u;
      *(_DWORD *)(v52 + 16) = v53;
    }

  }
  v84 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_55:
  if (selfa)
    objc_setProperty_nonatomic_copy(selfa, v13, v54, 384);

  if (self)
  {
    -[FCCKContentDatabase networkBehaviorMonitor](self->_database, "networkBehaviorMonitor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKDirectRequestOperation setNetworkBehaviorMonitor:]((uint64_t)selfa, v55);

    if (selfa)
    {
      v57 = selfa;
      v58 = self;
      selfa->_networkEventType = self->_networkEventType;
      networkActivityBlock = self->_networkActivityBlock;
LABEL_60:
      v60 = v58 == 0;
      objc_setProperty_nonatomic_copy(v57, v56, networkActivityBlock, 472);
      objc_setProperty_nonatomic_copy(selfa, v61, v70, 416);
      if (v60)
      {
        objc_setProperty_nonatomic_copy(selfa, v62, 0, 432);
        ignoreCache = 0;
      }
      else
      {
        objc_setProperty_nonatomic_copy(selfa, v62, self->_edgeCacheHint, 432);
        ignoreCache = self->_ignoreCache;
      }
      selfa->_ignoreCache = ignoreCache;
      objc_setProperty_nonatomic_copy(selfa, v63, &__block_literal_global_25_3, 440);
    }
  }
  else
  {
    objc_msgSend(0, "networkBehaviorMonitor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKDirectRequestOperation setNetworkBehaviorMonitor:]((uint64_t)selfa, v69);

    if (selfa)
    {
      networkActivityBlock = 0;
      v57 = selfa;
      v58 = 0;
      selfa->_networkEventType = 0;
      goto LABEL_60;
    }
  }
  objc_initWeak(location, selfa);
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __45__FCCKContentQueryOperation_performOperation__block_invoke_2_26;
  newValue[3] = &unk_1E46483B8;
  newValue[4] = self;
  objc_copyWeak(&v74, location);
  if (selfa)
    objc_setProperty_nonatomic_copy(selfa, v65, newValue, 448);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", selfa);
  if (-[FCOperation relativePriority](self, "relativePriority") < 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_throttledCKRequestOperationQueue");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addOperation:", selfa);

  }
  else
  {
    -[FCOperation start](selfa, "start");
  }
  objc_destroyWeak(&v74);
  objc_destroyWeak(location);
LABEL_69:

}

id __45__FCCKContentQueryOperation_performOperation__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 384);
  else
    v3 = 0;
  objc_msgSend(v3, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("MultiFetch"));

  v6 = *(_QWORD *)(a1 + 32);
  if (!v5)
  {
    if (v6)
      v12 = *(void **)(v6 + 384);
    else
      v12 = 0;
    objc_msgSend(v12, "recordType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("OrderFeed"));

    if (v14)
    {
      v15 = *(_QWORD *)(a1 + 32);
      if (!v15)
        goto LABEL_33;
      v16 = *(id *)(v15 + 448);
      v17 = *(_QWORD *)(a1 + 32);
      if (v16)
      {
        v9 = v16;
        if (v17)
          v18 = *(void **)(v17 + 376);
        else
          v18 = 0;
        objc_msgSend(v18, "baseURLForEdgeCachedOrderFeed");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      if (v17)
        v22 = *(void **)(v17 + 376);
      else
LABEL_33:
        v22 = 0;
      objc_msgSend(v22, "baseURLForOrderFeed");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported query type, falling back to hardcoded base URL"));
        v25 = 136315906;
        v26 = "-[FCCKContentQueryOperation performOperation]_block_invoke_5";
        v27 = 2080;
        v28 = "FCCKContentQueryOperation.m";
        v29 = 1024;
        v30 = 135;
        v31 = 2114;
        v32 = v24;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v25, 0x26u);

      }
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://gateway.icloud.com:443/ckdatabase"));
      v20 = objc_claimAutoreleasedReturnValue();
    }
LABEL_27:
    v19 = (void *)v20;
    return v19;
  }
  if (!v6)
    goto LABEL_31;
  v7 = *(id *)(v6 + 448);
  v8 = *(_QWORD *)(a1 + 32);
  if (!v7)
  {
    if (v8)
    {
      v21 = *(void **)(v8 + 376);
LABEL_23:
      objc_msgSend(v21, "baseURLForMultiFetch");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_31:
    v21 = 0;
    goto LABEL_23;
  }
  v9 = v7;
  if (v8)
    v10 = *(void **)(v8 + 376);
  else
    v10 = 0;
  objc_msgSend(v10, "baseURLForEdgeCachedMultiFetch");
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v19 = (void *)v11;

  return v19;
}

- (id)throttleGroup
{
  FCCKContentQueryOperation *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  if (self)
    self = (FCCKContentQueryOperation *)self->_database;
  -[FCCKContentQueryOperation containerIdentifier](self, "containerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FCOperation relativePriority](v2, "relativePriority") == -1 && (!v2 || !v2->_edgeCacheHint))
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("-lowpriority"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (void)operationWillFinishWithError:(id)a3
{
  FCCKContentDatabase *database;
  id v5;
  id v6;
  uint64_t v7;
  CKQueryCursor *resultCursor;
  id v9;

  if (self)
    database = self->_database;
  else
    database = 0;
  v5 = a3;
  -[FCCKContentDatabase maximumRetryAfterForCK](database, "maximumRetryAfterForCK");
  objc_msgSend(v5, "fc_errorWithMaximumRetryAfter:");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    v6 = self->_queryCompletionBlock;
    v7 = (uint64_t)v6 + 16;
    resultCursor = self->_resultCursor;
  }
  else
  {
    v6 = 0;
    resultCursor = 0;
    v7 = 16;
  }
  (*(void (**)(id, CKQueryCursor *, id))v7)(v6, resultCursor, v9);

}

- (void)setQuery:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 384), a2);
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 376), a2);
}

- (FCCKContentQueryOperation)init
{
  FCCKContentQueryOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCCKContentQueryOperation;
  result = -[FCOperation init](&v3, sel_init);
  if (result)
  {
    result->_networkEventType = 0;
    result->_queryPriority = 200;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCursor, 0);
  objc_storeStrong(&self->_networkActivityBlock, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_requestUUIDs, 0);
  objc_storeStrong(&self->_queryCompletionBlock, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __45__FCCKContentQueryOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  -[FCCKContentQueryOperation setResultCursor:](v5, a2);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);

}

void __45__FCCKContentQueryOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  const char *v11;
  void *v12;
  char v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "requestUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6 && (v7 = *(id *)(v6 + 432)) != 0)
    {
      v8 = v7;
      v9 = *(_QWORD **)(a1 + 32);
      if (v9)
        v9 = (_QWORD *)v9[54];
      v10 = v9;
      objc_msgSend(v10, "arrayByAddingObject:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
    }
    else
    {
      v15[0] = v5;
      v13 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v12 = v10;
    }
    v14 = *(void **)(a1 + 32);
    if (v14)
      objc_setProperty_nonatomic_copy(v14, v11, v12, 432);
    if ((v13 & 1) == 0)

  }
}

uint64_t __45__FCCKContentQueryOperation_performOperation__block_invoke_23()
{
  return 1;
}

void __45__FCCKContentQueryOperation_performOperation__block_invoke_2_26(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_class *v27;
  _QWORD *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id WeakRetained;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  const char *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  const char *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  id v60;
  uint8_t v61[128];
  _BYTE buf[24];
  __int128 v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    -[FCCKPResponseOperation queryRetrieveResponse](v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(_QWORD *)(a1 + 32);
    if (!v13)
      goto LABEL_42;
    if (!*(_QWORD *)(v13 + 416))
      goto LABEL_19;
    v14 = v12;
    +[FCCKProtocolTranslator sharedInstance]();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v16 = (void *)v14[2];
    else
      v16 = 0;
    v17 = v16;

    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __57__FCCKContentQueryOperation__ckRecordsFromQueryResponse___block_invoke;
    *(_QWORD *)&v63 = &unk_1E46483E0;
    *((_QWORD *)&v63 + 1) = v15;
    v18 = v15;
    objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v56;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v56 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(a1 + 32);
          if (v24)
            v25 = *(_QWORD *)(v24 + 416);
          else
            v25 = 0;
          (*(void (**)(uint64_t, _QWORD))(v25 + 16))(v25, *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v23++));
        }
        while (v21 != v23);
        v26 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        v21 = v26;
      }
      while (v26);
    }

    if (*(_QWORD *)(a1 + 32))
    {
LABEL_19:
      v27 = (objc_class *)MEMORY[0x1E0C95020];
      v28 = v12;
      v29 = [v27 alloc];
      if (v28)
        v30 = (void *)v28[1];
      else
        v30 = 0;
      v31 = v30;

      v32 = objc_alloc(MEMORY[0x1E0C95098]);
      v33 = (void *)objc_msgSend(v32, "initWithZoneName:ownerName:", *MEMORY[0x1E0C94A30], *MEMORY[0x1E0C94730]);
      v10 = (void *)objc_msgSend(v29, "initWithData:zoneID:", v31, v33);

    }
    else
    {
LABEL_42:
      v10 = 0;
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v35 = WeakRetained;
  if (WeakRetained)
    v36 = (void *)*((_QWORD *)WeakRetained + 58);
  else
    v36 = 0;
  v37 = v36;

  if (v37)
  {
    v38 = objc_loadWeakRetained((id *)(a1 + 40));
    v39 = v38;
    if (v38)
      v40 = (void *)*((_QWORD *)v38 + 58);
    else
      v40 = 0;
    v41 = v40;
    v60 = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *(void **)(a1 + 32);
    if (v44)
      objc_setProperty_nonatomic_copy(v44, v42, v43, 464);

  }
  -[FCCKContentQueryOperation setResultCursor:](*(_QWORD *)(a1 + 32), v10);
  v45 = objc_loadWeakRetained((id *)(a1 + 40));
  v46 = v45;
  if (v45)
    v47 = (void *)*((_QWORD *)v45 + 57);
  else
    v47 = 0;
  v48 = v47;
  v59 = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = *(void **)(a1 + 32);
  if (v51)
    objc_setProperty_nonatomic_copy(v51, v49, v50, 432);

  objc_msgSend(v9, "domain");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0C94878]);

  if (v53 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't return errors from the internal domain"));
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCCKContentQueryOperation performOperation]_block_invoke_2";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCCKContentQueryOperation.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v63) = 183;
    WORD2(v63) = 2114;
    *(_QWORD *)((char *)&v63 + 6) = v54;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v9);

}

- (void)setCursor:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 392), a2);
}

@end
