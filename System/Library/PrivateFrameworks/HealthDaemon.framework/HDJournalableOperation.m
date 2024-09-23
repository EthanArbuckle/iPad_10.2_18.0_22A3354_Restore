@implementation HDJournalableOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v18 = 0;
        v12 = objc_msgSend(v11, "performOrJournalWithProfile:error:", v6, &v18);
        v13 = v18;
        if ((v12 & 1) == 0)
        {
          _HKInitializeLogging();
          v14 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v24 = v11;
            v25 = 2114;
            v26 = v13;
            _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform during journal merge: %{public}@", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "daemon");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "autoBugCaptureReporter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "reportJournalFailureWithErrorDescription:provenance:error:", v15, 0, v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v8);
  }

}

- (BOOL)performOrJournalWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  char v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDJournalableOperation transactionContext](self, "transactionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__HDJournalableOperation_performOrJournalWithProfile_error___block_invoke;
  v15[3] = &unk_1E6CE7950;
  v15[4] = self;
  v16 = v6;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __60__HDJournalableOperation_performOrJournalWithProfile_error___block_invoke_2;
  v13[3] = &unk_1E6CECEC8;
  v13[4] = self;
  v14 = v16;
  v10 = v16;
  v11 = objc_msgSend(v7, "performTransactionWithContext:error:block:inaccessibilityHandler:", v8, a4, v15, v13);

  if ((v11 & 1) == 0)
    self->_didJournal = 0;

  return v11;
}

uint64_t __60__HDJournalableOperation_performOrJournalWithProfile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithProfile:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

uint64_t __60__HDJournalableOperation_performOrJournalWithProfile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend(*(id *)(a1 + 40), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addJournalEntry:error:", *(_QWORD *)(a1 + 32), a3);

  return v6;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)transactionContext
{
  return +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
}

- (BOOL)didJournal
{
  return self->_didJournal;
}

@end
