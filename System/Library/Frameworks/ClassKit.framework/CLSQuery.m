@implementation CLSQuery

+ (id)queryWithQuerySpecification:(id)a3 completion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *Specification_completion_error;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)a1);
  Specification_completion_error = (void *)objc_msgSend_initWithQuerySpecification_completion_error_(v10, v11, (uint64_t)v9, v8, a5);

  return Specification_completion_error;
}

+ (id)queryWithObjectType:(Class)a3 predicate:(id)a4
{
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend_queryWithObjectType_predicate_error_(a1, a2, (uint64_t)a3, a4, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v5)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v6 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1D4054000, v6, OS_LOG_TYPE_INFO, "Error validating predicate: %{public}@", buf, 0xCu);
    }
  }

  return v4;
}

+ (id)queryWithObjectType:(Class)a3 predicate:(id)a4 error:(id *)a5
{
  void *v7;
  const char *v8;
  void *v9;

  objc_msgSend_querySpecificationWithObjectType_predicate_(CLSQuerySpecification, a2, (uint64_t)a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryWithQuerySpecification_completion_error_(a1, v8, (uint64_t)v7, &unk_1E97499F0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)queryWithSearchSpecification:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v11 = 0;
  v7 = (void *)objc_msgSend_initWithSearchSpecification_error_(v5, v6, (uint64_t)v4, &v11);

  v8 = v11;
  if (v8)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v9 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1D4054000, v9, OS_LOG_TYPE_INFO, "Error creating searchQuery: %{public}@", buf, 0xCu);
    }
  }

  return v7;
}

- (CLSQuery)initWithQuerySpecification:(id)a3 error:(id *)a4
{
  id v6;
  CLSQuery *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSQuery;
  v7 = -[CLSDataObserver initWithQuerySpecification:error:](&v13, sel_initWithQuerySpecification_error_, v6, a4);
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend_setResults_(v7, v9, (uint64_t)v8);

    v7->_shouldAddResultsToDataStore = 1;
    v7->_shouldFaultResults = 1;
    v7->_lock._os_unfair_lock_opaque = 0;
    v7->_fetchLimit = objc_msgSend_limit(v6, v10, v11);
  }

  return v7;
}

- (CLSQuery)initWithQuerySpecification:(id)a3 completion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CLSQuery *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CLSQuery;
  v10 = -[CLSDataObserver initWithQuerySpecification:error:](&v17, sel_initWithQuerySpecification_error_, v8, a5);
  if (v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend_setResults_(v10, v12, (uint64_t)v11);

    v10->_shouldAddResultsToDataStore = 1;
    v10->_shouldFaultResults = 1;
    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_fetchLimit = objc_msgSend_limit(v8, v13, v14);
    objc_msgSend_setCompletion_(v10, v15, (uint64_t)v9);
  }

  return v10;
}

- (CLSQuery)initWithSearchSpecification:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t Specification_error;
  CLSQuery *v13;

  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend_querySpecificationWithObjectType_predicate_(CLSQuerySpecification, v9, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  Specification_error = objc_msgSend_initWithQuerySpecification_error_(self, v11, (uint64_t)v10, a4);
  v13 = (CLSQuery *)Specification_error;
  if (Specification_error)
    objc_storeStrong((id *)(Specification_error + 136), a3);

  return v13;
}

- (CLSQuery)initWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6
{
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  CLSQuery *Specification_error;

  v10 = a5;
  objc_msgSend_querySpecificationWithObjectType_predicate_(CLSQuerySpecification, v11, (uint64_t)a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSortDescriptors_(v12, v13, (uint64_t)v10);

  Specification_error = (CLSQuery *)objc_msgSend_initWithQuerySpecification_error_(self, v14, (uint64_t)v12, a6);
  return Specification_error;
}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  CLSSearchSpecification *searchSpec;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLSQuery;
  -[CLSDataObserver description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  searchSpec = self->_searchSpec;
  if (searchSpec)
  {
    objc_msgSend_description(searchSpec, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v6, v11, (uint64_t)v10);

  }
  objc_msgSend_appendString_(v6, v7, (uint64_t)CFSTR(" (executing: "));
  if (objc_msgSend_isExecuting(self, v12, v13))
    objc_msgSend_appendString_(v6, v14, (uint64_t)CFSTR("YES"));
  else
    objc_msgSend_appendString_(v6, v14, (uint64_t)CFSTR("NO"));
  objc_msgSend_appendString_(v6, v15, (uint64_t)CFSTR(")"));
  return (NSString *)v6;
}

- (void)setFetchLimit:(int64_t)a3
{
  void *v5;
  const char *v6;

  objc_msgSend_querySpec(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLimit_(v5, v6, a3);

  self->_fetchLimit = a3;
}

- (void)reset
{
  uint64_t v2;
  const char *v3;
  id v4;

  objc_msgSend_querySpec(self, a2, v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOffset_(v4, v3, 0);

}

- (void)clientRemote_invalidate
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void (**v14)(id, _QWORD, void *);

  objc_msgSend_lock(self, a2, v2);
  objc_msgSend_results(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v6, v7, v8);

  v14 = (void (**)(id, _QWORD, void *))MEMORY[0x1D82575D0](self->_completion);
  objc_msgSend_unlock(self, v9, v10);
  if (v14)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v11, 100, CFSTR("Query invalidated"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExecuting_(self, v13, 0);
    v14[2](v14, 0, v12);

  }
  else
  {
    objc_msgSend_setExecuting_(self, v11, 0);
  }

}

- (void)clientRemote_deliverObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  char isRemovedObject;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v4;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend_dataStore(self, v14, v15, (_QWORD)v23),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              isRemovedObject = objc_msgSend_isRemovedObject_(v16, v17, v13),
              v16,
              (isRemovedObject & 1) == 0))
        {
          objc_msgSend_results(self, v14, v15, (_QWORD)v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v19, v20, v13);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v14, (uint64_t)&v23, v27, 16);
    }
    while (v10);
  }

  objc_msgSend_unlock(self, v21, v22);
}

- (void)clientRemote_finishWithOffset:(unint64_t)a3 error:(id)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  char *v23;

  v23 = (char *)a4;
  objc_msgSend_lock(self, v6, v7);
  objc_msgSend_querySpec(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_querySpec(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOffset_(v13, v14, a3);

  }
  objc_msgSend_unlock(self, v11, v12);
  v17 = (void *)objc_msgSend_objectType(self, v15, v16);
  v19 = objc_msgSend_conformsToProtocol_(v17, v18, (uint64_t)&unk_1EFE376C0);
  v21 = v23;
  if (!v23 && v19 && (objc_msgSend_shouldFaultResults(self, 0, v20) & 1) != 0)
    objc_msgSend__faultResultsAndComplete(self, v21, v22);
  else
    objc_msgSend__notifyOfCompletionWithError_(self, v21, (uint64_t)v23);

}

- (void)_faultResultsAndComplete
{
  CLSFaultProcessor *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1D4073D0C;
  v20 = sub_1D4073D1C;
  v3 = [CLSFaultProcessor alloc];
  objc_msgSend_dataStore(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend_initWithDelegate_(v3, v7, (uint64_t)v6);

  v8 = (void *)v17[5];
  objc_msgSend_results(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_faultObjects_(v8, v12, (uint64_t)v11);

  v13 = (void *)v17[5];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D4073D24;
  v15[3] = &unk_1E974A680;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend_completionNotify_(v13, v14, (uint64_t)v15);
  _Block_object_dispose(&v16, 8);

}

- (void)_notifyOfCompletionWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  objc_msgSend_results(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v9, v10, v11);

  objc_msgSend_results(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v15, v16, v17);

  objc_msgSend_unlock(self, v18, v19);
  v22 = (void *)objc_msgSend_objectType(self, v20, v21);
  v23 = objc_opt_class();
  if (objc_msgSend_isSubclassOfClass_(v22, v24, v23) && self->_shouldAddResultsToDataStore)
  {
    v26 = (void *)objc_opt_new();
    objc_msgSend_dataStore(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v30 = v12;
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v42, v46, 16);
    if (v32)
    {
      v34 = v32;
      v35 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(v30);
          objc_msgSend_addObject_(v29, v33, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i), (_QWORD)v42);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v37;
          if (v37 && (objc_msgSend_isDeleted(v37, v38, v39) & 1) == 0)
            objc_msgSend_addObject_(v26, v41, (uint64_t)v40);

        }
        v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v42, v46, 16);
      }
      while (v34);
    }

  }
  else
  {
    v26 = v12;
  }
  objc_msgSend__notifyOfCompletionWithResults_error_(self, v25, (uint64_t)v26, v4, (_QWORD)v42);

}

- (void)_notifyOfCompletionWithResults:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  CLSQuery *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v8 = (id)CLSLogConnection;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startDate(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceDate_(v18, v22, (uint64_t)v21);
    v26 = v25;
    if (v6)
      v27 = objc_msgSend_count(v6, v23, v24);
    else
      v27 = 0;
    *(_DWORD *)buf = 138412802;
    v33 = self;
    v34 = 2048;
    v35 = v26;
    v36 = 2048;
    v37 = v27;
    _os_log_debug_impl(&dword_1D4054000, v8, OS_LOG_TYPE_DEBUG, "query: %@; took: %.3f count: %ld", buf, 0x20u);

  }
  objc_msgSend_lock(self, v11, v12);
  v13 = (void *)MEMORY[0x1D82575D0](self->_completion);
  objc_msgSend_unlock(self, v14, v15);
  if (v13)
  {
    dispatch_get_global_queue(33, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1D407428C;
    v28[3] = &unk_1E974A6A8;
    v28[4] = self;
    v29 = v7;
    v31 = v13;
    v30 = v6;
    dispatch_async(v17, v28);

  }
  else
  {
    objc_msgSend_setExecuting_(self, v16, 0);
  }

}

- (NSMutableArray)results
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (void)setExecuting:(BOOL)a3
{
  self->_executing = a3;
}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (CLSSearchSpecification)searchSpec
{
  return self->_searchSpec;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)shouldAddResultsToDataStore
{
  return self->_shouldAddResultsToDataStore;
}

- (void)setShouldAddResultsToDataStore:(BOOL)a3
{
  self->_shouldAddResultsToDataStore = a3;
}

- (BOOL)shouldFaultResults
{
  return self->_shouldFaultResults;
}

- (void)setShouldFaultResults:(BOOL)a3
{
  self->_shouldFaultResults = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_searchSpec, 0);
  objc_storeStrong((id *)&self->results, 0);
}

@end
