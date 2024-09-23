@implementation EDPersistenceDatabaseJournalManager

- (EDPersistenceDatabaseJournal)oldestJournal
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__EDPersistenceDatabaseJournalManager_oldestJournal__block_invoke;
  v3[3] = &unk_1E949F8B8;
  v3[4] = self;
  -[EDPersistenceDatabaseJournalManager _getJournalWithBlock:](self, "_getJournalWithBlock:", v3);
  return (EDPersistenceDatabaseJournal *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_getJournalWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  os_unfair_lock_s *p_journalLock;
  NSObject *v6;
  void *v7;

  v4 = (void (**)(_QWORD))a3;
  p_journalLock = &self->_journalLock;
  os_unfair_lock_lock(&self->_journalLock);
  if (!self->_journalNumbers)
  {
    os_unfair_lock_unlock(&self->_journalLock);
    -[EDPersistenceDatabaseJournalManager checkExistingQueue](self, "checkExistingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v6, &__block_literal_global_49);

    os_unfair_lock_lock(p_journalLock);
  }
  v4[2](v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_journalLock);

  return v7;
}

EDPersistenceDatabaseJournal *__52__EDPersistenceDatabaseJournalManager_oldestJournal__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v4;
  void *v5;
  EDPersistenceDatabaseJournal *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "firstIndex");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return (EDPersistenceDatabaseJournal *)0;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (EDPersistenceDatabaseJournal *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = v2;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Oldest journal %lu does not already exist. Creating...", (uint8_t *)&v11, 0xCu);
    }

    v6 = -[EDPersistenceDatabaseJournal initWithJournalManager:number:]([EDPersistenceDatabaseJournal alloc], "initWithJournalManager:number:", *(_QWORD *)(a1 + 32), v2);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, v9);

  }
  +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = v2;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Getting oldest journal %lu", (uint8_t *)&v11, 0xCu);
  }

  return v6;
}

void __56__EDPersistenceDatabaseJournalManager_initWithBasePath___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  os_unfair_lock_s *lock;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  uint8_t v38[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;
  uint8_t buf[16];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Checking for existing journals", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "journalDirectoryPath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "fileExistsAtPath:") & 1) != 0)
  {
    v29 = 0;
  }
  else
  {
    v37 = 0;
    v3 = objc_msgSend(v31, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v28, 1, 0, &v37);
    v29 = v37;
    if (v3)
    {
      +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Created journal directory", buf, 2u);
      }
    }
    else
    {
      +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v29, "ef_publicDescription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        __56__EDPersistenceDatabaseJournalManager_initWithBasePath___block_invoke_cold_1(v5, buf, v4);
      }
    }

  }
  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *MEMORY[0x1E0C99938];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v29;
    objc_msgSend(v31, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, v7, 0, &v36);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v36;

    v29 = v8;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0C9AA60];
  }
  lock = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock(lock);
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v9;

  v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 48);
  *(_QWORD *)(v16 + 48) = v15;

  if (objc_msgSend(v30, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = v30;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "lastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v22, "hasSuffix:", CFSTR("-wal")) & 1) == 0
            && (objc_msgSend(v22, "hasSuffix:", CFSTR("-shm")) & 1) == 0)
          {
            v23 = objc_msgSend(v22, "integerValue");
            if (v23 >= 1)
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addIndex:", v23);
            EFVerifyFileProtectionType();
          }

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v19);
    }

    +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)v38 = 138543362;
      v39 = v25;
      _os_log_impl(&dword_1D2F2C000, v24, OS_LOG_TYPE_DEFAULT, "Found journal numbers: %{public}@", v38, 0xCu);
    }
  }
  else
  {
    +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v29, "ef_publicDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v38 = 138543362;
      v39 = v26;
      _os_log_impl(&dword_1D2F2C000, v24, OS_LOG_TYPE_DEFAULT, "Unable to iterate journal directory: %{public}@", v38, 0xCu);

    }
  }

  os_unfair_lock_unlock(lock);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__EDPersistenceDatabaseJournalManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_65 != -1)
    dispatch_once(&log_onceToken_65, block);
  return (OS_os_log *)(id)log_log_65;
}

- (NSString)journalDirectoryPath
{
  return self->_journalDirectoryPath;
}

- (EDPersistenceDatabaseJournalManager)initWithBasePath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  dispatch_block_t v16;
  _QWORD block[4];
  id v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EDPersistenceDatabaseJournalManager;
  v5 = -[EDPersistenceDatabaseJournalManager init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Protected Index Journals"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v6;

    *((_DWORD *)v5 + 2) = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.email.persistenceDatabaseJournalManager.checkExistingQueue", v9);
    v11 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v10;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.email.persistenceDatabaseJournalManager.deleteQueue", v13);
    v15 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v14;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__EDPersistenceDatabaseJournalManager_initWithBasePath___block_invoke;
    block[3] = &unk_1E949AEB8;
    v19 = v5;
    v16 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
    dispatch_async(*((dispatch_queue_t *)v5 + 8), v16);

  }
  return (EDPersistenceDatabaseJournalManager *)v5;
}

void __42__EDPersistenceDatabaseJournalManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_65;
  log_log_65 = (uint64_t)v1;

}

- (id)currentJournalCreateIfNeeded:(BOOL)a3
{
  _QWORD v4[6];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__EDPersistenceDatabaseJournalManager_currentJournalCreateIfNeeded___block_invoke;
  v4[3] = &unk_1E949F890;
  v4[4] = self;
  v4[5] = a2;
  v5 = a3;
  -[EDPersistenceDatabaseJournalManager _getJournalWithBlock:](self, "_getJournalWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __68__EDPersistenceDatabaseJournalManager_currentJournalCreateIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  EDPersistenceDatabaseJournal *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    if (!objc_msgSend(v2, "referenceCount"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("EDPersistenceDatabaseJournal.m"), 166, CFSTR("_currentJournal exists, but has no reference count"));

    }
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Creating a new journal", (uint8_t *)&v20, 2u);
    }

    v5 = (_QWORD *)(a1 + 32);
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lastIndex");
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = 0;
    else
      v7 = v6;
    v8 = objc_msgSend(*(id *)(*v5 + 40), "lastIndex");
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = v8;
    if (v7 <= v9)
      v7 = v9;
    v10 = v7 + 1;
    v11 = -[EDPersistenceDatabaseJournal initWithJournalManager:number:]([EDPersistenceDatabaseJournal alloc], "initWithJournalManager:number:", *v5, v10);
    v12 = *(void **)(*v5 + 16);
    *(_QWORD *)(*v5 + 16) = v11;

    objc_msgSend(*(id *)(*v5 + 32), "addIndex:", v10);
    v13 = *v5;
    v14 = *(void **)(*v5 + 48);
    v15 = *(_QWORD *)(v13 + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, v16);

  }
  +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v20 = 138412290;
    v21 = v18;
    _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Returning current journal %@", (uint8_t *)&v20, 0xCu);
  }

  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (void)_journalNoLongerReferenced:(id)a3
{
  EDPersistenceDatabaseJournal *v4;
  uint64_t v5;
  NSMapTable *journalsByIndexes;
  void *v7;
  EDPersistenceDatabaseJournal *currentJournal;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  EDPersistenceDatabaseJournal *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (EDPersistenceDatabaseJournal *)a3;
  os_unfair_lock_lock(&self->_journalLock);
  if (self->_currentJournal == v4)
  {
    if (self->_shouldDeleteCurrentJournal)
    {
      v5 = -[EDPersistenceDatabaseJournal number](v4, "number");
      -[NSMutableIndexSet removeIndex:](self->_journalNumbers, "removeIndex:", v5);
      -[NSMutableIndexSet addIndex:](self->_pendingDeleteJournalNumbers, "addIndex:", v5);
      journalsByIndexes = self->_journalsByIndexes;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](journalsByIndexes, "removeObjectForKey:", v7);

      self->_shouldDeleteCurrentJournal = 0;
      currentJournal = self->_currentJournal;
    }
    else
    {
      v5 = 0;
      currentJournal = v4;
    }
    self->_currentJournal = 0;

    +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("YES");
      if (!v5)
        v10 = CFSTR("NO");
      v11 = 138412546;
      v12 = v4;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Unsetting current journal %@ - should delete: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    os_unfair_lock_unlock(&self->_journalLock);
    if (v5)
      -[EDPersistenceDatabaseJournalManager _deleteJournalNumber:](self, "_deleteJournalNumber:", v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_journalLock);
  }

}

- (void)mergedJournal:(id)a3
{
  EDPersistenceDatabaseJournal *v4;
  uint64_t v5;
  EDPersistenceDatabaseJournal *currentJournal;
  NSMapTable *journalsByIndexes;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (EDPersistenceDatabaseJournal *)a3;
  v5 = -[EDPersistenceDatabaseJournal number](v4, "number");
  os_unfair_lock_lock(&self->_journalLock);
  currentJournal = self->_currentJournal;
  if (currentJournal == v4)
  {
    self->_shouldDeleteCurrentJournal = 1;
  }
  else
  {
    -[NSMutableIndexSet removeIndex:](self->_journalNumbers, "removeIndex:", v5);
    -[NSMutableIndexSet addIndex:](self->_pendingDeleteJournalNumbers, "addIndex:", v5);
    journalsByIndexes = self->_journalsByIndexes;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](journalsByIndexes, "removeObjectForKey:", v8);

  }
  os_unfair_lock_unlock(&self->_journalLock);
  +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("YES");
    if (currentJournal == v4)
      v10 = CFSTR("NO");
    v11 = 134218242;
    v12 = v5;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Merged journal %lu - should delete: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (currentJournal != v4)
    -[EDPersistenceDatabaseJournalManager _deleteJournalNumber:](self, "_deleteJournalNumber:", v5);

}

- (void)_deleteJournalNumber:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  dispatch_block_t v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  void (**v14)(_QWORD);
  unint64_t v15;
  _QWORD aBlock[6];
  uint8_t buf[4];
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = a3;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Start to delete journalNumber %lu", buf, 0xCu);
  }

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke;
  aBlock[3] = &unk_1E949B658;
  aBlock[4] = self;
  aBlock[5] = a3;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[EDPersistenceDatabaseJournalManager journalDirectoryPath](self, "journalDirectoryPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2;
    block[3] = &unk_1E949F8E0;
    v15 = a3;
    v13 = v8;
    v14 = v7;
    v10 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_BACKGROUND, 0, block);
    -[EDPersistenceDatabaseJournalManager deleteQueue](self, "deleteQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v11, v10);

  }
  else
  {
    v7[2](v7);
  }

}

void __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeIndex:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock(v2);
}

void __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingString:", CFSTR("-wal"));
  v4 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v4;
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("-shm"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v3);
  v23 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "removeItemAtPath:error:");
  v7 = v23;
  if ((v6 & 1) == 0)
  {
    +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_3();
    }

    v4 = (uint64_t)v19;
  }
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  v10 = objc_msgSend(v5, "removeItemAtPath:error:", v9, &v22);
  v11 = v22;

  if ((v10 & 1) == 0)
  {
    +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_2();
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v11;
  v14 = objc_msgSend(v5, "removeItemAtPath:error:", v13, &v21);
  v15 = v21;

  if ((v14 & 1) == 0)
  {
    +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_1();
    }
    goto LABEL_15;
  }
  if ((v6 & v10) == 1)
  {
    +[EDPersistenceDatabaseJournalManager log](EDPersistenceDatabaseJournalManager, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134217984;
      v25 = v17;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "Deleted journal %lu", buf, 0xCu);
    }
LABEL_15:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)waitForDeletes
{
  NSObject *v2;

  -[EDPersistenceDatabaseJournalManager deleteQueue](self, "deleteQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_barrier_sync(v2, &__block_literal_global_61);

}

- (void)test_tearDown
{
  void *v4;
  NSObject *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabaseJournal.m"), 321, CFSTR("%s can only be called from unit tests"), "-[EDPersistenceDatabaseJournalManager test_tearDown]");

  }
  -[EDPersistenceDatabaseJournalManager waitForDeletes](self, "waitForDeletes");
  -[EDPersistenceDatabaseJournalManager checkExistingQueue](self, "checkExistingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_barrier_sync(v5, &__block_literal_global_64);

}

- (OS_dispatch_queue)checkExistingQueue
{
  return self->_checkExistingQueue;
}

- (OS_dispatch_queue)deleteQueue
{
  return self->_deleteQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteQueue, 0);
  objc_storeStrong((id *)&self->_checkExistingQueue, 0);
  objc_storeStrong((id *)&self->_journalDirectoryPath, 0);
  objc_storeStrong((id *)&self->_journalsByIndexes, 0);
  objc_storeStrong((id *)&self->_pendingDeleteJournalNumbers, 0);
  objc_storeStrong((id *)&self->_journalNumbers, 0);
  objc_storeStrong((id *)&self->_currentJournal, 0);
}

void __56__EDPersistenceDatabaseJournalManager_initWithBasePath___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Unable to create journal directory: %{public}@", buf, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

void __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_6(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Unable to delete shm for journal %lu: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_6(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Unable to delete wal for journal %lu: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_6(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Unable to delete journal %lu: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

@end
