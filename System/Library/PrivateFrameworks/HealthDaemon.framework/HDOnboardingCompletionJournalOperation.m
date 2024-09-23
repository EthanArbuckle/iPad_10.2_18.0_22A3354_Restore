@implementation HDOnboardingCompletionJournalOperation

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v19 = 0;
        v13 = objc_msgSend(v12, "performOrJournalWithProfile:error:", v6, &v19);
        v14 = v19;
        if ((v13 & 1) == 0)
        {
          _HKInitializeLogging();
          v15 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v25 = v12;
            v26 = 2114;
            v27 = v14;
            _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform during journal merge: %{public}@", buf, 0x16u);
          }
          if ((objc_msgSend(v14, "hk_isTransactionInterruptedError") & 1) != 0)
          {

            goto LABEL_15;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "daemon");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "autoBugCaptureReporter");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "reportJournalFailureWithErrorDescription:provenance:error:", v16, 0, v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_15:

}

- (HDOnboardingCompletionJournalOperation)initWithCodableOnboardingCompletions:(id)a3 syncProvenance:(int64_t)a4
{
  id v7;
  HDOnboardingCompletionJournalOperation *v8;
  HDOnboardingCompletionJournalOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDOnboardingCompletionJournalOperation;
  v8 = -[HDOnboardingCompletionJournalOperation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_codableOnboardingCompletions, a3);
    v9->_syncProvenance = a4;
  }

  return v9;
}

- (BOOL)performOrJournalWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSArray *codableOnboardingCompletions;
  int64_t syncProvenance;
  uint64_t v10;
  id v11;
  NSArray *v12;
  NSArray *v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  HDOnboardingCompletionJournalOperation *v18;
  _QWORD v19[4];
  NSArray *v20;
  void *v21;
  int64_t v22;

  v6 = a3;
  objc_msgSend(v6, "onboardingCompletionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  codableOnboardingCompletions = self->_codableOnboardingCompletions;
  syncProvenance = self->_syncProvenance;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__HDOnboardingCompletionJournalOperation_performOrJournalWithProfile_error___block_invoke;
  v16[3] = &unk_1E6CECEC8;
  v17 = v6;
  v18 = self;
  v11 = v6;
  v12 = codableOnboardingCompletions;
  v13 = v12;
  if (v7)
  {
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __113__HDOnboardingCompletionManager__insertCodableOnboardingCompletions_syncProvenance_error_inaccessabilityHandler___block_invoke;
    v19[3] = &unk_1E6CF2658;
    v21 = v7;
    v22 = syncProvenance;
    v20 = v12;
    v14 = -[HDOnboardingCompletionManager _performWriteTransactionAndNotifyObserversWithError:block:inaccessibilityHandler:]((uint64_t)v7, (uint64_t)a4, v19, v16);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __76__HDOnboardingCompletionJournalOperation_performOrJournalWithProfile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addJournalEntry:error:", *(_QWORD *)(a1 + 40), a3);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *codableOnboardingCompletions;
  id v5;

  codableOnboardingCompletions = self->_codableOnboardingCompletions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", codableOnboardingCompletions, CFSTR("onboardingCompletions"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_syncProvenance, CFSTR("syncProvenance"));

}

- (HDOnboardingCompletionJournalOperation)initWithCoder:(id)a3
{
  id v4;
  HDOnboardingCompletionJournalOperation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *codableOnboardingCompletions;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDOnboardingCompletionJournalOperation;
  v5 = -[HDJournalEntry initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("onboardingCompletions"));
    v9 = objc_claimAutoreleasedReturnValue();
    codableOnboardingCompletions = v5->_codableOnboardingCompletions;
    v5->_codableOnboardingCompletions = (NSArray *)v9;

    v5->_syncProvenance = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("syncProvenance"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codableOnboardingCompletions, 0);
}

@end
