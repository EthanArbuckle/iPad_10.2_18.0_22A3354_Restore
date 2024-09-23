@implementation FCCKOrderFeedQueryOperation

- (BOOL)validateOperation
{
  FCCKOrderFeedQueryOperation *v2;
  NSArray *feedRequests;
  FCCKContentDatabase *v4;
  FCCKContentDatabase *v5;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v2 = self;
  v17 = *MEMORY[0x1E0C80C00];
  if (self && self->_database)
    goto LABEL_5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed query must have a database"));
    v9 = 136315906;
    v10 = "-[FCCKOrderFeedQueryOperation validateOperation]";
    v11 = 2080;
    v12 = "FCCKOrderFeedQueryOperation.m";
    v13 = 1024;
    v14 = 84;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (v2)
      goto LABEL_5;
LABEL_14:
    feedRequests = 0;
    goto LABEL_6;
  }
  if (!v2)
    goto LABEL_14;
LABEL_5:
  feedRequests = v2->_feedRequests;
LABEL_6:
  if (!-[NSArray count](feedRequests, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed query must have at least one feed request"));
    v9 = 136315906;
    v10 = "-[FCCKOrderFeedQueryOperation validateOperation]";
    v11 = 2080;
    v12 = "FCCKOrderFeedQueryOperation.m";
    v13 = 1024;
    v14 = 85;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (!v2)
      return (char)v2;
  }
  else if (!v2)
  {
    return (char)v2;
  }
  v4 = v2->_database;
  if (v4)
  {
    v5 = v4;
    LOBYTE(v2) = -[NSArray count](v2->_feedRequests, "count") != 0;

  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (void)prepareOperation
{
  FCCKOrderFeedQueryOperation *v2;
  NSArray *feedRequests;
  NSArray *v4;
  const char *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  const char *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v2 = self;
  v22 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (FCCKOrderFeedQueryOperation *)self->_feedRequests;
  if ((unint64_t)-[FCCKOrderFeedQueryOperation count](self, "count") >= 0x191
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("exceeded maximum number of feed requests"));
    v14 = 136315906;
    v15 = "-[FCCKOrderFeedQueryOperation prepareOperation]";
    v16 = 2080;
    v17 = "FCCKOrderFeedQueryOperation.m";
    v18 = 1024;
    v19 = 93;
    v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

    if (v2)
      goto LABEL_6;
LABEL_19:
    feedRequests = 0;
    goto LABEL_7;
  }
  if (!v2)
    goto LABEL_19;
LABEL_6:
  feedRequests = v2->_feedRequests;
  if (-[NSArray count](feedRequests, "count") < 0x191)
    goto LABEL_13;
LABEL_7:
  if (v2)
    v4 = v2->_feedRequests;
  else
    v4 = 0;
  -[NSArray fc_subarrayWithMaxCount:](v4, "fc_subarrayWithMaxCount:", 400);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_setProperty_nonatomic_copy(v2, v5, v6, 376);

  v7 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    v12 = v7;
    -[FCOperation shortOperationDescription](v2, "shortOperationDescription");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v13;
    _os_log_error_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_ERROR, "%{public}@ dropping feeds because the limit was exeeded", (uint8_t *)&v14, 0xCu);

    if (v2)
      goto LABEL_14;
  }
  else
  {
LABEL_13:
    if (v2)
    {
LABEL_14:
      v8 = v2->_feedRequests;
      goto LABEL_15;
    }
  }
  v8 = 0;
LABEL_15:
  -[NSArray sortedArrayUsingComparator:](v8, "sortedArrayUsingComparator:", &__block_literal_global_75);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_setProperty_nonatomic_copy(v2, v9, v10, 376);

}

uint64_t __47__FCCKOrderFeedQueryOperation_prepareOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t *v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  if (!a2)
  {
    v6 = 0;
    if (v4)
      goto LABEL_3;
LABEL_6:
    v7 = 0;
    goto LABEL_4;
  }
  v6 = *(void **)(a2 + 8);
  if (!v4)
    goto LABEL_6;
LABEL_3:
  v7 = v4[1];
LABEL_4:
  v8 = v6;
  v9 = objc_msgSend(v8, "caseInsensitiveCompare:", v7);

  return v9;
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 368), a2);
}

- (void)performOperation
{
  FCCKOrderFeedQueryOperation *v2;
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSArray *v8;
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
  uint64_t (*v23)(uint64_t, uint64_t);
  NSArray *v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  FCCKContentQueryOperation *v31;
  uint64_t v32;
  const char *v33;
  BOOL v34;
  SEL v35;
  NSArray *v36;
  id v37;
  void *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  NSArray *feedRequests;
  uint64_t v47;
  void *v48;
  unint64_t resultsLimit;
  const char *v50;
  SEL v51;
  _QWORD v52[9];
  id v53;
  id location;
  _QWORD newValue[8];
  _QWORD v56[5];
  id v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[5];
  id v61;
  _BYTE buf[24];
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;

  v2 = self;
  v66 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (FCCKOrderFeedQueryOperation *)self->_feedRequests;
  v3 = -[FCCKOrderFeedQueryOperation count](self, "count");
  v4 = (id)FCOperationLog;
  v5 = v4;
  if (v3 > 2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      -[FCOperation shortOperationDescription](v2, "shortOperationDescription");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)v44;
      if (v2)
        feedRequests = v2->_feedRequests;
      else
        feedRequests = 0;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = feedRequests;
      _os_log_debug_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ started with feed requests: %@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](v2, "shortOperationDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v2)
      v8 = v2->_feedRequests;
    else
      v8 = 0;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ started with feed requests: %@", buf, 0x16u);

  }
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)v2, CFSTR("tagID"), CFSTR("feedID"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    -[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)v2, CFSTR("maxOrder"), CFSTR("maxOrder"), &unk_1E470AA30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

    -[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)v2, CFSTR("minOrder"), CFSTR("minOrder"), &unk_1E470AA48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2->_resultsLimit);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)v2, CFSTR("hardLimit"), CFSTR("resultsLimit"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);

    -[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)v2, CFSTR("topK"), CFSTR("topK"), &unk_1E470AA60);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v15);

    v16 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2->_queryPriority);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("priority"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v18);

    if (-[NSArray count](v2->_articleLinkKeys, "count"))
    {
      v19 = (void *)MEMORY[0x1E0CB3880];
      -[NSArray sortedArrayUsingSelector:](v2->_articleLinkKeys, "sortedArrayUsingSelector:", sel_compare_);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("fetchFields"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v21);

    }
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("OrderFeed"), v22);

    v24 = v2->_feedRequests;
  }
  else
  {
    v23 = 0;
    v24 = 0;
  }
  v25 = -[NSArray count](v24, "count");
  v26 = (id)FCOperationLog;
  v27 = v26;
  if (v25 > 2)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      -[FCOperation shortOperationDescription](v2, "shortOperationDescription");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v47;
      if (v2)
        resultsLimit = v2->_resultsLimit;
      else
        resultsLimit = 0;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = resultsLimit;
      *(_WORD *)&buf[22] = 2112;
      v63 = v23;
      _os_log_debug_impl(&dword_1A1B90000, v27, OS_LOG_TYPE_DEBUG, "%{public}@ issuing query with results limit %lu: %@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](v2, "shortOperationDescription");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v2)
      v30 = v2->_resultsLimit;
    else
      v30 = 0;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v28;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v30;
    *(_WORD *)&buf[22] = 2112;
    v63 = v23;
    _os_log_impl(&dword_1A1B90000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ issuing query with results limit %lu: %@", buf, 0x20u);

  }
  v31 = objc_alloc_init(FCCKContentQueryOperation);
  v32 = (uint64_t)v31;
  if (v2)
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v31, v2->_database);
    -[FCCKContentQueryOperation setQuery:](v32, v23);
    v34 = v32 == 0;
    if (v32)
    {
      *(_QWORD *)(v32 + 400) = v2->_resultsLimit;
      *(_DWORD *)(v32 + 372) = 10;
      objc_setProperty_nonatomic_copy((id)v32, v33, v2->_additionalRequestHTTPHeaders, 440);
      objc_setProperty_nonatomic_copy((id)v32, v35, v2->_edgeCacheHint, 448);
      *(_QWORD *)(v32 + 456) = v2->_queryPriority;
    }
    v36 = v2->_desiredKeys;
    if (qword_1ED0F7B20 != -1)
      dispatch_once(&qword_1ED0F7B20, &__block_literal_global_51_1);
    v37 = (id)_MergedGlobals_32;
  }
  else
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v31, 0);
    -[FCCKContentQueryOperation setQuery:](v32, v23);
    v34 = v32 == 0;
    if (v32)
    {
      *(_QWORD *)(v32 + 400) = 0;
      *(_DWORD *)(v32 + 372) = 10;
      objc_setProperty_nonatomic_copy((id)v32, v50, 0, 440);
      objc_setProperty_nonatomic_copy((id)v32, v51, 0, 448);
      *(_QWORD *)(v32 + 456) = 0;
    }
    v36 = 0;
    v37 = 0;
  }
  -[NSArray arrayByAddingObjectsFromArray:](v36, "arrayByAddingObjectsFromArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sortedArrayUsingSelector:", sel_compare_);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
    objc_setProperty_nonatomic_copy((id)v32, v40, v39, 408);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v63 = __Block_byref_object_copy__34;
  v64 = __Block_byref_object_dispose__34;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (id)objc_claimAutoreleasedReturnValue();
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__34;
  v60[4] = __Block_byref_object_dispose__34;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v61 = (id)objc_claimAutoreleasedReturnValue();
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__34;
  v58[4] = __Block_byref_object_dispose__34;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v59 = (id)objc_claimAutoreleasedReturnValue();
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__34;
  v56[4] = __Block_byref_object_dispose__34;
  v57 = 0;
  v42 = MEMORY[0x1E0C809B0];
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __47__FCCKOrderFeedQueryOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E463F200;
  newValue[4] = v56;
  newValue[5] = v60;
  newValue[6] = v58;
  newValue[7] = buf;
  if (!v34)
    objc_setProperty_nonatomic_copy((id)v32, v41, newValue, 416);
  objc_initWeak(&location, (id)v32);
  v52[0] = v42;
  v52[1] = 3221225472;
  v52[2] = __47__FCCKOrderFeedQueryOperation_performOperation__block_invoke_2;
  v52[3] = &unk_1E46443E8;
  objc_copyWeak(&v53, &location);
  v52[4] = v2;
  v52[5] = buf;
  v52[6] = v60;
  v52[7] = v56;
  v52[8] = v58;
  if (!v34)
    objc_setProperty_nonatomic_copy((id)v32, v43, v52, 424);
  -[FCOperation associateChildOperation:](v2, "associateChildOperation:", v32);
  objc_msgSend((id)v32, "start");
  objc_destroyWeak(&v53);
  objc_destroyWeak(&location);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);

  _Block_object_dispose(buf, 8);
}

- (id)_predicateForPerFeedFieldName:(void *)a3 key:(void *)a4 defaultValue:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v23 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = *(id *)(a1 + 376);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    v14 = MEMORY[0x1E0C81028];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "valueForKey:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = v9;
          v18 = v16;
LABEL_10:
          objc_msgSend(v17, "addObject:", v18);
          goto LABEL_11;
        }
        if (v8)
        {
          v17 = v9;
          v18 = v8;
          goto LABEL_10;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "defaultValue");
          *(_DWORD *)buf = 136315906;
          v29 = "-[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]";
          v30 = 2080;
          v31 = "FCCKOrderFeedQueryOperation.m";
          v32 = 1024;
          v33 = 252;
          v34 = 2114;
          v35 = v19;
          _os_log_error_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
LABEL_11:

        ++v15;
      }
      while (v12 != v15);
      v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      v12 = v20;
    }
    while (v20);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v9, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __44__FCCKOrderFeedQueryOperation__requiredKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("reachedMinOrder"), CFSTR("reachedEnd"), CFSTR("feedDropped"), CFSTR("droppedFeeds"), CFSTR("droppedItems"), CFSTR("nextOrder"), CFSTR("articleID"), CFSTR("tagID"), CFSTR("order"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_32;
  _MergedGlobals_32 = v0;

}

void __47__FCCKOrderFeedQueryOperation_performOperation__block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Results"));

  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  }
  else
  {
    objc_msgSend(v14, "recordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Tag"));

    if (v7)
    {
      v8 = a1[5];
    }
    else
    {
      objc_msgSend(v14, "recordType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Issue"));

      if (!v10)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v14);
        goto LABEL_9;
      }
      v8 = a1[6];
    }
    v11 = *(void **)(*(_QWORD *)(v8 + 8) + 40);
    objc_msgSend(v14, "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v14, v13);

  }
LABEL_9:

}

void __47__FCCKOrderFeedQueryOperation_performOperation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  char *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t i;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  _QWORD *v63;
  FCCKOrderFeedResponse *v64;
  void *v65;
  const char *v66;
  id v67;
  void *v68;
  id v69;
  const char *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  char v75;
  void *v76;
  id v77;
  void *v78;
  char v79;
  void *v80;
  id v81;
  void *v82;
  char v83;
  NSArray *feedItemAndArticleRecords;
  NSArray *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  char *v90;
  char *feedID;
  void *v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  NSArray *v97;
  NSArray *v98;
  uint64_t v99;
  NSArray *v100;
  NSArray *v101;
  unint64_t extent;
  unint64_t v103;
  NSObject *v104;
  uint64_t v105;
  unint64_t v106;
  void *v107;
  NSArray *v108;
  NSArray *v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  NSObject *v114;
  NSObject *v115;
  char *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  _QWORD *v121;
  uint64_t v122;
  id v123;
  id v124;
  id v125;
  uint64_t v126;
  id v127;
  id v128;
  id v129;
  id v130;
  void *v131;
  void *v132;
  id v133;
  id *v134;
  void *v135;
  id v136;
  id obj;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  uint64_t v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  uint8_t v152[4];
  const char *v153;
  __int16 v154;
  char *v155;
  __int16 v156;
  int v157;
  __int16 v158;
  void *v159;
  uint8_t v160[4];
  const char *v161;
  __int16 v162;
  char *v163;
  __int16 v164;
  int v165;
  __int16 v166;
  void *v167;
  uint8_t buf[4];
  const char *v169;
  __int16 v170;
  char *v171;
  __int16 v172;
  _BYTE v173[18];
  uint64_t v174;

  v174 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v6 = WeakRetained;
  if (WeakRetained)
    v7 = (void *)*((_QWORD *)WeakRetained + 54);
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained((id *)(a1 + 72));
  v11 = v10;
  if (v10)
    v12 = (void *)*((_QWORD *)v10 + 58);
  else
    v12 = 0;
  v14 = v12;
  v15 = *(void **)(a1 + 32);
  if (v15)
    objc_setProperty_nonatomic_copy(v15, v13, v14, 432);

  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    v17 = *(void **)(v16 + 376);
  else
    v17 = 0;
  v18 = objc_msgSend(v17, "count");
  v19 = (void *)FCOperationLog;
  if (v18 <= 2)
  {
    if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v20 = *(void **)(a1 + 32);
    v21 = v19;
    objc_msgSend(v20, "shortOperationDescription");
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v24 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "values");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v169 = v22;
    v170 = 2048;
    v171 = (char *)v23;
    v172 = 2048;
    *(_QWORD *)v173 = v24;
    *(_WORD *)&v173[8] = 2112;
    *(_QWORD *)&v173[10] = v25;
    _os_log_impl(&dword_1A1B90000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ received response with %lu FeedItemAndArticleRecords, %lu TagRecords and Results record: %@", buf, 0x2Au);
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEBUG))
  {
    v117 = *(void **)(a1 + 32);
    v21 = v19;
    objc_msgSend(v117, "shortOperationDescription");
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v119 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "values");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v169 = v22;
    v170 = 2048;
    v171 = (char *)v118;
    v172 = 2048;
    *(_QWORD *)v173 = v119;
    *(_WORD *)&v173[8] = 2112;
    *(_QWORD *)&v173[10] = v25;
    _os_log_debug_impl(&dword_1A1B90000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ received response with %lu FeedItemAndArticleRecords, %lu TagRecords and Results record: %@", buf, 0x2Au);
LABEL_12:

  }
LABEL_14:
  if (v4)
  {
    FCErrorForCKError(v4);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    -[FCCKOrderFeedQueryOperation setResultError:](*(_QWORD *)(a1 + 32), v26);
    goto LABEL_135;
  }
  v132 = v9;
  v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v27)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must always have a Results record"));
      *(_DWORD *)buf = 136315906;
      v169 = "-[FCCKOrderFeedQueryOperation performOperation]_block_invoke";
      v170 = 2080;
      v171 = "FCCKOrderFeedQueryOperation.m";
      v172 = 1024;
      *(_DWORD *)v173 = 164;
      *(_WORD *)&v173[4] = 2114;
      *(_QWORD *)&v173[6] = v120;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    else
    {
      v27 = 0;
    }
  }
  v28 = *(id **)(a1 + 32);
  v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "allValues");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "allValues");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v27;
  v127 = v29;
  v33 = v29;
  v129 = v30;
  v26 = v30;
  v128 = v31;
  v130 = v31;
  v9 = v132;
  v133 = v132;
  v134 = v28;
  if (v28)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("droppedFeeds"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v131, "unsignedIntegerValue"))
    {
      v34 = (id)FCOperationLog;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v28, "shortOperationDescription");
        v35 = v33;
        v36 = (char *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v131, "unsignedIntegerValue");
        v38 = v134[47];
        v39 = objc_msgSend(v38, "count");
        *(_DWORD *)buf = 138543874;
        v169 = v36;
        v170 = 2048;
        v171 = (char *)v37;
        v172 = 2048;
        *(_QWORD *)v173 = v39;
        _os_log_impl(&dword_1A1B90000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ %lu of %lu feeds were dropped", buf, 0x20u);

        v33 = v35;
      }

    }
    v125 = v26;
    v126 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v142 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("reachedMinOrder"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKOrderFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]((uint64_t)v134, v40);
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("reachedEnd"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKOrderFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]((uint64_t)v134, v41);
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("feedDropped"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKOrderFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]((uint64_t)v134, v42);
    v139 = (void *)objc_claimAutoreleasedReturnValue();

    v124 = v32;
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("nextOrder"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKOrderFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]((uint64_t)v134, v43);
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v123 = v33;
    obj = v33;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, buf, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v149;
      v48 = MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v149 != v47)
            objc_enumerationMutation(obj);
          v50 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i);
          objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("articleID"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v51)
          {
            v52 = v48;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feedItemAndArticle must always have an ArticleID, this is a CloudKit issue please file a radar, record: %@"), v50);
              *(_DWORD *)v160 = 136315906;
              v161 = "-[FCCKOrderFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueRecor"
                     "ds:requestUUID:]";
              v162 = 2080;
              v163 = "FCCKOrderFeedQueryOperation.m";
              v164 = 1024;
              v165 = 301;
              v166 = 2114;
              v167 = v59;
              _os_log_error_impl(&dword_1A1B90000, v48, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v160, 0x26u);

            }
          }
          objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("tagID"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v53)
          {
            v54 = v48;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feedItemAndArticle must always have a FeedID (currently named TagID), this is a CloudKit issue please file a radar, record: %@"), v50);
              *(_DWORD *)v160 = 136315906;
              v161 = "-[FCCKOrderFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueRecor"
                     "ds:requestUUID:]";
              v162 = 2080;
              v163 = "FCCKOrderFeedQueryOperation.m";
              v164 = 1024;
              v165 = 302;
              v166 = 2114;
              v167 = v60;
              _os_log_error_impl(&dword_1A1B90000, v48, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v160, 0x26u);

            }
          }
          objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("tagID"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKeyedSubscript:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v56)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKeyedSubscript:", v57, v55);

          }
          objc_msgSend(v44, "objectForKeyedSubscript:", v55);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v50);

        }
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, buf, 16);
      }
      while (v46);
    }

    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    v136 = v134[47];
    v143 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v144, v160, 16);
    if (v143)
    {
      v138 = *(_QWORD *)v145;
      v61 = MEMORY[0x1E0C81028];
      do
      {
        v62 = 0;
        do
        {
          if (*(_QWORD *)v145 != v138)
            objc_enumerationMutation(v136);
          v63 = *(_QWORD **)(*((_QWORD *)&v144 + 1) + 8 * v62);
          v64 = objc_alloc_init(FCCKOrderFeedResponse);
          if (v63)
            v65 = (void *)v63[1];
          else
            v65 = 0;
          v67 = v65;
          if (v64)
            objc_setProperty_nonatomic_copy(v64, v66, v67, 16);

          if (v63)
            v68 = (void *)v63[1];
          else
            v68 = 0;
          v69 = v68;
          objc_msgSend(v44, "objectForKeyedSubscript:", v69);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          if (v64)
            objc_setProperty_nonatomic_copy(v64, v70, v71, 24);

          if (v63)
            v72 = (void *)v63[1];
          else
            v72 = 0;
          v73 = v72;
          objc_msgSend(v139, "objectForKeyedSubscript:", v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v74, "BOOLValue");
          if (v64)
            v64->_wasDropped = v75;

          if (v63)
            v76 = (void *)v63[1];
          else
            v76 = 0;
          v77 = v76;
          objc_msgSend(v140, "objectForKeyedSubscript:", v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v78, "BOOLValue");
          if (v64)
            v64->_reachedEnd = v79;

          if (v63)
            v80 = (void *)v63[1];
          else
            v80 = 0;
          v81 = v80;
          objc_msgSend(v141, "objectForKeyedSubscript:", v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "BOOLValue");
          if (v64)
          {
            v64->_reachedMinOrder = v83;

            feedItemAndArticleRecords = v64->_feedItemAndArticleRecords;
          }
          else
          {

            feedItemAndArticleRecords = 0;
          }
          v85 = feedItemAndArticleRecords;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@min.%@"), CFSTR("order"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray valueForKeyPath:](v85, "valueForKeyPath:", v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v64)
          {
            objc_msgSend(obj, "count");
            goto LABEL_119;
          }
          if (!v64->_wasDropped)
          {
            if (!objc_msgSend(obj, "count") && !v64->_reachedEnd && !v64->_reachedMinOrder)
              *(_WORD *)&v64->_reachedEnd = 257;
            if (v64->_reachedMinOrder || v64->_reachedEnd)
            {
              if (v63)
                goto LABEL_79;
LABEL_130:
              v92 = 0;
            }
            else
            {
LABEL_119:
              if (!v63)
                goto LABEL_130;
              if (v63[5])
              {
                v108 = v64 ? v64->_feedItemAndArticleRecords : 0;
                v109 = v108;
                v110 = -[NSArray count](v109, "count");
                v111 = v63[5];

                if (v64)
                {
                  if (v110 >= v111)
                    v64->_reachedMinOrder = 1;
                }
              }
LABEL_79:
              v92 = (void *)v63[1];
            }
            v93 = v92;
            objc_msgSend(v135, "objectForKeyedSubscript:", v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();

            if (v94 && objc_msgSend(v94, "unsignedLongLongValue"))
            {
              v95 = objc_msgSend(v94, "unsignedLongLongValue");
              if (v64)
              {
                v96 = v95 + 1;
                goto LABEL_88;
              }
LABEL_126:
              v100 = 0;
            }
            else
            {
              if (v64)
                v97 = v64->_feedItemAndArticleRecords;
              else
                v97 = 0;
              v98 = v97;
              v99 = -[NSArray count](v98, "count");

              if (v99)
              {
                v96 = objc_msgSend(v87, "unsignedLongLongValue");
                if (!v64)
                  goto LABEL_126;
LABEL_88:
                v64->_extent = v96;
              }
              else if (!v64)
              {
                goto LABEL_126;
              }
              v100 = v64->_feedItemAndArticleRecords;
            }
            v101 = v100;
            if (-[NSArray count](v101, "count"))
            {
              if (v64)
                extent = v64->_extent;
              else
                extent = 0;
              v103 = objc_msgSend(v87, "unsignedLongValue");

              if (extent > v103)
              {
                v104 = v61;
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                {
                  v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("OrderFeed returned a bad nextOrder value for request UUID %@"), v133);
                  *(_DWORD *)v152 = 136315906;
                  v153 = "-[FCCKOrderFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueR"
                         "ecords:requestUUID:]";
                  v154 = 2080;
                  v155 = "FCCKOrderFeedQueryOperation.m";
                  v156 = 1024;
                  v157 = 352;
                  v158 = 2114;
                  v159 = v107;
                  _os_log_error_impl(&dword_1A1B90000, v61, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v152, 0x26u);

                }
                v105 = objc_msgSend(v87, "unsignedLongLongValue");
                if (v64)
                {
                  v64->_extent = v105;
                  goto LABEL_101;
                }
                goto LABEL_109;
              }
            }
            else
            {

            }
            if (v64)
            {
LABEL_101:
              if (v64->_reachedMinOrder)
              {
                if (v63)
                  v106 = v63[3];
                else
                  v106 = 0;
                if (v64->_extent < v106)
                  v106 = v64->_extent;
                v64->_extent = v106;
              }
              if (v64->_reachedEnd)
                v64->_extent = 0;
            }
LABEL_109:

            goto LABEL_110;
          }
          v88 = (void *)FCOperationLog;
          if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
          {
            v89 = v88;
            objc_msgSend(v134, "shortOperationDescription");
            v90 = (char *)objc_claimAutoreleasedReturnValue();
            feedID = (char *)v64->_feedID;
            *(_DWORD *)v152 = 138543618;
            v153 = v90;
            v154 = 2114;
            v155 = feedID;
            _os_log_impl(&dword_1A1B90000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@ feed was dropped: %{public}@", v152, 0x16u);

          }
          *(_WORD *)&v64->_reachedEnd = 0;
          v64->_extent = 0;
          if (-[NSArray count](v64->_feedItemAndArticleRecords, "count"))
            v64->_extent = objc_msgSend(v87, "unsignedLongLongValue");
LABEL_110:
          objc_msgSend(v142, "addObject:", v64);

          ++v62;
        }
        while (v143 != v62);
        v112 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v144, v160, 16);
        v143 = v112;
      }
      while (v112);
    }

    objc_storeStrong(v134 + 56, v127);
    objc_storeStrong(v134 + 59, v142);
    objc_storeStrong(v134 + 57, v129);
    objc_storeStrong(v134 + 58, v128);

    a1 = v126;
    v4 = 0;
    v9 = v132;
    v32 = v124;
    v26 = v125;
    v33 = v123;
  }

LABEL_135:
  v113 = *(_QWORD **)(a1 + 32);
  if (v113)
  {
    v114 = FCOperationLog;
    if (v113[60])
    {
      if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
        goto LABEL_148;
      v115 = v114;
      objc_msgSend(v113, "shortOperationDescription");
      v116 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v169 = v116;
      v170 = 2114;
      v171 = (char *)v4;
      v172 = 2114;
      *(_QWORD *)v173 = v9;
      _os_log_error_impl(&dword_1A1B90000, v115, OS_LOG_TYPE_ERROR, "%{public}@ query failed with error: %{public}@, request UUID: %{public}@", buf, 0x20u);
      goto LABEL_147;
    }
  }
  else
  {
    v114 = FCOperationLog;
  }
  if (!os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    goto LABEL_148;
  v115 = v114;
  objc_msgSend(v113, "shortOperationDescription");
  v116 = (char *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v169 = v116;
  v170 = 2114;
  v171 = (char *)v9;
  _os_log_impl(&dword_1A1B90000, v115, OS_LOG_TYPE_DEFAULT, "%{public}@ query succeeded with request UUID: %{public}@", buf, 0x16u);
LABEL_147:

LABEL_148:
  v121 = *(_QWORD **)(a1 + 32);
  if (v121)
    v122 = v121[60];
  else
    v122 = 0;
  objc_msgSend(v121, "finishedPerformingOperationWithError:", v122);

}

- (void)setResultError:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 480), a2);
}

- (void)resetForRetry
{
  if (self)
  {
    objc_storeStrong((id *)&self->_resultFeedItemAndArticleRecords, 0);
    objc_storeStrong((id *)&self->_resultTagRecords, 0);
    objc_storeStrong((id *)&self->_resultIssueRecords, 0);
    objc_storeStrong((id *)&self->_resultFeedResponses, 0);
  }
  -[FCCKOrderFeedQueryOperation setResultError:]((uint64_t)self, 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  NSError *v4;
  NSArray *feedRequests;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSArray *resultFeedResponses;
  NSArray *v11;
  void *v12;
  FCCKOrderFeedQueryResult *v13;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  NSArray *resultIssueRecords;
  id *v18;
  id queryCompletionHandler;
  id v20;
  void *v21;
  NSError *resultError;
  NSArray *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (NSError *)a3;
  if (self)
    feedRequests = self->_feedRequests;
  else
    feedRequests = 0;
  v6 = -[NSArray count](feedRequests, "count");
  v7 = (id)FCOperationLog;
  v8 = v7;
  if (v6 <= 2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      resultFeedResponses = self->_resultFeedResponses;
    else
      resultFeedResponses = 0;
    v11 = resultFeedResponses;
    -[NSArray description](v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v9;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with feed responses: %@", (uint8_t *)&v24, 0x16u);
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v23 = self->_resultFeedResponses;
    else
      v23 = 0;
    v11 = v23;
    -[NSArray description](v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v9;
    v26 = 2112;
    v27 = v12;
    _os_log_debug_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ finished with feed responses: %@", (uint8_t *)&v24, 0x16u);
LABEL_8:

  }
LABEL_10:

  v13 = [FCCKOrderFeedQueryResult alloc];
  if (self)
  {
    v14 = self->_resultFeedItemAndArticleRecords;
    v15 = self->_resultFeedResponses;
    v16 = self->_resultTagRecords;
    resultIssueRecords = self->_resultIssueRecords;
  }
  else
  {
    v16 = 0;
    v14 = 0;
    v15 = 0;
    resultIssueRecords = 0;
  }
  v18 = -[FCCKOrderFeedQueryResult initWithFeedItemAndArticleRecords:feedResponses:tagRecords:issueRecords:]((id *)&v13->super.isa, v14, v15, v16, resultIssueRecords);

  if (self)
  {
    queryCompletionHandler = self->_queryCompletionHandler;
    if (queryCompletionHandler)
    {
      v20 = queryCompletionHandler;
      v21 = v20;
      if (self->_resultError)
        resultError = self->_resultError;
      else
        resultError = v4;
      (*((void (**)(id, id *, NSError *))v20 + 2))(v20, v18, resultError);

    }
  }

}

- (id)_feedRelativeDictionaryFromResultsArray:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(v3, "count");
    if (v4 != objc_msgSend(*(id *)(a1 + 376), "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("results don't align with feed IDs"));
      *(_DWORD *)buf = 136315906;
      v13 = "-[FCCKOrderFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]";
      v14 = 2080;
      v15 = "FCCKOrderFeedQueryOperation.m";
      v16 = 1024;
      v17 = 392;
      v18 = 2114;
      v19 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v6 = *(void **)(a1 + 376);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__FCCKOrderFeedQueryOperation__feedRelativeDictionaryFromResultsArray___block_invoke;
    v9[3] = &unk_1E4644410;
    v10 = v3;
    v11 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  }
  return v5;
}

void __71__FCCKOrderFeedQueryOperation__feedRelativeDictionaryFromResultsArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v8)
    v7 = v8[1];
  else
    v7 = 0;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_resultFeedResponses, 0);
  objc_storeStrong((id *)&self->_resultIssueRecords, 0);
  objc_storeStrong((id *)&self->_resultTagRecords, 0);
  objc_storeStrong((id *)&self->_resultFeedItemAndArticleRecords, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_articleLinkKeys, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_feedRequests, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
