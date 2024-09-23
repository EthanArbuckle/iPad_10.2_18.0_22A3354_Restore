@implementation FCCKTagSearchQueryOperation

- (BOOL)validateOperation
{
  FCCKTagSearchQueryOperation *v2;
  FCCKContentDatabase *v3;
  void *v5;
  void *v6;
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
  if (!self || !self->_database)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("tag search query must have a database"));
      v9 = 136315906;
      v10 = "-[FCCKTagSearchQueryOperation validateOperation]";
      v11 = 2080;
      v12 = "FCCKTagSearchQueryOperation.m";
      v13 = 1024;
      v14 = 45;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

      if (!v2)
        goto LABEL_6;
    }
    else if (!v2)
    {
      goto LABEL_6;
    }
  }
  if (v2->_searchString)
    goto LABEL_8;
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("tag search query must have a non-nil search string"));
    v9 = 136315906;
    v10 = "-[FCCKTagSearchQueryOperation validateOperation]";
    v11 = 2080;
    v12 = "FCCKTagSearchQueryOperation.m";
    v13 = 1024;
    v14 = 46;
    v15 = 2114;
    v16 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (v2)
    {
LABEL_8:
      if (v2->_tagType)
        goto LABEL_11;
    }
  }
  else if (v2)
  {
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("tag search query must have a known tag type"));
    v9 = 136315906;
    v10 = "-[FCCKTagSearchQueryOperation validateOperation]";
    v11 = 2080;
    v12 = "FCCKTagSearchQueryOperation.m";
    v13 = 1024;
    v14 = 47;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (!v2)
    {
LABEL_12:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("tag search query must have a non-zero results limit"));
        v9 = 136315906;
        v10 = "-[FCCKTagSearchQueryOperation validateOperation]";
        v11 = 2080;
        v12 = "FCCKTagSearchQueryOperation.m";
        v13 = 1024;
        v14 = 48;
        v15 = 2114;
        v16 = v8;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

        if (v2)
          goto LABEL_14;
      }
      else if (v2)
      {
        goto LABEL_14;
      }
      v3 = 0;
      goto LABEL_18;
    }
  }
  else if (!v2)
  {
    goto LABEL_12;
  }
LABEL_11:
  if (!v2->_resultsLimit)
    goto LABEL_12;
LABEL_14:
  v3 = v2->_database;
  LOBYTE(v2) = v3 && v2->_tagType && v2->_resultsLimit != 0;
LABEL_18:

  return (char)v2;
}

- (void)prepareOperation
{
  int64_t tagType;
  __CFString *v3;

  if (self)
  {
    tagType = self->_tagType;
    if (tagType == 1)
    {
      v3 = CFSTR("topics");
    }
    else
    {
      if (tagType != 2)
        return;
      v3 = CFSTR("channels");
    }
    objc_storeStrong((id *)&self->_tagTypeString, v3);
  }
}

- (void)performOperation
{
  NSObject *v3;
  FCCKContentQueryOperation *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  NSArray *desiredKeys;
  int64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  unint64_t resultsLimit;
  void *v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  NSString *searchString;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  _QWORD v31[6];
  id v32;
  id location;
  _QWORD newValue[5];
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (self)
      searchString = self->_searchString;
    else
      searchString = 0;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = searchString;
    _os_log_debug_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ started with search string: %@", buf, 0x16u);

  }
  v4 = objc_alloc_init(FCCKContentQueryOperation);
  v5 = (uint64_t)v4;
  if (!self)
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v4, 0);
    -[FCCKContentQueryOperation setQuery:](v5, 0);
    -[FCCKContentQueryOperation setCursor:](v5, 0);
    if (v5)
    {
      desiredKeys = 0;
      *(_QWORD *)(v5 + 400) = 0;
      goto LABEL_5;
    }
LABEL_30:
    -[FCOperation relativePriority](self, "relativePriority");
    v12 = 0;
    v10 = 1;
    goto LABEL_10;
  }
  -[FCCKContentQueryOperation setDatabase:]((uint64_t)v4, self->_database);
  -[FCCKTagSearchQueryOperation _constructTagSearchQuery]((id *)&self->super.super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKContentQueryOperation setQuery:](v5, v6);

  -[FCCKContentQueryOperation setCursor:](v5, self->_cursor);
  if (!v5)
    goto LABEL_30;
  *(_QWORD *)(v5 + 400) = self->_resultsLimit;
  desiredKeys = self->_desiredKeys;
LABEL_5:
  objc_setProperty_nonatomic_copy((id)v5, v7, desiredKeys, 408);
  *(_DWORD *)(v5 + 372) = 13;
  v9 = -[FCOperation relativePriority](self, "relativePriority");
  v10 = 0;
  v11 = 300;
  if (!v9)
    v11 = 200;
  if (v9 == -1)
    v11 = 100;
  *(_QWORD *)(v5 + 456) = v11;
  v12 = *(void **)(v5 + 384);
LABEL_10:
  v13 = v12;
  v14 = v13 == 0;

  v15 = (id)FCOperationLog;
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (!v14)
  {
    if (!v16)
      goto LABEL_17;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      resultsLimit = self->_resultsLimit;
      if ((v10 & 1) == 0)
      {
LABEL_14:
        v19 = *(void **)(v5 + 384);
LABEL_15:
        v20 = v19;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = resultsLimit;
        *(_WORD *)&buf[22] = 2112;
        v36 = v20;
        _os_log_debug_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ issuing query with results limit %lu: %@", buf, 0x20u);

        goto LABEL_17;
      }
    }
    else
    {
      resultsLimit = 0;
      if ((v10 & 1) == 0)
        goto LABEL_14;
    }
    v19 = 0;
    goto LABEL_15;
  }
  if (v16)
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (self)
      v30 = self->_resultsLimit;
    else
      v30 = 0;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v28;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v30;
    _os_log_debug_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ issuing query from cursor with results limit %lu", buf, 0x16u);

  }
LABEL_17:

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v36 = __Block_byref_object_copy__47;
  v37 = __Block_byref_object_dispose__47;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v38 = v21;
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __47__FCCKTagSearchQueryOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E4645EE8;
  newValue[4] = buf;
  if ((v10 & 1) == 0)
    objc_setProperty_nonatomic_copy((id)v5, v22, newValue, 416);
  objc_initWeak(&location, (id)v5);
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = __47__FCCKTagSearchQueryOperation_performOperation__block_invoke_2;
  v31[3] = &unk_1E4645F10;
  v31[4] = self;
  v31[5] = buf;
  objc_copyWeak(&v32, &location);
  if ((v10 & 1) == 0)
    objc_setProperty_nonatomic_copy((id)v5, v24, v31, 424);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v5);
  objc_msgSend((id)v5, "start");
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

- (id)_constructTagSearchQuery
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  id v23[2];

  v1 = a1;
  v23[1] = *(id *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB3880];
    v23[0] = v1[48];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v23[0];
    objc_msgSend(v4, "arrayWithObjects:count:", v23, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v6, CFSTR("query"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "addObject:", v7);
    v8 = (void *)MEMORY[0x1E0CB3880];
    v22 = v1[54];
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = v22;
    objc_msgSend(v9, "arrayWithObjects:count:", &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v11, CFSTR("queryNames"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "addObject:", v12);
    v13 = v1[52];
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB3880];
      v21 = v13;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = v13;
      objc_msgSend(v15, "arrayWithObjects:count:", &v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v17, CFSTR("locale"), v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "addObject:", v18);
    }
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("TagSearch"), v19);

  }
  return v1;
}

uint64_t __47__FCCKTagSearchQueryOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

void __47__FCCKTagSearchQueryOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEBUG))
  {
    v18 = *(void **)(a1 + 32);
    v19 = v7;
    objc_msgSend(v18, "shortOperationDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v27 = 138543874;
    v28 = v20;
    v29 = 2048;
    v30 = v21;
    v31 = 2112;
    v32 = v22;
    _os_log_debug_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ received response with %lu Tag records: %@", (uint8_t *)&v27, 0x20u);

  }
  FCErrorForCKError(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTagSearchQueryOperation setResultError:](*(_QWORD *)(a1 + 32), v8);

  v9 = *(_QWORD **)(a1 + 32);
  if (v9)
  {
    v10 = FCOperationLog;
    if (v9[57])
    {
      if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v11 = v10;
      objc_msgSend(v9, "shortOperationDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      v14 = WeakRetained;
      if (WeakRetained)
        v15 = (void *)*((_QWORD *)WeakRetained + 54);
      else
        v15 = 0;
      v16 = v15;
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v12;
      v29 = 2114;
      v30 = (uint64_t)v6;
      v31 = 2114;
      v32 = v17;
      _os_log_error_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_ERROR, "%{public}@ query failed with error: %{public}@, request UUID: %{public}@", (uint8_t *)&v27, 0x20u);
      goto LABEL_14;
    }
  }
  else
  {
    v10 = FCOperationLog;
  }
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    goto LABEL_15;
  v11 = v10;
  objc_msgSend(v9, "shortOperationDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_loadWeakRetained((id *)(a1 + 48));
  v14 = v23;
  if (v23)
    v24 = (void *)*((_QWORD *)v23 + 54);
  else
    v24 = 0;
  v16 = v24;
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 138543618;
  v28 = v12;
  v29 = 2112;
  v30 = (uint64_t)v17;
  _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ query succeeded with request UUID: %@", (uint8_t *)&v27, 0x16u);
LABEL_14:

LABEL_15:
  -[FCCKTagSearchQueryOperation setResultRecords:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  -[FCCKTagSearchQueryOperation setResultCursor:](*(_QWORD *)(a1 + 32), v5);
  v25 = *(_QWORD **)(a1 + 32);
  if (v25)
    v26 = v25[57];
  else
    v26 = 0;
  objc_msgSend(v25, "finishedPerformingOperationWithError:", v26);

}

- (void)setResultError:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 456), a2);
}

- (void)setResultRecords:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 440), a2);
}

- (void)setResultCursor:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 448), a2);
}

- (void)resetForRetry
{
  -[FCCKTagSearchQueryOperation setResultRecords:]((uint64_t)self, 0);
  -[FCCKTagSearchQueryOperation setResultCursor:]((uint64_t)self, 0);
  -[FCCKTagSearchQueryOperation setResultError:]((uint64_t)self, 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  id queryCompletionHandler;
  void (**v5)(id, NSArray *, CKQueryCursor *, NSError *);
  NSArray *v6;
  CKQueryCursor *v7;
  NSError *resultError;
  NSError *v9;

  v9 = (NSError *)a3;
  if (self)
  {
    queryCompletionHandler = self->_queryCompletionHandler;
    if (queryCompletionHandler)
    {
      v5 = (void (**)(id, NSArray *, CKQueryCursor *, NSError *))queryCompletionHandler;
      v6 = self->_resultRecords;
      v7 = self->_resultCursor;
      if (self->_resultError)
        resultError = self->_resultError;
      else
        resultError = v9;
      v5[2](v5, v6, v7, resultError);

    }
  }

}

- (void)setDatabase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 368), a2);
}

- (void)setCursor:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 400), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_resultCursor, 0);
  objc_storeStrong((id *)&self->_resultRecords, 0);
  objc_storeStrong((id *)&self->_tagTypeString, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
