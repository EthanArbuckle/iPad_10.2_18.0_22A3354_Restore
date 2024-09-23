@implementation FCCKMultiFetchQueryOperation

- (BOOL)validateOperation
{
  FCCKMultiFetchQueryOperation *v2;
  NSArray *recordIDs;
  NSArray *recordSpecs;
  FCCKContentDatabase *v5;
  FCCKContentDatabase *v6;
  NSArray *v7;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v2 = self;
  v20 = *MEMORY[0x1E0C80C00];
  if (self && self->_database)
    goto LABEL_5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("multi-fetch query requires a database"));
    v12 = 136315906;
    v13 = "-[FCCKMultiFetchQueryOperation validateOperation]";
    v14 = 2080;
    v15 = "FCCKMultiFetchQueryOperation.m";
    v16 = 1024;
    v17 = 36;
    v18 = 2114;
    v19 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

    if (v2)
      goto LABEL_5;
LABEL_22:
    recordIDs = 0;
    goto LABEL_6;
  }
  if (!v2)
    goto LABEL_22;
LABEL_5:
  recordIDs = v2->_recordIDs;
LABEL_6:
  if (!-[NSArray count](recordIDs, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("multi-fetch query requires at least one record ID"));
    v12 = 136315906;
    v13 = "-[FCCKMultiFetchQueryOperation validateOperation]";
    v14 = 2080;
    v15 = "FCCKMultiFetchQueryOperation.m";
    v16 = 1024;
    v17 = 37;
    v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

  }
  if (v2)
    recordSpecs = v2->_recordSpecs;
  else
    recordSpecs = 0;
  if (!-[NSArray count](recordSpecs, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("multi-fetch query requires at least one record spec"));
    v12 = 136315906;
    v13 = "-[FCCKMultiFetchQueryOperation validateOperation]";
    v14 = 2080;
    v15 = "FCCKMultiFetchQueryOperation.m";
    v16 = 1024;
    v17 = 38;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

    if (!v2)
      return (char)v2;
  }
  else if (!v2)
  {
    return (char)v2;
  }
  v5 = v2->_database;
  if (v5)
  {
    v6 = v5;
    v7 = v2->_recordIDs;
    if (-[NSArray count](v7, "count"))
      LOBYTE(v2) = -[NSArray count](v2->_recordSpecs, "count") != 0;
    else
      LOBYTE(v2) = 0;

  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

void __48__FCCKMultiFetchQueryOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Results"));

  if (v4)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("notFound"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0C9AA60];
    if (v5)
      v6 = v5;
    v11 = v6;

    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(void **)(v7 + 456);
    else
      v8 = 0;
    objc_msgSend(v8, "addObjectsFromArray:", v11);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(void **)(v9 + 448);
    else
      v10 = 0;
    objc_msgSend(v10, "addObject:", v11);
  }

}

uint64_t __47__FCCKMultiFetchQueryOperation__constructQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  v6 = *(void **)(a2 + 16);
  if (!v4)
    goto LABEL_6;
LABEL_3:
  v7 = v4[2];
LABEL_4:
  v8 = v6;
  v9 = objc_msgSend(v8, "compare:", v7);

  return v9;
}

void __48__FCCKMultiFetchQueryOperation_performOperation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  const char *v8;
  id v9;
  void *v10;
  id v11;

  v4 = (id *)(a1 + 40);
  v11 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = WeakRetained;
  if (WeakRetained)
    v7 = (void *)*((_QWORD *)WeakRetained + 58);
  else
    v7 = 0;
  v9 = v7;
  v10 = *(void **)(a1 + 32);
  if (v10)
    objc_setProperty_nonatomic_copy(v10, v8, v9, 416);

  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v11);
}

- (void)operationWillFinishWithError:(id)a3
{
  id queryCompletionHandler;
  void (**v5)(id, NSMutableArray *, NSMutableSet *, id);
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if (self)
  {
    queryCompletionHandler = self->_queryCompletionHandler;
    if (queryCompletionHandler)
    {
      v5 = (void (**)(id, NSMutableArray *, NSMutableSet *, id))queryCompletionHandler;
      v6 = self->_resultFetchedRecords;
      v5[2](v5, v6, self->_resultMissingRecordIDs, v7);

    }
  }

}

- (void)performOperation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  NSDictionary *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  FCCKContentQueryOperation *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  BOOL v48;
  SEL v49;
  int64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  SEL v59;
  id obj;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v68[5];
  id v69;
  _QWORD newValue[5];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  id location[19];

  location[16] = *(id *)MEMORY[0x1E0C80C00];
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray sortedArrayUsingComparator:](self->_recordSpecs, "sortedArrayUsingComparator:", &__block_literal_global_13_1);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, location, 16);
    if (v2)
    {
      v3 = *(_QWORD *)v76;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v76 != v3)
            objc_enumerationMutation(obj);
          v5 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v4);
          if (v5)
          {
            objc_msgSend(v64, "addObject:", *(_QWORD *)(v5 + 16));
            v6 = *(void **)(v5 + 32);
          }
          else
          {
            objc_msgSend(v64, "addObject:", 0);
            v6 = 0;
          }
          objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = (void *)v8;
          if (v8)
            v10 = (const __CFString *)v8;
          else
            v10 = &stru_1E464BC40;
          objc_msgSend(v63, "addObject:", v10);

          if (v5)
            v11 = *(void **)(v5 + 24);
          else
            v11 = 0;
          objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "addObject:", v13);

          if (v5)
            v14 = *(_BYTE *)(v5 + 8) != 0;
          else
            v14 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "addObject:", v15);

          ++v4;
        }
        while (v2 != v4);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, location, 16);
        v2 = v16;
      }
      while (v16);
    }

    v17 = self->_knownRecordIDsToEtags;
    -[NSDictionary allKeys](v17, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sortedArrayUsingSelector:", sel_compare_);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = 0u;
    v72 = 0u;
    v73 = 0u;
    v71 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v72 != v22)
            objc_enumerationMutation(v20);
          v24 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v66, "addObject:", v24);
          -[NSDictionary objectForKeyedSubscript:](self->_knownRecordIDsToEtags, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v25);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      }
      while (v21);
    }

    -[NSArray sortedArrayUsingSelector:](self->_recordIDs, "sortedArrayUsingSelector:", sel_compare_);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v26, CFSTR("recordIDs"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v28);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v64, CFSTR("recordTypes"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v29);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v63, CFSTR("fetchFields"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v30);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v62, CFSTR("requestedFields"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v31);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v61, CFSTR("shortcut"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v32);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v66, CFSTR("knownRecordIDs"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v33);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v65, CFSTR("knownEtags"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v34);

    v35 = (void *)MEMORY[0x1E0CB3880];
    v36 = (void *)MEMORY[0x1E0CB37E8];
    v37 = -[FCOperation relativePriority](self, "relativePriority");
    v38 = 300;
    if (!v37)
      v38 = 200;
    if (v37 == -1)
      v39 = 100;
    else
      v39 = v38;
    objc_msgSend(v36, "numberWithUnsignedInteger:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("priority"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v41);

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v27);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("MultiFetch"), v42);

  }
  else
  {
    v43 = 0;
  }
  v44 = objc_alloc_init(FCCKContentQueryOperation);
  v45 = (uint64_t)v44;
  v46 = (void *)MEMORY[0x1E0C809B0];
  if (self)
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v44, self->_database);
    -[FCCKContentQueryOperation setQuery:](v45, v43);
    v48 = v45 == 0;
    if (v45)
    {
      *(_DWORD *)(v45 + 372) = self->_networkEventType;
      objc_setProperty_nonatomic_copy((id)v45, v47, self->_networkActivityBlock, 472);
      objc_setProperty_nonatomic_copy((id)v45, v49, self->_edgeCacheHint, 448);
      *(_BYTE *)(v45 + 368) = self->_ignoreCache;
      v50 = -[FCOperation relativePriority](self, "relativePriority");
      v51 = 300;
      if (!v50)
        v51 = 200;
      if (v50 == -1)
        v51 = 100;
      *(_QWORD *)(v45 + 456) = v51;
    }
    else
    {
      -[FCOperation relativePriority](self, "relativePriority");
    }
    location[0] = v46;
    location[1] = (id)3221225472;
    location[2] = __44__FCCKMultiFetchQueryOperation__desiredKeys__block_invoke;
    location[3] = &unk_1E463AE18;
    location[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E60], "fc_set:", location);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "allObjects");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v44, 0);
    -[FCCKContentQueryOperation setQuery:](v45, v43);
    if (v45)
    {
      *(_DWORD *)(v45 + 372) = 0;
      objc_setProperty_nonatomic_copy((id)v45, v58, 0, 472);
      objc_setProperty_nonatomic_copy((id)v45, v59, 0, 448);
      v48 = 0;
      v53 = 0;
      *(_BYTE *)(v45 + 368) = 0;
      *(_QWORD *)(v45 + 456) = 0;
    }
    else
    {
      v53 = 0;
      v48 = 1;
    }
  }
  objc_msgSend(v53, "sortedArrayUsingSelector:", sel_compare_);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v48)
    objc_setProperty_nonatomic_copy((id)v45, v54, v55, 408);

  newValue[0] = v46;
  newValue[1] = 3221225472;
  newValue[2] = __48__FCCKMultiFetchQueryOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E463BBD8;
  newValue[4] = self;
  if (!v48)
    objc_setProperty_nonatomic_copy((id)v45, v56, newValue, 416);
  objc_initWeak(location, (id)v45);
  v68[0] = v46;
  v68[1] = 3221225472;
  v68[2] = __48__FCCKMultiFetchQueryOperation_performOperation__block_invoke_2;
  v68[3] = &unk_1E4649AB8;
  v68[4] = self;
  objc_copyWeak(&v69, location);
  if (!v48)
    objc_setProperty_nonatomic_copy((id)v45, v57, v68, 424);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v45);
  objc_msgSend((id)v45, "start");
  objc_destroyWeak(&v69);
  objc_destroyWeak(location);

}

void __44__FCCKMultiFetchQueryOperation__desiredKeys__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[49];
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10)
          v11 = *(_QWORD *)(v10 + 24);
        else
          v11 = 0;
        objc_msgSend(v3, "addObjectsFromArray:", v11, (_QWORD)v13);
        ++v9;
      }
      while (v7 != v9);
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = v12;
    }
    while (v12);
  }

  objc_msgSend(v3, "addObject:", CFSTR("notFound"));
}

- (void)setRecordSpecs:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 392), a2);
}

- (void)setRecordIDs:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 384), a2);
}

- (void)setKnownRecordIDsToEtags:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 400), a2);
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 376), a2);
}

- (void)prepareOperation
{
  FCCKMultiFetchQueryOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = self;
  if (self)
    self = (FCCKMultiFetchQueryOperation *)self->_recordSpecs;
  -[FCCKMultiFetchQueryOperation fc_dictionaryWithKeyBlock:](self, "fc_dictionaryWithKeyBlock:", &__block_literal_global_167);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_storeStrong((id *)&v2->_recordSpecsByType, v3);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_storeStrong((id *)&v2->_resultFetchedRecords, v4);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v5;
    objc_storeStrong((id *)&v2->_resultMissingRecordIDs, v5);

    if (!v2->_networkEventType)
      v2->_networkEventType = 12;
  }
  else
  {

  }
}

id __48__FCCKMultiFetchQueryOperation_prepareOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(id *)(a2 + 16);
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultMissingRecordIDs, 0);
  objc_storeStrong((id *)&self->_resultFetchedRecords, 0);
  objc_storeStrong((id *)&self->_recordSpecsByType, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong(&self->_networkActivityBlock, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_knownRecordIDsToEtags, 0);
  objc_storeStrong((id *)&self->_recordSpecs, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
