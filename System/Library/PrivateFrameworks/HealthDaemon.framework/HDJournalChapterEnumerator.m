@implementation HDJournalChapterEnumerator

- (HDJournalChapterEnumerator)init
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

- (HDJournalChapterEnumerator)initWithURL:(id)a3
{
  id v4;
  HDJournalChapterEnumerator *v5;
  uint64_t v6;
  NSURL *URL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDJournalChapterEnumerator;
  v5 = -[HDJournalChapterEnumerator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v5->_currentIndex = 0;
  }

  return v5;
}

- (HDJournalChapterEnumerator)initWithPath:(id)a3
{
  void *v4;
  HDJournalChapterEnumerator *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDJournalChapterEnumerator initWithURL:](self, "initWithURL:", v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[HDJournalChapterEnumerator closeJournalChapters](self, "closeJournalChapters");
  v3.receiver = self;
  v3.super_class = (Class)HDJournalChapterEnumerator;
  -[HDJournalChapterEnumerator dealloc](&v3, sel_dealloc);
}

- (BOOL)hasJournalChapters
{
  BOOL v2;
  void *v3;
  void *v4;

  if (self->_hasLoadedPersistedJournalNames)
    return self->_totalJournalChapterCount > 0;
  +[HDJournalChapterEnumerator _lightweightDirectoryEnumeratorForURL:]((uint64_t)HDJournalChapterEnumerator, self->_URL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4 != 0;

  return v2;
}

+ (id)_lightweightDirectoryEnumeratorForURL:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v2, MEMORY[0x1E0C9AA60], 21, &__block_literal_global_99);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)closeJournalChapters
{
  NSObject *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *openJournalChapters;
  NSMutableArray *remainingJournalChapters;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  HDJournalChapterEnumerator *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_debug_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEBUG, "%@ closing all open journal chapters", buf, 0xCu);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_openJournalChapters;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "close", (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  openJournalChapters = self->_openJournalChapters;
  self->_openJournalChapters = 0;

  remainingJournalChapters = self->_remainingJournalChapters;
  self->_remainingJournalChapters = 0;

  self->_hasLoadedPersistedJournalNames = 0;
  self->_totalJournalChapterCount = 0;
}

- (BOOL)loadSortedJournalChaptersWithError:(id *)a3
{
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *openJournalChapters;
  void *v7;
  NSURL *URL;
  NSObject *v10;
  void *v11;
  int v12;
  HDJournalChapterEnumerator *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[HDJournalChapterEnumerator _journalChaptersForURL:sorted:error:]((uint64_t)HDJournalChapterEnumerator, self->_URL, 1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_storeStrong((id *)&self->_remainingJournalChapters, v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    openJournalChapters = self->_openJournalChapters;
    self->_openJournalChapters = v5;

    self->_hasLoadedPersistedJournalNames = 1;
    self->_totalJournalChapterCount = objc_msgSend(v4, "count");
    self->_currentIndex = 0;
  }
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
  {
    URL = self->_URL;
    v10 = v7;
    -[NSURL path](URL, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = self;
    v14 = 2112;
    v15 = v11;
    v16 = 2048;
    v17 = objc_msgSend(v4, "count");
    v18 = 1024;
    v19 = v4 != 0;
    _os_log_debug_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEBUG, "%@ for path:%@ loaded (%lu) journal chapter names with success:%{BOOL}d", (uint8_t *)&v12, 0x26u);

  }
  return v4 != 0;
}

+ (id)_journalChaptersForURL:(int)a3 sorted:(_QWORD *)a4 error:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  id v16;
  void *v17;
  HDDatabaseJournalDatabase *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  _QWORD v40[5];

  v40[3] = *MEMORY[0x1E0C80C00];
  v25 = a2;
  objc_opt_self();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = *MEMORY[0x1E0C999D0];
  v7 = *MEMORY[0x1E0C99998];
  v40[0] = *MEMORY[0x1E0C999D0];
  v40[1] = v7;
  v40[2] = *MEMORY[0x1E0C998D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__93;
  v37 = __Block_byref_object_dispose__93;
  v38 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __66__HDJournalChapterEnumerator__journalChaptersForURL_sorted_error___block_invoke;
  v32[3] = &unk_1E6CF8B38;
  v32[4] = &v33;
  objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v25, v26, 5, v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v27 = 0;
        v15 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v27, v6, a4);
        v16 = v27;
        v17 = v16;
        if ((v15 & 1) == 0)
        {

          v21 = 0;
          goto LABEL_23;
        }
        if (objc_msgSend(v16, "BOOLValue"))
          v18 = -[HDDatabaseJournalDatabase initWithURL:]([HDDatabaseJournalDatabase alloc], "initWithURL:", v14);
        else
          v18 = -[HDDatabaseLegacyJournalFile initWithURL:]([HDDatabaseLegacyJournalFile alloc], "initWithURL:", v14);
        objc_msgSend(v5, "addObject:", v18);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (a3)
    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_209_2);
  v19 = (id)v34[5];
  v20 = v19;
  if (v19)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v19);
    else
      _HKLogDroppedError();
  }

  if (v34[5])
    v22 = 0;
  else
    v22 = v5;
  v21 = v22;
LABEL_23:

  _Block_object_dispose(&v33, 8);
  return v21;
}

- (id)nextOpenJournalChapterError:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v8;
  os_log_t *v9;
  void *v10;
  os_log_t v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSError *v24;
  NSError *cachedError;
  void *v26;
  NSError *v27;
  NSObject *v28;
  NSMutableArray *openJournalChapters;
  NSObject *v30;
  id v31;
  uint8_t buf[4];
  HDJournalChapterEnumerator *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!self->_hasLoadedPersistedJournalNames)
  {
    v5 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B7802000, v5, OS_LOG_TYPE_FAULT, "_hasLoadedPersistedJournalNames", buf, 2u);
    }
    return 0;
  }
  if (self->_currentIndex == self->_totalJournalChapterCount
    || !-[NSMutableArray count](self->_remainingJournalChapters, "count")
    && !-[NSMutableArray count](self->_openJournalChapters, "count"))
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "Finished processing journal chapters", buf, 2u);
    }
    return 0;
  }
  v8 = -[NSMutableArray count](self->_openJournalChapters, "count");
  v9 = (os_log_t *)MEMORY[0x1E0CB52B0];
  if (v8)
  {
    -[NSMutableArray firstObject](self->_openJournalChapters, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_openJournalChapters, "removeObjectAtIndex:", 0);
    objc_msgSend(v10, "close");
    _HKInitializeLogging();
    v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      openJournalChapters = self->_openJournalChapters;
      v30 = v11;
      *(_DWORD *)buf = 138412546;
      v33 = self;
      v34 = 2048;
      v35 = -[NSMutableArray count](openJournalChapters, "count");
      _os_log_debug_impl(&dword_1B7802000, v30, OS_LOG_TYPE_DEBUG, "%@ Closing journal chapter at index 0. Current open count is %ld", buf, 0x16u);

    }
  }
  if (!self->_cachedError)
  {
    v31 = 0;
    if (-[NSMutableArray count](self->_remainingJournalChapters, "count")
      && (v12 = -[HDJournalChapterEnumerator maxAllowedOpenJournalChapterCount](self, "maxAllowedOpenJournalChapterCount"), v13 = v12 - -[NSMutableArray count](self->_openJournalChapters, "count"), v13 >= 1))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
      v15 = v13 + 1;
      do
      {
        if (!-[NSMutableArray count](self->_remainingJournalChapters, "count"))
          break;
        -[NSMutableArray firstObject](self->_remainingJournalChapters, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v16);

        -[NSMutableArray removeObjectAtIndex:](self->_remainingJournalChapters, "removeObjectAtIndex:", 0);
        --v15;
      }
      while (v15 > 1);
      -[HDJournalChapterEnumerator unitTestDelegate](self, "unitTestDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[HDJournalChapterEnumerator unitTestDelegate](self, "unitTestDelegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_unitTest_openJournalChapters:error:", v14, &v31);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[HDJournalChapterEnumerator _openJournalChapters:error:](self, "_openJournalChapters:error:", v14, &v31);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v21 = objc_msgSend(v19, "count");
      v22 = objc_msgSend(v14, "count");
      -[NSMutableArray addObjectsFromArray:](self->_openJournalChapters, "addObjectsFromArray:", v19);

      v23 = v31;
      v20 = v23;
      if (v21 != v22)
      {
        v24 = (NSError *)objc_msgSend(v23, "copy");
        cachedError = self->_cachedError;
        self->_cachedError = v24;

      }
    }
    else
    {
      v20 = 0;
    }

  }
  -[NSMutableArray firstObject](self->_openJournalChapters, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    ++self->_currentIndex;
  }
  else
  {
    v27 = self->_cachedError;
    if (v27)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v27);
      else
        _HKLogDroppedError();
    }

    -[HDJournalChapterEnumerator closeJournalChapters](self, "closeJournalChapters");
  }
  _HKInitializeLogging();
  v28 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v33 = self;
    v34 = 2112;
    v35 = (uint64_t)v26;
    _os_log_debug_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEBUG, "%@ next journal chapter is %@", buf, 0x16u);
  }
  return v26;
}

- (BOOL)hasMoreJournalChapters
{
  NSObject *v2;
  uint8_t v4[16];

  if (self->_hasLoadedPersistedJournalNames)
  {
    LOBYTE(self) = self->_currentIndex < self->_totalJournalChapterCount;
  }
  else
  {
    v2 = *MEMORY[0x1E0CB52B0];
    LODWORD(self) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT);
    if ((_DWORD)self)
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1B7802000, v2, OS_LOG_TYPE_FAULT, "_hasLoadedPersistedJournalNames", v4, 2u);
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (unint64_t)totalJournalChapterCount
{
  return self->_totalJournalChapterCount;
}

- (unint64_t)currentJournalChapterIndex
{
  return self->_currentIndex;
}

- (id)_openJournalChapters:(id)a3 error:(id *)a4
{
  id v6;
  os_log_t *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  os_log_t v16;
  id v17;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  HDJournalChapterEnumerator *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x1E0CB52B0];
  v8 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
  {
    v19 = v8;
    *(_DWORD *)buf = 138412546;
    v28 = self;
    v29 = 2048;
    v30 = objc_msgSend(v6, "count");
    _os_log_debug_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEBUG, "%@: Will open %ld journal chapters", buf, 0x16u);

  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (!objc_msgSend(v15, "openForReadingWithError:", a4, (_QWORD)v22))
          {

            v17 = 0;
            goto LABEL_16;
          }
          objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
          continue;
        break;
      }
    }

    _HKInitializeLogging();
    v16 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
    {
      v20 = v16;
      v21 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2048;
      v30 = v21;
      _os_log_debug_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEBUG, "%@: Did open %ld journal chapters", buf, 0x16u);

    }
    v17 = v9;
LABEL_16:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 3, CFSTR("Trying to open journal chapters without providing any to open"));
    v17 = 0;
  }

  return v17;
}

+ (id)journalChaptersForURL:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  +[HDJournalChapterEnumerator _journalChaptersForURL:sorted:error:]((uint64_t)a1, a3, 0, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

+ (id)nextJournalChapterNameForURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE buf[12];
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HDJournalChapterEnumerator _lightweightDirectoryEnumeratorForURL:]((uint64_t)a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (!v6)
  {
    v17 = 0;
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%05ld.log"), v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v7 = v6;
  v8 = *(_QWORD *)v22;
  v9 = 0xFFFFFFFF80000000;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "URLByDeletingPathExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "length"))
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v12);
        *(_QWORD *)buf = 0;
        if (objc_msgSend(v13, "scanInteger:", buf))
        {
          if (*(uint64_t *)buf > v9 || v9 == 0xFFFFFFFF80000000)
            v9 = *(_QWORD *)buf;
        }

      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  }
  while (v7);
  if (v9 < 99999)
  {
    if (v9 >= 0)
      v17 = v9 + 1;
    else
      v17 = 0;
    goto LABEL_24;
  }
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
  {
    v19 = v15;
    objc_msgSend(v4, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v9;
    v26 = 2114;
    v27 = v20;
    _os_log_fault_impl(&dword_1B7802000, v19, OS_LOG_TYPE_FAULT, "Encountered journal index %ld in %{public}@; dropping changes",
      buf,
      0x16u);

  }
  v16 = 0;
LABEL_25:

  return v16;
}

+ (int64_t)journalChapterCountForURL:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[HDJournalChapterEnumerator _lightweightDirectoryEnumeratorForURL:]((uint64_t)a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = v5;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        --v8;
      }
      while (v8);
      v6 += v5;
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __68__HDJournalChapterEnumerator__lightweightDirectoryEnumeratorForURL___block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Error enumerating journal chapter /'%@/': %@", (uint8_t *)&v8, 0x16u);
  }

  return 0;
}

uint64_t __66__HDJournalChapterEnumerator__journalChaptersForURL_sorted_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Error enumerating journal chapter /'%@/'"), a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 102, v7, v6);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return 0;
}

uint64_t __66__HDJournalChapterEnumerator__journalChaptersForURL_sorted_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (unint64_t)_totalOpenJournalChapterCount
{
  return -[NSMutableArray count](self->_openJournalChapters, "count");
}

- (int64_t)maxAllowedOpenJournalChapterCount
{
  if (self->_maxAllowedOpenJournalChapterCount)
    return self->_maxAllowedOpenJournalChapterCount;
  else
    return 50;
}

- (void)setMaxAllowedOpenJournalChapterCount:(int64_t)a3
{
  self->_maxAllowedOpenJournalChapterCount = a3;
}

- (HDJournalChapterEnumeratorTestsDelegate)unitTestDelegate
{
  return (HDJournalChapterEnumeratorTestsDelegate *)objc_loadWeakRetained((id *)&self->_unitTestDelegate);
}

- (void)setUnitTestDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_unitTestDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unitTestDelegate);
  objc_storeStrong((id *)&self->_openJournalChapters, 0);
  objc_storeStrong((id *)&self->_remainingJournalChapters, 0);
  objc_storeStrong((id *)&self->_cachedError, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
