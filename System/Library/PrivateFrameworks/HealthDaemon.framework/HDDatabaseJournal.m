@implementation HDDatabaseJournal

- (void)_executeAtomically:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v3;
  void (**v4)(void);

  v4 = a2;
  if (a1)
  {
    v3 = a1 + 8;
    os_unfair_lock_lock(v3);
    v4[2]();
    os_unfair_lock_unlock(v3);
  }

}

- (HDDatabaseJournal)initWithType:(int64_t)a3 path:(id)a4
{
  id v7;
  HDDatabaseJournal *v8;
  HDDatabaseJournal *v9;
  uint64_t v10;
  NSURL *URL;
  uint64_t v12;
  OS_dispatch_queue *mergeQueue;
  NSString *lastInsertedEntryClassName;
  NSMutableDictionary *v15;
  NSMutableDictionary *journalMergeInterruptions;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v22;
  id v23;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseJournal.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != HDDatabaseJournalTypeDefault"));

  }
  v24.receiver = self;
  v24.super_class = (Class)HDDatabaseJournal;
  v8 = -[HDDatabaseJournal init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    URL = v9->_URL;
    v9->_URL = (NSURL *)v10;

    v9->_journalLock._os_unfair_lock_opaque = 0;
    HKCreateSerialDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    mergeQueue = v9->_mergeQueue;
    v9->_mergeQueue = (OS_dispatch_queue *)v12;

    v9->_progressLock._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v9->_interruptionLock._os_unfair_lock_opaque = 0;
    v9->_activeTransactionLock._os_unfair_lock_opaque = 0;
    v9->_journalStatus = 0;
    lastInsertedEntryClassName = v9->_lastInsertedEntryClassName;
    v9->_lastInsertedEntryClassName = 0;

    v9->_serializedDataEnumerationThreshold = 0x10000;
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    journalMergeInterruptions = v9->_journalMergeInterruptions;
    v9->_journalMergeInterruptions = v15;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "fileExistsAtPath:isDirectory:", v7, 0) & 1) == 0)
    {
      v23 = 0;
      v18 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v23);
      v19 = v23;
      if ((v18 & 1) == 0)
      {
        _HKInitializeLogging();
        v20 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v26 = v7;
          v27 = 2114;
          v28 = v19;
          _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Error creating journal directory %{public}@: %{public}@", buf, 0x16u);
        }
      }

    }
  }

  return v9;
}

- (HDDatabaseJournal)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[HDJournalChapter close](self->_currentJournalChapter, "close");
  v3.receiver = self;
  v3.super_class = (Class)HDDatabaseJournal;
  -[HDDatabaseJournal dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t journalStatus;
  __CFString *v7;
  int v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  HDStringFromDatabaseJournalType(self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  journalStatus = self->_journalStatus;
  if (journalStatus >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected (%ld)"), self->_journalStatus);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E6CF9970[journalStatus];
  }
  v8 = -[HDJournalChapter isOpen](self->_currentJournalChapter, "isOpen");
  v9 = CFSTR("Closed");
  if (v8)
    v9 = CFSTR("Open");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, %@, %@, %@>"), v4, self, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)lock
{
  os_unfair_lock_lock(&self->_journalLock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_journalLock);
}

- (BOOL)addJournalEntries:(id)a3 profile:(id)a4 error:(id *)a5
{
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  HDDatabaseJournalDatabase *v22;
  void *v23;
  HDJournalChapter *v24;
  HDJournalChapter *currentJournalChapter;
  NSObject *v26;
  int v27;
  id v28;
  HDJournalChapter *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  HDJournalChapter *v39;
  char v40;
  id v41;
  NSObject *v42;
  id v43;
  void *v44;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  HDJournalChapter *v52;
  id *v53;
  id v54;
  id v55;
  id v56;
  id obj;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  _QWORD v67[4];
  id v68;
  HDDatabaseJournal *v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v54 = a4;
  os_unfair_lock_assert_owner(&self->_journalLock);
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 100, CFSTR("Journal has already been invalidated."));
    v8 = 0;
    goto LABEL_55;
  }
  v53 = a5;
  self->_journalStatus = 2;
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
  {
    v46 = v9;
    v47 = objc_msgSend(v55, "count");
    -[NSURL path](self->_URL, "path");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v77 = v47;
    v78 = 2114;
    v79 = (uint64_t)v48;
    _os_log_debug_impl(&dword_1B7802000, v46, OS_LOG_TYPE_DEBUG, "Appending %lu journal entries to %{public}@", buf, 0x16u);

  }
  -[HDDatabaseJournal maximumJournalBytes](self, "maximumJournalBytes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v63 = -[HDDatabaseJournal sizeOnDisk](self, "sizeOnDisk");
  else
    v63 = 0;
  v56 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v55;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
  if (!v61)
  {
    v58 = 0;
    v62 = 0;
    goto LABEL_44;
  }
  v58 = 0;
  v62 = 0;
  v60 = *(_QWORD *)v73;
  v59 = v10;
LABEL_10:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v73 != v60)
      objc_enumerationMutation(obj);
    v12 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v11);
    v13 = (void *)MEMORY[0x1BCCACAC4]();
    v71 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v71);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v71;
    if (v10)
    {
      v16 = objc_msgSend(v10, "unsignedLongValue");
      if (objc_msgSend(v14, "length") + v63 > v16)
        break;
    }
    v64 = v11;
    v65 = v13;
    if (v14)
    {
      v17 = 1;
      while (1)
      {
        v18 = v17;
        v19 = objc_opt_class();
        v70 = v15;
        v20 = v14;
        if (objc_msgSend(v20, "length"))
        {
          if ((-[HDJournalChapter canAppendData:](self->_currentJournalChapter, "canAppendData:", v20) & 1) == 0)
            -[HDJournalChapter close](self->_currentJournalChapter, "close");
          if ((-[HDJournalChapter isOpen](self->_currentJournalChapter, "isOpen") & 1) != 0)
          {
LABEL_25:
            LOBYTE(v21) = -[HDJournalChapter appendData:entryClass:error:](self->_currentJournalChapter, "appendData:entryClass:error:", v20, v19, &v70);
            goto LABEL_29;
          }
          +[HDJournalChapterEnumerator nextJournalChapterNameForURL:](HDJournalChapterEnumerator, "nextJournalChapterNameForURL:", self->_URL);
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = [HDDatabaseJournalDatabase alloc];
            -[NSURL URLByAppendingPathComponent:](self->_URL, "URLByAppendingPathComponent:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[HDDatabaseJournalDatabase initWithURL:](v22, "initWithURL:", v23);
            currentJournalChapter = self->_currentJournalChapter;
            self->_currentJournalChapter = v24;

            _HKInitializeLogging();
            v26 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
            {
              v29 = self->_currentJournalChapter;
              *(_DWORD *)buf = 138543362;
              v77 = (uint64_t)v29;
              _os_log_debug_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEBUG, "Creating new journal chapter %{public}@", buf, 0xCu);
            }
            v27 = -[HDJournalChapter createAndOpenForWritingWithError:](self->_currentJournalChapter, "createAndOpenForWritingWithError:", &v70);

            if (v27)
              goto LABEL_25;
            LOBYTE(v21) = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v70, 102, CFSTR("Unable to create journal name"));
          }
        }
        else
        {
          LOBYTE(v21) = 1;
        }
LABEL_29:

        v28 = v70;
        if ((v21 & 1) != 0)
        {
          ++v58;
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "integerValue");
          v34 = objc_msgSend(v20, "length");
          if (v33 <= v34)
            v35 = v34;
          else
            v35 = v33;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v35 >> 10);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v36, v31);

          v63 += objc_msgSend(v20, "length");
          goto LABEL_39;
        }
        v17 = 0;
        v15 = v28;
        if ((v18 & 1) == 0)
          goto LABEL_33;
      }
    }
    v28 = v15;
LABEL_33:
    if (!v62)
    {
      v28 = v28;
      v62 = v28;
    }
LABEL_39:
    v10 = v59;

    objc_autoreleasePoolPop(v65);
    v11 = v64 + 1;
    if (v64 + 1 == v61)
    {
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
      if (!v61)
        goto LABEL_44;
      goto LABEL_10;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 123, CFSTR("Cannot append journal entry of %lu bytes: current size is %lu and maximum is %zu"), objc_msgSend(v14, "length"), v63, v16);
  v37 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v13);
  v62 = (void *)v37;
LABEL_44:

  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __53__HDDatabaseJournal_addJournalEntries_profile_error___block_invoke;
  v67[3] = &unk_1E6CF9850;
  v68 = v54;
  v69 = self;
  objc_msgSend(v56, "enumerateKeysAndObjectsUsingBlock:", v67);
  v8 = v62 == 0;
  if (v62)
  {
    _HKInitializeLogging();
    v38 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v49 = v38;
      v50 = objc_msgSend(obj, "count");
      -[NSURL path](self->_URL, "path");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v77 = v58;
      v78 = 2048;
      v79 = v50;
      v80 = 2114;
      v81 = v51;
      v82 = 2114;
      v83 = v62;
      _os_log_error_impl(&dword_1B7802000, v49, OS_LOG_TYPE_ERROR, "Added %lu of %lu entries to %{public}@, error: %{public}@", buf, 0x2Au);

    }
  }
  v39 = self->_currentJournalChapter;
  v66 = 0;
  v40 = -[HDJournalChapter flushDataToDisk:](v39, "flushDataToDisk:", &v66);
  v41 = v66;
  if ((v40 & 1) == 0)
  {
    _HKInitializeLogging();
    v42 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v52 = self->_currentJournalChapter;
      *(_DWORD *)buf = 138543618;
      v77 = (uint64_t)v52;
      v78 = 2114;
      v79 = (uint64_t)v41;
      _os_log_error_impl(&dword_1B7802000, v42, OS_LOG_TYPE_ERROR, "Failed to flush data to %{public}@: %{public}@", buf, 0x16u);
    }
  }
  v43 = v62;
  v44 = v43;
  if (v62)
  {
    if (v53)
      *v53 = objc_retainAutorelease(v43);
    else
      _HKLogDroppedError();
  }

LABEL_55:
  return v8;
}

void __53__HDDatabaseJournal_addJournalEntries_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "daemon");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "analyticsSubmissionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database_reportJournalEntryInsertedForJournal:entryClass:entrySize:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), v7, v6);

}

- (BOOL)performMergeTransactionWithProfile:(id)a3 transactionContext:(id)a4 error:(id *)a5 block:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HDMutableDatabaseTransactionContext *v16;
  HDMutableDatabaseTransactionContext *v17;
  char v18;
  void *v20;

  v11 = a4;
  v12 = a6;
  objc_msgSend(a3, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseJournal.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database != nil"));

    if (self)
      goto LABEL_3;
LABEL_9:
    v17 = 0;
    goto LABEL_7;
  }
  if (!self)
    goto LABEL_9;
LABEL_3:
  v14 = (void *)objc_msgSend(v11, "mutableCopy");
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  v17 = v16;

  -[HDMutableDatabaseTransactionContext setSkipJournalMerge:](v17, "setSkipJournalMerge:", 1);
  -[HDMutableDatabaseTransactionContext setJournalType:](v17, "setJournalType:", self->_type);
  -[HDMutableDatabaseTransactionContext setRequiresWrite:](v17, "setRequiresWrite:", 1);
  -[HDMutableDatabaseTransactionContext setRequiresProtectedData:](v17, "setRequiresProtectedData:", 1);
LABEL_7:
  v18 = objc_msgSend(v13, "performTransactionWithContext:error:block:inaccessibilityHandler:", v17, a5, v12, 0);

  return v18;
}

- (id)progressForJournalMerge
{
  os_unfair_lock_s *p_progressLock;
  NSProgress *v4;
  NSProgress *v5;
  NSProgress *progressLock_observableProgress;

  p_progressLock = &self->_progressLock;
  os_unfair_lock_lock(&self->_progressLock);
  if (self->_progressLock_observableProgress)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "hd_progressMirroringProgress:");
    v4 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_progressLock);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
    v5 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    progressLock_observableProgress = self->_progressLock_observableProgress;
    self->_progressLock_observableProgress = v5;

    os_unfair_lock_unlock(p_progressLock);
    v4 = self->_progressLock_observableProgress;
  }
  return v4;
}

- (BOOL)mergeWithProfile:(id)a3 shouldContinueHandler:(id)a4
{
  return -[HDDatabaseJournal mergeWithProfile:activity:shouldContinueHandler:](self, "mergeWithProfile:activity:shouldContinueHandler:", a3, 0, a4);
}

- (BOOL)mergeWithProfile:(id)a3 activity:(id)a4 shouldContinueHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  HDDatabaseJournal *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __69__HDDatabaseJournal_mergeWithProfile_activity_shouldContinueHandler___block_invoke;
  v20 = &unk_1E6CF9878;
  v21 = self;
  v25 = &v31;
  v11 = v8;
  v22 = v11;
  v12 = v9;
  v23 = v12;
  v13 = v10;
  v24 = v13;
  v26 = &v27;
  -[HDDatabaseJournal _executeAtomically:]((os_unfair_lock_s *)self, &v17);
  if (*((_BYTE *)v32 + 24))
  {
    if (*((_BYTE *)v28 + 24))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "databaseJournalMergeDidComplete:", self, v17, v18, v19, v20, v21, v22, v23);

      v15 = *((_BYTE *)v32 + 24) != 0;
    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

void __69__HDDatabaseJournal_mergeWithProfile_activity_shouldContinueHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  os_signpost_id_t v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HDMutableDatabaseTransactionContext *v46;
  int v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  id v55;
  int v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  char v63;
  NSObject *v64;
  char v66;
  BOOL v67;
  NSObject *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  const char *v73;
  id v74;
  id v75;
  os_unfair_lock_s *lock;
  id v77;
  id v78;
  void *v79;
  os_unfair_lock_s *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  uint64_t v85;
  id v86;
  id v87;
  uint64_t v88;
  id v89;
  HDJournalChapterEnumerator *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  __CFString *v94;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  int v104;
  uint8_t v105[4];
  void *v106;
  __int16 v107;
  id v108;
  __int16 v109;
  void *v110;
  _BYTE buf[24];
  void *v112;
  __int128 v113;
  id v114;
  id v115;
  id v116;
  uint64_t *v117;
  os_signpost_id_t v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 65))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  else if (*(_QWORD *)(v2 + 56) != 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentProtectionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "observedState");

    if (v5 == 2)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v7;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Trying to merge journals when device is locked", buf, 0xCu);
      }
    }
    else
    {
      +[HKDaemonTransaction transactionWithOwner:](HDDaemonTransaction, "transactionWithOwner:", *(_QWORD *)(a1 + 32));
      v82 = (id)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
      v8 = *(_QWORD *)(a1 + 32);
      v85 = *(_QWORD *)(a1 + 48);
      v9 = *(void **)(a1 + 56);
      v89 = *(id *)(a1 + 40);
      v86 = v9;
      if (v8)
      {
        v90 = -[HDJournalChapterEnumerator initWithURL:]([HDJournalChapterEnumerator alloc], "initWithURL:", *(_QWORD *)(v8 + 136));
        v95 = v8;
        if (-[HDJournalChapterEnumerator hasJournalChapters](v90, "hasJournalChapters"))
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "database");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = 0;
          objc_msgSend(v11, "takeAccessibilityAssertionWithOwnerIdentifier:shouldPerformTransaction:timeout:error:", v79, 0, &v98, 600.0);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v98;

          if (v84)
          {
            v97 = 0;
            v12 = -[HDJournalChapterEnumerator loadSortedJournalChaptersWithError:](v90, "loadSortedJournalChaptersWithError:", &v97);
            v77 = v97;
            if (v12)
            {
              v13 = v8;
              lock = (os_unfair_lock_s *)(v8 + 8);
              os_unfair_lock_lock((os_unfair_lock_t)(v8 + 8));
              if (!*(_QWORD *)(v8 + 16))
              {
                objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
                v14 = objc_claimAutoreleasedReturnValue();
                v15 = *(void **)(v8 + 16);
                *(_QWORD *)(v8 + 16) = v14;

                v13 = v8;
              }
              v16 = *(void **)(v13 + 24);
              if (v16)
              {
                objc_msgSend(*(id *)(v8 + 24), "setTotalUnitCount:", -[HDJournalChapterEnumerator totalJournalChapterCount](v90, "totalJournalChapterCount")+ objc_msgSend(v16, "completedUnitCount"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -[HDJournalChapterEnumerator totalJournalChapterCount](v90, "totalJournalChapterCount"));
                v21 = objc_claimAutoreleasedReturnValue();
                v22 = *(void **)(v8 + 24);
                *(_QWORD *)(v8 + 24) = v21;

                objc_msgSend(*(id *)(v8 + 16), "addChild:withPendingUnitCount:", *(_QWORD *)(v8 + 24), 1);
              }
              v75 = *(id *)(v8 + 24);
              os_unfair_lock_unlock(lock);
              if (!-[HDJournalChapterEnumerator hasMoreJournalChapters](v90, "hasMoreJournalChapters"))
              {
                v66 = 0;
                goto LABEL_93;
              }
              v80 = (os_unfair_lock_s *)(v8 + 40);
LABEL_29:
              v96 = 0;
              -[HDJournalChapterEnumerator nextOpenJournalChapterError:](v90, "nextOpenJournalChapterError:", &v96);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = v96;
              if (v81)
              {
                v88 = 0;
                v23 = 0;
                while (1)
                {
                  os_unfair_lock_lock(v80);
                  os_unfair_lock_unlock(v80);
                  v92 = v23;
                  if (v23 < 1)
                  {
                    v94 = 0;
                  }
                  else
                  {
                    if (v85)
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v23 + 1);
                    else
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%ld / %ld)"), v23 + 1, 10);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Retrying, attempt %@"), v24);
                    v94 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  }
                  if (v88 >= 1)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Continuing (%ld)"), v88);
                    v25 = objc_claimAutoreleasedReturnValue();

                    v94 = (__CFString *)v25;
                  }
                  _HKInitializeLogging();
                  v26 = (void *)*MEMORY[0x1E0CB52B0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
                  {
                    if (v94)
                      v27 = v94;
                    else
                      v27 = CFSTR("Starting");
                    v28 = v26;
                    v29 = -[HDJournalChapterEnumerator currentJournalChapterIndex](v90, "currentJournalChapterIndex");
                    v30 = -[HDJournalChapterEnumerator totalJournalChapterCount](v90, "totalJournalChapterCount");
                    *(_DWORD *)buf = 138413058;
                    *(_QWORD *)&buf[4] = v27;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v81;
                    *(_WORD *)&buf[22] = 2048;
                    v112 = (void *)v29;
                    LOWORD(v113) = 2048;
                    *(_QWORD *)((char *)&v113 + 2) = v30;
                    _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEFAULT, "%@ journal merge for %{public}@ (%ld of %ld)", buf, 0x2Au);

                  }
                  v31 = v81;
                  v32 = v89;
                  v91 = v84;
                  v33 = v86;
                  v34 = objc_alloc_init(MEMORY[0x1E0C99D68]);
                  v35 = _HKLogSignpostIDGenerate();
                  _HKInitializeLogging();
                  v36 = (void *)*MEMORY[0x1E0CB52B0];
                  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52B0]))
                  {
                    v37 = v36;
                    v38 = v37;
                    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
                    {
                      objc_msgSend(v31, "name");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543362;
                      *(_QWORD *)&buf[4] = v39;
                      _os_signpost_emit_with_name_impl(&dword_1B7802000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v35, "merge-journal-chapter", "chapter=%{public}@", buf, 0xCu);

                    }
                  }
                  v101 = 0;
                  v102 = &v101;
                  v103 = 0x2020000000;
                  v104 = 0;
                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __95__HDDatabaseJournal__mergeJournalChapter_profile_accessibilityAssertion_shouldContinueHandler___block_invoke;
                  v112 = &unk_1E6CF9910;
                  *(_QWORD *)&v113 = v95;
                  v117 = &v101;
                  v87 = v31;
                  *((_QWORD *)&v113 + 1) = v87;
                  v118 = v35;
                  v40 = v32;
                  v114 = v40;
                  v83 = v33;
                  v116 = v83;
                  v41 = v34;
                  v115 = v41;
                  v42 = _Block_copy(buf);
                  objc_msgSend(v40, "dataManager");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "openObserverTransaction");

                  objc_msgSend(v40, "userDomainConceptManager");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "openObserverTransaction");

                  v45 = *(void **)(v95 + 72);
                  *(_QWORD *)(v95 + 72) = 0;

                  v46 = objc_alloc_init(HDMutableDatabaseTransactionContext);
                  -[HDMutableDatabaseTransactionContext setCacheScope:](v46, "setCacheScope:", 1);
                  -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v46, "addAccessibilityAssertion:", v91);
                  v100 = 0;
                  v47 = objc_msgSend((id)v95, "performMergeTransactionWithProfile:transactionContext:error:block:", v40, v46, &v100, v42);
                  v48 = v100;
                  -[HDDatabaseJournal _setActiveTransactionAndReturnInterrupted:](v95, 0);
                  objc_msgSend(v40, "dataManager");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "closeObserverTransaction");

                  objc_msgSend(v40, "userDomainConceptManager");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "closeObserverTransaction");

                  _HKInitializeLogging();
                  v51 = (void *)*MEMORY[0x1E0CB52B0];
                  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52B0]))
                  {
                    v52 = v51;
                    v53 = v52;
                    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
                    {
                      objc_msgSend(v87, "name");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v105 = 138543618;
                      v106 = v54;
                      v107 = 1024;
                      LODWORD(v108) = v47;
                      _os_signpost_emit_with_name_impl(&dword_1B7802000, v53, OS_SIGNPOST_INTERVAL_END, v35, "merge-journal-chapter", "chapter=%{public}@ success=%{BOOL}d", v105, 0x12u);

                    }
                  }
                  if (v47)
                  {
                    if ((*((_DWORD *)v102 + 6) - 2) > 2
                      || (objc_msgSend(*(id *)(v95 + 144), "close"), *((_DWORD *)v102 + 6) == 4))
                    {
                      v55 = v48;
                    }
                    else
                    {
                      objc_msgSend(v87, "close");
                      v99 = v48;
                      v63 = objc_msgSend(v87, "removeWithError:", &v99);
                      v55 = v99;

                      if ((v63 & 1) == 0)
                      {
                        _HKInitializeLogging();
                        v64 = *MEMORY[0x1E0CB52B0];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v105 = 138543618;
                          v106 = v81;
                          v107 = 2114;
                          v108 = v55;
                          _os_log_error_impl(&dword_1B7802000, v64, OS_LOG_TYPE_ERROR, "An error occurred while removing %{public}@: %{public}@", v105, 0x16u);
                        }
                      }
                    }
                    v56 = *((_DWORD *)v102 + 6);
                    v48 = v55;
                  }
                  else if (objc_msgSend(v48, "hk_isTransactionInterruptedError"))
                  {
                    _HKInitializeLogging();
                    v57 = (id)*MEMORY[0x1E0CB52B0];
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(*(id *)(v95 + 136), "path");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      v59 = *(void **)(v95 + 72);
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" with original error: %@"), v48);
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v105 = 138543874;
                      v106 = v58;
                      v107 = 2114;
                      v108 = v59;
                      v109 = 2112;
                      v110 = v60;
                      _os_log_impl(&dword_1B7802000, v57, OS_LOG_TYPE_DEFAULT, "Journal merge transaction for %{public}@ (%{public}@) was interrupted%@", v105, 0x20u);

                    }
                    v56 = 1;
                  }
                  else
                  {
                    _HKInitializeLogging();
                    v61 = *MEMORY[0x1E0CB52B0];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v105 = 138543618;
                      v106 = v81;
                      v107 = 2114;
                      v108 = v48;
                      _os_log_error_impl(&dword_1B7802000, v61, OS_LOG_TYPE_ERROR, "Merge transaction aborted for %{public}@; bailing out of journal merge: %{public}@",
                        v105,
                        0x16u);
                    }
                    v56 = 0;
                  }

                  _Block_object_dispose(&v101, 8);
                  if (v56 == 1)
                  {
                    v88 = 0;
                    v93 = v92 + 1;
                  }
                  else
                  {
                    if (v56 != 4)
                    {
                      if (v56)
                      {

                        if (v92 <= 9 || v85 != 0)
                        {
                          if (v75)
                            objc_msgSend(v75, "setCompletedUnitCount:", objc_msgSend(v75, "completedUnitCount") + 1);

                          v66 = 0;
                          if (-[HDJournalChapterEnumerator hasMoreJournalChapters](v90, "hasMoreJournalChapters"))
                            goto LABEL_29;
                          goto LABEL_93;
                        }
                      }
                      else
                      {

                        v67 = v85 != 0;
                        if (v92 < 10)
                          v67 = 1;
                        if (v67)
                          goto LABEL_92;
                      }
LABEL_91:
                      _HKInitializeLogging();
                      v68 = *MEMORY[0x1E0CB52B0];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
                        goto LABEL_92;
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v81;
                      v73 = "Used maximum retry attempts for %@";
                      goto LABEL_101;
                    }
                    v93 = 0;
                    ++v88;
                  }

                  v23 = v93;
                  if (v93 >= 10 && v85 == 0)
                    goto LABEL_91;
                }
              }
              _HKInitializeLogging();
              v68 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v74;
                v73 = "Could not get next journal chapter %{public}@";
LABEL_101:
                _os_log_error_impl(&dword_1B7802000, v68, OS_LOG_TYPE_ERROR, v73, buf, 0xCu);
              }
LABEL_92:

              v66 = 1;
LABEL_93:
              objc_msgSend(v84, "invalidate");
              -[HDJournalChapterEnumerator closeJournalChapters](v90, "closeJournalChapters");
              if ((v66 & 1) == 0)
              {
                os_unfair_lock_lock(lock);
                v69 = *(void **)(v95 + 24);
                *(_QWORD *)(v95 + 24) = 0;

                v70 = *(void **)(v95 + 16);
                *(_QWORD *)(v95 + 16) = 0;

                os_unfair_lock_unlock(lock);
                *(_QWORD *)(v95 + 56) = 1;
              }

              v18 = v66 ^ 1;
            }
            else
            {
              _HKInitializeLogging();
              v20 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v77;
                _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Failed to load sorted journal chapters: %{public}@", buf, 0xCu);
              }
              objc_msgSend(v84, "invalidate");
              v18 = 0;
            }

          }
          else
          {
            _HKInitializeLogging();
            v19 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v78;
              _os_log_debug_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEBUG, "Failed to acquire database accessibility assertion for journal merge: %{public}@", buf, 0xCu);
            }
            v18 = 0;
          }

        }
        else
        {
          if (*(_QWORD *)(v8 + 104) != 1)
          {
            _HKInitializeLogging();
            v17 = (void *)*MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
            {
              v71 = *(_QWORD *)(v8 + 136);
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v71;
              v72 = v17;
              _os_log_debug_impl(&dword_1B7802000, v72, OS_LOG_TYPE_DEBUG, "No journal chapter files to merge in %{public}@", buf, 0xCu);

            }
          }
          v18 = 1;
          *(_QWORD *)(v8 + 56) = 1;
        }

      }
      else
      {
        v18 = 0;
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v18;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 0;
      objc_msgSend(v82, "invalidate");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

    }
  }
}

- (void)interruptJournalMerge
{
  os_unfair_lock_s *p_interruptionsInfoLock;
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *journalMergeInterruptions;
  void *v8;
  NSObject *v9;
  int v10;
  HDDatabaseJournal *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_interruptionsInfoLock = &self->_interruptionsInfoLock;
  os_unfair_lock_lock(&self->_interruptionsInfoLock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", dispatch_queue_get_label(0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_journalMergeInterruptions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  journalMergeInterruptions = self->_journalMergeInterruptions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](journalMergeInterruptions, "setObject:forKey:", v8, v4);

  os_unfair_lock_unlock(p_interruptionsInfoLock);
  os_unfair_lock_lock(&self->_interruptionLock);
  os_unfair_lock_lock(&self->_activeTransactionLock);
  self->_interrupted = 1;
  if (self->_activeMergeTransaction)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = self;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Journal merge interruption requested on %@", (uint8_t *)&v10, 0x16u);
    }
    -[HDDatabaseTransaction requestTransactionInterruption](self->_activeMergeTransaction, "requestTransactionInterruption");
  }
  os_unfair_lock_unlock(&self->_activeTransactionLock);

}

- (void)resumeJournalMerge
{
  os_unfair_lock_s *p_activeTransactionLock;

  p_activeTransactionLock = &self->_activeTransactionLock;
  os_unfair_lock_lock(&self->_activeTransactionLock);
  self->_interrupted = 0;
  os_unfair_lock_unlock(p_activeTransactionLock);
  os_unfair_lock_unlock(&self->_interruptionLock);
}

- (void)invalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __31__HDDatabaseJournal_invalidate__block_invoke;
  v2[3] = &unk_1E6CE80E8;
  v2[4] = self;
  -[HDDatabaseJournal _executeAtomically:]((os_unfair_lock_s *)self, v2);
}

uint64_t __31__HDDatabaseJournal_invalidate__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "close");
}

- (int64_t)journalChapterCount
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__HDDatabaseJournal_journalChapterCount__block_invoke;
  v4[3] = &unk_1E6CE8110;
  v4[4] = self;
  v4[5] = &v5;
  -[HDDatabaseJournal _executeAtomically:]((os_unfair_lock_s *)self, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

int64_t __40__HDDatabaseJournal_journalChapterCount__block_invoke(uint64_t a1)
{
  int64_t result;

  result = +[HDJournalChapterEnumerator journalChapterCountForURL:](HDJournalChapterEnumerator, "journalChapterCountForURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)sizeOnDisk
{
  id v3;
  NSURL *URL;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSURL *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (self)
    URL = self->_URL;
  else
    URL = 0;
  v5 = *MEMORY[0x1E0C99A18];
  v6 = *MEMORY[0x1E0C99AC8];
  v46[0] = *MEMORY[0x1E0C99A18];
  v46[1] = v6;
  v30 = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = URL;
  objc_msgSend(v7, "arrayWithObjects:count:", v46, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v3;
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, v9, 0, &__block_literal_global_106);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v12)
  {
    v13 = v12;
    v31 = 0;
    v14 = *(_QWORD *)v38;
    while (1)
    {
      v15 = 0;
      v32 = v13;
      do
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v15);
        v35 = 0;
        v36 = 0;
        v17 = objc_msgSend(v16, "getResourceValue:forKey:error:", &v36, v5, &v35);
        v18 = v36;
        v19 = v35;
        if ((v17 & 1) == 0)
        {
          _HKInitializeLogging();
          v26 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v42 = v16;
            v43 = 2114;
            v44 = v19;
            _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_INFO, "Failed to retrieve file type during size computation: %{public}@ (%{public}@)", buf, 0x16u);
          }
LABEL_14:
          v25 = v19;
          goto LABEL_18;
        }
        if (!objc_msgSend(v18, "BOOLValue"))
          goto LABEL_14;
        v20 = v14;
        v21 = v5;
        v22 = v11;
        v33 = 0;
        v34 = 0;
        v23 = objc_msgSend(v16, "getResourceValue:forKey:error:", &v34, v30, &v33);
        v24 = v34;
        v25 = v33;

        if ((v23 & 1) != 0)
        {
          v31 += objc_msgSend(v24, "longLongValue");
        }
        else
        {
          _HKInitializeLogging();
          v27 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v42 = v16;
            v43 = 2114;
            v44 = v25;
            _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_INFO, "Failed to retrieve file size during size computation: %{public}@ (%{public}@)", buf, 0x16u);
          }
        }
        v11 = v22;

        v5 = v21;
        v14 = v20;
        v13 = v32;
LABEL_18:

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (!v13)
        goto LABEL_22;
    }
  }
  v31 = 0;
LABEL_22:

  return v31;
}

uint64_t __31__HDDatabaseJournal_sizeOnDisk__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
  {
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "Failed to enumerate URL during size computation: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

- (double)ageOfOldestJournal
{
  id v3;
  NSURL *URL;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSURL *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  char v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  char v23;
  id v24;
  id v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v31;
  HDDatabaseJournal *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  uint8_t buf[4];
  HDDatabaseJournal *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  double v51;
  _BYTE v52[128];
  _QWORD v53[5];

  v53[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (self)
    URL = self->_URL;
  else
    URL = 0;
  v5 = *MEMORY[0x1E0C99A18];
  v6 = *MEMORY[0x1E0C998E8];
  v53[0] = *MEMORY[0x1E0C99A18];
  v53[1] = v6;
  v34 = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = URL;
  objc_msgSend(v7, "arrayWithObjects:count:", v53, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __39__HDDatabaseJournal_ageOfOldestJournal__block_invoke;
  v43[3] = &unk_1E6CF98C0;
  v43[4] = self;
  v31 = v3;
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, v9, 0, v43);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v12)
  {
    v13 = v12;
    v32 = self;
    v14 = *(_QWORD *)v40;
    v15 = 0.0;
    v33 = *(_QWORD *)v40;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v37 = 0;
        v38 = 0;
        v18 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v38, v5, &v37);
        v19 = v38;
        v20 = v37;
        if ((v18 & 1) == 0)
        {
          _HKInitializeLogging();
          v28 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v45 = v32;
            v46 = 2114;
            v47 = v17;
            v48 = 2114;
            v49 = v20;
            _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to retrieve file type during journal age computation: %{public}@ (%{public}@)", buf, 0x20u);
          }
LABEL_17:
          v25 = v20;
          goto LABEL_21;
        }
        if (!objc_msgSend(v19, "BOOLValue"))
          goto LABEL_17;
        v21 = v5;
        v22 = v11;
        v35 = 0;
        v36 = 0;
        v23 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v36, v34, &v35);
        v24 = v36;
        v25 = v35;

        if ((v23 & 1) != 0)
        {
          objc_msgSend(v24, "timeIntervalSinceNow");
          if (v15 < v26)
            v15 = v26;
          _HKInitializeLogging();
          v27 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            v45 = v32;
            v46 = 2112;
            v47 = v17;
            v48 = 2114;
            v49 = v24;
            v50 = 2050;
            v51 = v15;
            _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Journal file %@ creation date %{public}@, oldest age %{public}f", buf, 0x2Au);
          }
        }
        else
        {
          _HKInitializeLogging();
          v29 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v45 = v32;
            v46 = 2114;
            v47 = v17;
            v48 = 2114;
            v49 = v25;
            _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to retrieve file size during journal age computation: %{public}@ (%{public}@)", buf, 0x20u);
          }
        }
        v11 = v22;

        v5 = v21;
        v14 = v33;
LABEL_21:

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      if (!v13)
        goto LABEL_25;
    }
  }
  v15 = 0.0;
LABEL_25:

  return v15;
}

uint64_t __39__HDDatabaseJournal_ageOfOldestJournal__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v9;
    v12 = 2114;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to enumerate URL during journal age computation: %{public}@ (%{public}@)", (uint8_t *)&v10, 0x20u);
  }

  return 1;
}

uint64_t __95__HDDatabaseJournal__mergeJournalChapter_profile_accessibilityAssertion_shouldContinueHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  id *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  unsigned int v18;
  NSObject *v19;
  id v20;
  void *v21;
  unint64_t v22;
  double v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (-[HDDatabaseJournal _setActiveTransactionAndReturnInterrupted:](*(_QWORD *)(a1 + 32), v5))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_transactionInterruptedError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v6);
      else
        _HKLogDroppedError();
    }

    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v25 = 1;
    goto LABEL_19;
  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "readVersionWithError:", a3);
  if (!v7)
  {
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v25 = 2;
LABEL_19:
    *(_DWORD *)(v24 + 24) = v25;
    goto LABEL_33;
  }
  v8 = v7;
  _HKInitializeLogging();
  v9 = (id *)MEMORY[0x1E0CB52B0];
  v10 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52B0]))
  {
    v11 = v10;
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 80);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      objc_msgSend(*(id *)(a1 + 40), "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v14;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "merge-journal-chapter-load-entries", "chapter=%{public}@", buf, 0xCu);

    }
  }
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v15 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v42 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __95__HDDatabaseJournal__mergeJournalChapter_profile_accessibilityAssertion_shouldContinueHandler___block_invoke_233;
  v33[3] = &unk_1E6CF98E8;
  v40 = *(_QWORD *)(a1 + 80);
  v34 = v15;
  v38 = *(id *)(a1 + 64);
  v39 = &v43;
  v35 = *(_QWORD *)(a1 + 32);
  v36 = *(id *)(a1 + 48);
  v41 = v8;
  v37 = v5;
  LODWORD(v16) = objc_msgSend(v34, "enumerateEntriesWithProfile:transaction:error:handler:", v16, v37, &v42, v33);
  v17 = v42;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v16;
  v18 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v18 < 2)
  {
    _HKInitializeLogging();
    v19 = *v9;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      HDStringFromJournalProcessingResult(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v48 = v26;
      v49 = 2114;
      v50 = v27;
      v51 = 2114;
      v52 = *(double *)&v17;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "A transient error (%{public}@) was encountered processing %{public}@, error: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    if (v18 - 3 >= 2)
    {
      if (v18 == 2)
      {
        _HKInitializeLogging();
        v28 = *v9;
        if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
        {
          v32 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v48 = v32;
          v49 = 2114;
          v50 = v17;
          _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "A fatal error occurred while processing %{public}@, error: %{public}@", buf, 0x16u);
        }
      }
      goto LABEL_26;
    }
    _HKInitializeLogging();
    v19 = *v9;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      HDStringFromJournalProcessingResult(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 40);
      v22 = v44[3];
      objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceNow");
      *(_DWORD *)buf = 138544130;
      v48 = v20;
      v49 = 2114;
      v50 = v21;
      v51 = 2048;
      v52 = (double)v22 * 0.0009765625;
      v53 = 2048;
      v54 = -v23;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ processing %{public}@ (%0.1lfkb), time: %.2f sec.", buf, 0x2Au);

    }
  }

LABEL_26:
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) - 3) >= 2)
  {
    v29 = v17;
    v30 = v29;
    if (v29)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v29);
      else
        _HKLogDroppedError();
    }

  }
  _Block_object_dispose(&v43, 8);

LABEL_33:
  return 1;
}

- (uint64_t)_setActiveTransactionAndReturnInterrupted:(uint64_t)a1
{
  id v4;
  os_unfair_lock_s *v5;

  v4 = a2;
  if (a1)
  {
    v5 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    if (v4 && !*(_QWORD *)(a1 + 48) && *(_BYTE *)(a1 + 64))
    {
      objc_msgSend(v4, "requestTransactionInterruption");
      objc_msgSend(v4, "requireRollback");
    }
    objc_storeStrong((id *)(a1 + 48), a2);
    a1 = *(_BYTE *)(a1 + 64) != 0;
    os_unfair_lock_unlock(v5);
  }

  return a1;
}

uint64_t __95__HDDatabaseJournal__mergeJournalChapter_profile_accessibilityAssertion_shouldContinueHandler___block_invoke_233(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v5;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  id v54;
  void *v55;
  int v56;
  void *v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  os_signpost_id_t v64;
  void *v65;
  _QWORD *v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  id obj;
  uint64_t v74;
  id v75[5];
  id v76;
  id v77;
  uint64_t *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE buf[12];
  __int16 v88;
  int v89;
  uint64_t v90;

  v67 = a5;
  v90 = *MEMORY[0x1E0C80C00];
  v70 = a2;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB52B0];
  v71 = a1;
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52B0]))
  {
    v9 = v8;
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 80);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      objc_msgSend(*(id *)(v71 + 32), "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v10, OS_SIGNPOST_INTERVAL_END, v11, "merge-journal-chapter-load-entries", "chapter=%{public}@", buf, 0xCu);

    }
    a1 = v71;
  }
  v13 = *(_QWORD *)(a1 + 64);
  if (!v13)
  {
    v69 = 0;
LABEL_10:
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52B0]))
    {
      v17 = v16;
      v18 = v17;
      v19 = *(_QWORD *)(v71 + 80);
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        objc_msgSend(*(id *)(v71 + 32), "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v20;
        _os_signpost_emit_with_name_impl(&dword_1B7802000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "merge-journal-chapter-merge-entries", "chapter=%{public}@", buf, 0xCu);

      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v71 + 72) + 8) + 24) += a3;
    v22 = *(_QWORD *)(v71 + 40);
    v21 = *(void **)(v71 + 48);
    v68 = v70;
    v72 = v21;
    v74 = v22;
    if (v22)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v83 = 0;
      v84 = &v83;
      v85 = 0x2020000000;
      v86 = 0;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      obj = v68;
      v24 = 0;
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
      if (!v25)
        goto LABEL_39;
      v26 = *(_QWORD *)v80;
      while (1)
      {
        v27 = 0;
        v28 = v24;
        do
        {
          if (*(_QWORD *)v80 != v26)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v27);
          objc_msgSend(v29, "entryClassName", v67);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30 != v28;
          if (v30 == v28)
            goto LABEL_24;
          if (!v28)
          {
            v31 = 0;
            goto LABEL_29;
          }
          objc_msgSend(v29, "entryClassName");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "isEqualToString:", v28))
          {
LABEL_24:
            v32 = v84[3];
            if (objc_msgSend(v29, "size") + v32 <= *(_QWORD *)(v74 + 80))
            {
              if (v30 == v28)
                v30 = v28;
              else

              goto LABEL_34;
            }
          }
          else
          {
            v31 = 1;
          }
LABEL_29:
          v33 = objc_msgSend(v23, "count");
          if (v31)
          {
            v34 = v33 == 0;

          }
          else
          {
            v34 = v33 == 0;
          }

          if (!v34)
          {
            v75[1] = (id)MEMORY[0x1E0C809B0];
            v75[2] = (id)3221225472;
            v75[3] = __50__HDDatabaseJournal__mergeJournalEntries_profile___block_invoke;
            v75[4] = &unk_1E6CEDA60;
            v76 = v23;
            v77 = v72;
            v78 = &v83;
            HKWithAutoreleasePool();

            v30 = v76;
LABEL_34:

          }
          objc_msgSend(v29, "entryClassName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "addObject:", v29);
          v35 = objc_msgSend(v29, "size");
          v84[3] += v35;
          ++v27;
          v28 = v24;
        }
        while (v25 != v27);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
        v25 = v36;
        if (!v36)
        {
LABEL_39:

          if (objc_msgSend(v23, "count"))
          {
            +[HDDatabaseJournal _journalEntriesFromChapterEnties:]((uint64_t)HDDatabaseJournal, v23);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "firstObject");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "applyEntries:withProfile:", v37, v72);

          }
          v39 = objc_msgSend(v24, "copy", v67);
          v40 = *(void **)(v74 + 72);
          *(_QWORD *)(v74 + 72) = v39;

          _Block_object_dispose(&v83, 8);
          break;
        }
      }
    }

    v41 = *(_DWORD *)(v71 + 88);
    v42 = *(_QWORD *)(v71 + 40);
    v43 = *(void **)(v71 + 56);
    v44 = *(id *)(v71 + 48);
    v45 = v43;
    v46 = v45;
    if (!v42)
    {
      v56 = 0;
      goto LABEL_64;
    }
    if (v41 != 3)
    {
      v56 = 1;
LABEL_64:

      _HKInitializeLogging();
      v61 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52B0]))
      {
        v62 = v61;
        v63 = v62;
        v64 = *(_QWORD *)(v71 + 80);
        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
        {
          objc_msgSend(*(id *)(v71 + 32), "name");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v65;
          v88 = 1024;
          v89 = v56;
          _os_signpost_emit_with_name_impl(&dword_1B7802000, v63, OS_SIGNPOST_INTERVAL_END, v64, "merge-journal-chapter-merge-entries", "chapter=%{public}@ success=%{BOOL}d", buf, 0x12u);

        }
      }
      if (v56)
        v60 = 3;
      else
        v60 = 2;
      goto LABEL_72;
    }
    objc_msgSend(v45, "databaseForEntityProtectionClass:", 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    +[HDSQLiteEntity maxPersistentIDWithPredicate:database:error:](HDDataEntity, "maxPersistentIDWithPredicate:database:error:", 0, v47, buf);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *(id *)buf;
    v50 = v49;
    if (v48)
    {
      v51 = objc_msgSend(v48, "longLongValue");
      v52 = objc_msgSend(v44, "currentSyncIdentityPersistentID");
      *(_QWORD *)&v79 = 0;
      v53 = +[HDKeyValueEntity setOkemoZursObjectAnchor:syncIdentity:database:error:](HDProtectedKeyValueEntity, "setOkemoZursObjectAnchor:syncIdentity:database:error:", v51, v52, v47, &v79);
      v54 = (id)v79;
      v55 = v54;
      if (v53)
      {

LABEL_56:
        v56 = 1;
        goto LABEL_63;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", v67, 100, CFSTR("Failed to set object anchor"), v54);

    }
    else
    {
      if (!v49)
        goto LABEL_56;
      if (v67)
      {
        v56 = 0;
        *v67 = objc_retainAutorelease(v49);
LABEL_63:

        goto LABEL_64;
      }
      _HKLogDroppedError();
    }
    v56 = 0;
    goto LABEL_63;
  }
  v75[0] = 0;
  v14 = (*(uint64_t (**)(uint64_t, id *))(v13 + 16))(v13, v75);
  v15 = v75[0];
  if ((v14 & 1) != 0)
  {
    v69 = v15;
    goto LABEL_10;
  }
  v57 = v15;
  _HKInitializeLogging();
  v58 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v57;
    _os_log_impl(&dword_1B7802000, v58, OS_LOG_TYPE_DEFAULT, "Journal merge aborted: should-continue handler returned NO: %{public}@", buf, 0xCu);
  }
  v59 = v57;
  v69 = v59;
  if (v59)
  {
    if (v67)
      *v67 = objc_retainAutorelease(v59);
    else
      _HKLogDroppedError();
    v59 = v69;
  }

  v60 = 0;
LABEL_72:

  return v60;
}

uint64_t __50__HDDatabaseJournal__mergeJournalEntries_profile___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[HDDatabaseJournal _journalEntriesFromChapterEnties:]((uint64_t)HDDatabaseJournal, *(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "applyEntries:withProfile:", v2, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

  return 1;
}

+ (id)_journalEntriesFromChapterEnties:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_248_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__HDDatabaseJournal__journalEntriesFromChapterEnties___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_msgSend(a2, "deserializedEntryWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (!v2)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v8 = v3;
      _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "Unable to deserialize journal entry: %{public}@", buf, 0xCu);
    }
  }

  return v2;
}

- (void)resetJournalMergeInterruptionsCount
{
  os_unfair_lock_s *p_interruptionsInfoLock;

  p_interruptionsInfoLock = &self->_interruptionsInfoLock;
  os_unfair_lock_lock(&self->_interruptionsInfoLock);
  -[NSMutableDictionary removeAllObjects](self->_journalMergeInterruptions, "removeAllObjects");
  os_unfair_lock_unlock(p_interruptionsInfoLock);
}

- (id)journalMergeInterruptions
{
  os_unfair_lock_s *p_interruptionsInfoLock;
  void *v4;

  p_interruptionsInfoLock = &self->_interruptionsInfoLock;
  os_unfair_lock_lock(&self->_interruptionsInfoLock);
  v4 = (void *)-[NSMutableDictionary copy](self->_journalMergeInterruptions, "copy");
  os_unfair_lock_unlock(p_interruptionsInfoLock);
  return v4;
}

- (void)_unitTesting_closeCurrentJournalChapter
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__HDDatabaseJournal__unitTesting_closeCurrentJournalChapter__block_invoke;
  v2[3] = &unk_1E6CE80E8;
  v2[4] = self;
  -[HDDatabaseJournal _executeAtomically:]((os_unfair_lock_s *)self, v2);
}

uint64_t __60__HDDatabaseJournal__unitTesting_closeCurrentJournalChapter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "close");
}

- (id)_unitTesting_directoryURL
{
  return self->_URL;
}

- (void)_unitTesting_setJournalStatusRequiresMerge
{
  self->_journalStatus = 2;
}

- (void)_unitTesting_setSerializedDataEnumerationThreshold:(int64_t)a3
{
  self->_serializedDataEnumerationThreshold = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (HDDatabaseJournalDelegate)delegate
{
  return (HDDatabaseJournalDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)mergeQueue
{
  return self->_mergeQueue;
}

- (NSNumber)maximumJournalBytes
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMaximumJournalBytes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (BOOL)isMerging
{
  return self->_isMerging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentJournalChapter, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_maximumJournalBytes, 0);
  objc_storeStrong((id *)&self->_mergeQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_journalMergeInterruptions, 0);
  objc_storeStrong((id *)&self->_lastInsertedEntryClassName, 0);
  objc_storeStrong((id *)&self->_activeMergeTransaction, 0);
  objc_storeStrong((id *)&self->_progressLock_internalProgress, 0);
  objc_storeStrong((id *)&self->_progressLock_observableProgress, 0);
}

@end
