@implementation CPLEngineQuarantinedRecords

- (unint64_t)scopeType
{
  return 1;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v10;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", a3, a4, a5, a6);

  return (char)a6;
}

- (BOOL)addQuarantinedRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4 reason:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  int v22;
  Class v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if ((-[objc_class shouldReallyQuarantineRecord](a4, "shouldReallyQuarantineRecord") & 1) != 0)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addQuarantinedRecordWithScopedIdentifier:recordClass:reason:error:", v10, a4, v11, a6);

    if (!v13)
      goto LABEL_10;
  }
  else if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_19388();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412546;
      v23 = a4;
      v24 = 2114;
      v25 = v10;
      _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Dropping but not quarantining <%@ %{public}@>", (uint8_t *)&v22, 0x16u);
    }

  }
  -[CPLEngineStorage engineStore](self, "engineStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pushRepository");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "discardChangeWithScopedIdentifier:error:", v10, a6);

  if (!v17)
  {
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  -[CPLEngineStorage engineStore](self, "engineStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "statusCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "notifyStatusForRecordWithScopedIdentifierHasChanged:recordClass:persist:error:", v10, a4, 1, a6);
LABEL_11:

  return v20;
}

- (BOOL)removeQuarantinedRecordWithScopedIdentifier:(id)a3 notify:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v16 = 0;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "removeQuarantinedRecordWithScopedIdentifier:removed:error:", v8, &v16, a5);

  if (v10 && v16 && v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_19388();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v8;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Removed %{public}@ from quarantine", buf, 0xCu);
      }

    }
    -[CPLEngineStorage engineStore](self, "engineStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "statusCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "recordViewForStatusWithScopedIdentifier:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v13, "notifyStatusForRecordViewHasChanged:persist:error:", v14, 1, a5);

  }
  return v10;
}

- (BOOL)isRecordWithScopedIdentifierQuarantined:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRecordWithScopedIdentifierQuarantined:", v4);

  return v6;
}

- (Class)classForQuarantinedRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classForQuarantinedRecordWithScopedIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

- (unint64_t)countOfQuarantinedRecords
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfQuarantinedRecords");

  return v3;
}

- (unint64_t)countOfQuarantinedRecordsInScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countOfQuarantinedRecordsInScopeWithIdentifier:", v4);

  return v6;
}

- (void)_sendQuarantineFeedbackWithRecordClass:(Class)a3 reason:(id)a4
{
  NSMutableArray *v6;
  NSMutableArray *quarantineMessages;
  CPLQuarantineFeedbackMessage *v8;
  void *v9;
  void *v10;
  void *v11;
  CPLQuarantineFeedbackMessage *v12;
  id v13;

  v13 = a4;
  if (!self->_quarantineMessages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    quarantineMessages = self->_quarantineMessages;
    self->_quarantineMessages = v6;

  }
  v8 = [CPLQuarantineFeedbackMessage alloc];
  -[CPLEngineStorage engineStore](self, "engineStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "engineLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "libraryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CPLQuarantineFeedbackMessage initWithClass:reason:libraryIdentifier:](v8, "initWithClass:reason:libraryIdentifier:", a3, v13, v11);

  -[NSMutableArray addObject:](self->_quarantineMessages, "addObject:", v12);
}

- (BOOL)_quarantineRejectedRecords:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CFIndex v13;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v15;
  uint64_t v16;
  __CFDictionary *v17;
  __CFDictionary *v18;
  void *v19;
  id v20;
  __CFDictionary *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  int v27;
  BOOL v28;
  _QWORD v30[4];
  id v31;
  CPLEngineQuarantinedRecords *v32;
  __CFDictionary *v33;
  uint64_t *v34;
  _BYTE *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  __CFDictionary *v42;
  id v43;
  _QWORD v44[4];
  __CFDictionary *v45;
  __CFDictionary *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 1;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushRepository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_19388();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(v6, "count");
      objc_msgSend(v6, "rejectedDescriptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n\t"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "%lu records have been rejected too many times. Quarantining them:\n\t%{public}@", buf, 0x16u);

    }
  }
  v13 = objc_msgSend(v6, "count");
  Mutable = CFDictionaryCreateMutable(0, v13, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v15 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v16 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke;
  v44[3] = &unk_1E60DCF00;
  v17 = Mutable;
  v45 = v17;
  v18 = v15;
  v46 = v18;
  v19 = (void *)MEMORY[0x1B5E08DC4](v44);
  v40[0] = v16;
  v40[1] = 3221225472;
  v40[2] = __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_2;
  v40[3] = &unk_1E60DCF28;
  v20 = v8;
  v41 = v20;
  v21 = v17;
  v42 = v21;
  v22 = v19;
  v43 = v22;
  v23 = (void *)MEMORY[0x1B5E08DC4](v40);
  v36[0] = v16;
  v36[1] = 3221225472;
  v36[2] = __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_37;
  v36[3] = &unk_1E60DCF50;
  v36[4] = self;
  v24 = v22;
  v38 = v24;
  v25 = v20;
  v37 = v25;
  v26 = v23;
  v39 = v26;
  objc_msgSend(v6, "enumerateRecordsAndReasonsUsingBlock:", v36);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v52 = __Block_byref_object_copy__19398;
  v53 = __Block_byref_object_dispose__19399;
  v54 = 0;
  v27 = *((unsigned __int8 *)v48 + 24);
  if (*((_BYTE *)v48 + 24))
  {
    v30[0] = v16;
    v30[1] = 3221225472;
    v30[2] = __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_41;
    v30[3] = &unk_1E60DCF78;
    v31 = v6;
    v32 = self;
    v34 = &v47;
    v35 = buf;
    v33 = v18;
    -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v21, "enumerateKeysAndObjectsUsingBlock:", v30);

    v27 = *((unsigned __int8 *)v48 + 24);
  }
  if (a4 && !v27)
  {
    *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v27 = *((unsigned __int8 *)v48 + 24);
  }
  v28 = v27 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v47, 8);
  return v28;
}

- (BOOL)bumpRejectedRecords:(id)a3 error:(id *)a4
{
  id v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CPLRejectedRecords *newRejectedRecords;
  BOOL v14;
  BOOL v15;
  unint64_t newRejectedCount;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!+[CPLEngineQuarantinedRecords quarantineRetryCount](CPLEngineQuarantinedRecords, "quarantineRetryCount"))
  {
    v14 = -[CPLEngineQuarantinedRecords _quarantineRejectedRecords:error:](self, "_quarantineRejectedRecords:error:", v7, a4);
LABEL_15:
    v15 = v14;
    goto LABEL_16;
  }
  if (!v7)
  {
    v14 = -[CPLEngineQuarantinedRecords resetRejectedRecordsWithError:](self, "resetRejectedRecordsWithError:", a4);
    goto LABEL_15;
  }
  if (self->_rejectedRecords && (objc_msgSend(v7, "rejectsTheSameRecordsAs:") & 1) != 0)
  {
    self->_rejectedRecordsHasChanges = 1;
    v8 = self->_rejectedCount + 1;
    self->_newRejectedCount = v8;
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_19388();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(v7, "count");
        newRejectedCount = self->_newRejectedCount;
        objc_msgSend(v7, "rejectedDescriptions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n\t"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v19 = v10;
        v20 = 2048;
        v21 = newRejectedCount;
        v22 = 2114;
        v23 = v12;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "%lu records have been rejected (%lu):\n\t%{public}@", buf, 0x20u);

      }
      v8 = self->_newRejectedCount;
    }
    if (v8 <= +[CPLEngineQuarantinedRecords quarantineRetryCount](CPLEngineQuarantinedRecords, "quarantineRetryCount"))
    {
      objc_storeStrong((id *)&self->_newRejectedRecords, self->_rejectedRecords);
    }
    else
    {
      if (!-[CPLEngineQuarantinedRecords _quarantineRejectedRecords:error:](self, "_quarantineRejectedRecords:error:", v7, a4))
      {
        v15 = 0;
        goto LABEL_16;
      }
      self->_newRejectedCount = 0;
      newRejectedRecords = self->_newRejectedRecords;
      self->_newRejectedRecords = 0;

    }
    v15 = 1;
  }
  else
  {
    v15 = 1;
    self->_rejectedRecordsHasChanges = 1;
    objc_storeStrong((id *)&self->_newRejectedRecords, a3);
    self->_newRejectedCount = 1;
  }
LABEL_16:

  return v15;
}

- (BOOL)resetRejectedRecordsWithError:(id *)a3
{
  CPLRejectedRecords *newRejectedRecords;

  if (self->_rejectedRecords)
  {
    self->_rejectedRecordsHasChanges = 1;
    self->_newRejectedCount = 0;
    newRejectedRecords = self->_newRejectedRecords;
    self->_newRejectedRecords = 0;

  }
  return 1;
}

- (void)writeTransactionDidFail
{
  CPLRejectedRecords *newRejectedRecords;
  NSMutableArray *quarantineMessages;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLEngineQuarantinedRecords;
  -[CPLEngineStorage writeTransactionDidFail](&v5, sel_writeTransactionDidFail);
  if (self->_rejectedRecordsHasChanges)
  {
    self->_rejectedRecordsHasChanges = 0;
    newRejectedRecords = self->_newRejectedRecords;
    self->_newRejectedRecords = 0;

    self->_newRejectedCount = 0;
  }
  quarantineMessages = self->_quarantineMessages;
  self->_quarantineMessages = 0;

}

- (void)writeTransactionDidSucceed
{
  CPLRejectedRecords *newRejectedRecords;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *quarantineMessages;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPLEngineQuarantinedRecords;
  -[CPLEngineStorage writeTransactionDidSucceed](&v8, sel_writeTransactionDidSucceed);
  if (self->_rejectedRecordsHasChanges)
  {
    self->_rejectedRecordsHasChanges = 0;
    objc_storeStrong((id *)&self->_rejectedRecords, self->_newRejectedRecords);
    self->_rejectedCount = self->_newRejectedCount;
    newRejectedRecords = self->_newRejectedRecords;
    self->_newRejectedRecords = 0;

    self->_newRejectedCount = 0;
  }
  if (-[NSMutableArray count](self->_quarantineMessages, "count"))
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "engineLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportMessages:", self->_quarantineMessages);

  }
  quarantineMessages = self->_quarantineMessages;
  self->_quarantineMessages = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quarantineMessages, 0);
  objc_storeStrong((id *)&self->_newRejectedRecords, 0);
  objc_storeStrong((id *)&self->_rejectedRecords, 0);
}

void __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v9);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", a4, v9);
  }

}

void __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __objc2_meth_list **p_class_meths;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  __objc2_meth_list **v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = *(void **)(a1 + 32);
  v5 = 0x1E60D4000uLL;
  v6 = objc_opt_class();
  v29 = v3;
  objc_msgSend(v3, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allChangesWithClass:relatedScopedIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v32;
    p_class_meths = &OBJC_PROTOCOL___CPLNetworkWatcherDelegate.class_meths;
    *(_QWORD *)&v10 = 138412546;
    v28 = v10;
    v14 = CFSTR("Master has been quarantined");
    do
    {
      v15 = 0;
      v30 = v11;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v15), "scopedIdentifier", v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          if (!*((_BYTE *)p_class_meths + 3376))
          {
            __CPLStorageOSLogDomain_19388();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v29, "scopedIdentifier");
              v19 = a1;
              v20 = v12;
              v21 = v8;
              v22 = v14;
              v23 = p_class_meths;
              v24 = v5;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v28;
              v36 = v16;
              v37 = 2112;
              v38 = v25;
              _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_ERROR, "Automatically adding %@ to quarantine because %@ has been quarantined", buf, 0x16u);

              v5 = v24;
              p_class_meths = v23;
              v14 = v22;
              v8 = v21;
              v12 = v20;
              a1 = v19;
              v11 = v30;
            }

          }
          v26 = *(_QWORD *)(a1 + 48);
          v27 = objc_opt_class();
          (*(void (**)(uint64_t, void *, const __CFString *, uint64_t))(v26 + 16))(v26, v16, v14, v27);
        }

        ++v15;
      }
      while (v11 != v15);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v11);
  }

}

void __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_37(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)a1[4];
  v7 = a3;
  objc_msgSend(v6, "_sendQuarantineFeedbackWithRecordClass:reason:", objc_opt_class(), v7);
  objc_msgSend(v5, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1[6];
  v10 = objc_opt_class();
  (*(void (**)(uint64_t, void *, id, uint64_t))(v9 + 16))(v9, v8, v7, v10);

  if (objc_msgSend(v5, "isAssetChange") && objc_msgSend(v5, "isFullRecord"))
  {
    v11 = (void *)a1[5];
    objc_msgSend(v5, "relatedScopedIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "changeWithScopedIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && objc_msgSend(v13, "isFullRecord"))
    {
      objc_msgSend(v13, "scopedIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_19388();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "scopedIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412546;
          v20 = v14;
          v21 = 2112;
          v22 = v16;
          _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Automatically adding %@ to quarantine because %@ has been quarantined", (uint8_t *)&v19, 0x16u);

        }
      }
      v17 = a1[6];
      v18 = objc_opt_class();
      (*(void (**)(uint64_t, void *, const __CFString *, uint64_t))(v17 + 16))(v17, v14, CFSTR("Asset has been quarantined"), v18);
      (*(void (**)(void))(a1[7] + 16))();

    }
  }
  else if (objc_msgSend(v5, "isMasterChange") && objc_msgSend(v5, "isFullRecord"))
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __64__CPLEngineQuarantinedRecords__quarantineRejectedRecords_error___block_invoke_41(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "recordWithScopedIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((objc_msgSend(v9, "isDelete") & 1) != 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_19388();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v10;
          _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Removing %@ from push repository", buf, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 40), "engineStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pushRepository");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v14 + 40);
      v15 = objc_msgSend(v13, "discardChangeWithScopedIdentifier:error:", v7, &obj);
      objc_storeStrong((id *)(v14 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v15;

    }
    else
    {
      v20 = *(void **)(a1 + 40);
      v21 = objc_opt_class();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v25 = *(id *)(v22 + 40);
      LOBYTE(v20) = objc_msgSend(v20, "addQuarantinedRecordWithScopedIdentifier:recordClass:reason:error:", v7, v21, v8, &v25);
      objc_storeStrong((id *)(v22 + 40), v25);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v20;
    }
  }
  else
  {
    v16 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7);
    v17 = *(void **)(a1 + 40);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v24 = *(id *)(v18 + 40);
    v19 = objc_msgSend(v17, "addQuarantinedRecordWithScopedIdentifier:recordClass:reason:error:", v7, v16, v8, &v24);
    objc_storeStrong((id *)(v18 + 40), v24);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v19;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a4 = 1;

}

+ (unint64_t)quarantineRetryCount
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("CPLQuarantineRetryCount"));

  return v3;
}

@end
