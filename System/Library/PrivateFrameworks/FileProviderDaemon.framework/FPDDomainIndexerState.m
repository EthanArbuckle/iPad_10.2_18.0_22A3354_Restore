@implementation FPDDomainIndexerState

- (FPDDomainIndexerState)initWithSupportURL:(id)a3
{
  id v5;
  FPDDomainIndexerState *v6;
  uint64_t v7;
  NSURL *needsIndexingURL;
  uint64_t v9;
  NSURL *droppedIndexURL;
  uint64_t v11;
  NSURL *needsAuthURL;
  uint64_t v13;
  NSURL *lastDropDataURL;
  void *v16;
  void *v17;
  objc_super v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDDomainIndexerState.m"), 36, CFSTR("Tried to initialize FPDDomainIndexerState with nil supportURL"));

  }
  if ((objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDDomainIndexerState.m"), 37, CFSTR("Tried to initialize FPDDomainIndexerState with a non file URL, which is not supported"));

  }
  v18.receiver = self;
  v18.super_class = (Class)FPDDomainIndexerState;
  v6 = -[FPDDomainIndexerState init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("needs-index"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    needsIndexingURL = v6->_needsIndexingURL;
    v6->_needsIndexingURL = (NSURL *)v7;

    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("dropped-index"), 0);
    v9 = objc_claimAutoreleasedReturnValue();
    droppedIndexURL = v6->_droppedIndexURL;
    v6->_droppedIndexURL = (NSURL *)v9;

    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("needs-auth"), 0);
    v11 = objc_claimAutoreleasedReturnValue();
    needsAuthURL = v6->_needsAuthURL;
    v6->_needsAuthURL = (NSURL *)v11;

    v6->_timesIndexWasDropSinceLastStart = 0;
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("last-drop-data"), 0);
    v13 = objc_claimAutoreleasedReturnValue();
    lastDropDataURL = v6->_lastDropDataURL;
    v6->_lastDropDataURL = (NSURL *)v13;

  }
  return v6;
}

- (void)dumpStateTo:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (-[FPDDomainIndexerState needsAuth](self, "needsAuth"))
    v4 = CFSTR("yes");
  else
    v4 = CFSTR("no");
  objc_msgSend(v13, "write:", CFSTR("      needs-auth:     %@\n"), v4);
  if (-[FPDDomainIndexerState needsIndexing](self, "needsIndexing"))
    v5 = CFSTR("yes");
  else
    v5 = CFSTR("no");
  objc_msgSend(v13, "write:", CFSTR("      needs-indexing: %@\n"), v5);
  if (-[FPDDomainIndexerState droppedIndex](self, "droppedIndex")
    || (-[FPDDomainIndexerState lastDropDate](self, "lastDropDate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(v13, "write:", CFSTR("      + drop info:\n"));
    objc_msgSend(v13, "write:", CFSTR("         drops-since-start: %lu\n"), -[FPDDomainIndexerState timesIndexWasDropSinceLastStart](self, "timesIndexWasDropSinceLastStart"));
    if (-[FPDDomainIndexerState droppedIndex](self, "droppedIndex"))
      v7 = CFSTR("yes");
    else
      v7 = CFSTR("no");
    objc_msgSend(v13, "write:", CFSTR("         index-is-dropped:  %@\n"), v7);
    -[FPDDomainIndexerState lastDropDate](self, "lastDropDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("na");
    if (v9)
      v11 = (const __CFString *)v9;
    objc_msgSend(v13, "write:", CFSTR("         last-drop-date:    %@\n"), v11);

    -[FPDDomainIndexerState lastDropReason](self, "lastDropReason");
    FPHumanReadableDropReason();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "write:", CFSTR("         last-drop-reason:  %@\n"), v12);

  }
}

- (void)unarchiveLastDropData:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = a3;
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v9, v5, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v16;
    if (v10)
    {
      NSStringFromSelector(sel_lastDropDate);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&self->_lastDropDate, v13);
      NSStringFromSelector(sel_lastDropReason);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        self->_lastDropReason = objc_msgSend(v15, "unsignedIntegerValue");

    }
    else
    {
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[FPDDomainIndexerState unarchiveLastDropData:].cold.1(v11);
    }

  }
}

- (void)loadPersistedState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", self->_needsIndexingURL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_needsIndexing = v3 != 0;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", self->_needsIndexingURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_droppedIndex = v4 != 0;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", self->_needsAuthURL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_needsAuth = v5 != 0;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", self->_lastDropDataURL);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[FPDDomainIndexerState unarchiveLastDropData:](self, "unarchiveLastDropData:", v6);

}

- (void)recordIndexDropReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSURL *lastDropDataURL;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  -[FPDDomainIndexerState setTimesIndexWasDropSinceLastStart:](self, "setTimesIndexWasDropSinceLastStart:", -[FPDDomainIndexerState timesIndexWasDropSinceLastStart](self, "timesIndexWasDropSinceLastStart") + 1);
  -[FPDDomainIndexerState setLastDropReason:](self, "setLastDropReason:", a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDDomainIndexerState setLastDropDate:](self, "setLastDropDate:", v5);

  NSStringFromSelector(sel_lastDropReason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FPDDomainIndexerState lastDropReason](self, "lastDropReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  NSStringFromSelector(sel_lastDropDate);
  v8 = objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  -[FPDDomainIndexerState lastDropDate](self, "lastDropDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 0, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  lastDropDataURL = self->_lastDropDataURL;
  v16 = v12;
  LOBYTE(v8) = objc_msgSend(v11, "writeToURL:options:error:", lastDropDataURL, 0, &v16);
  v14 = v16;

  if ((v8 & 1) == 0)
  {
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FPDDomainIndexerState recordIndexDropReason:].cold.1(v14);

  }
}

- (void)setBoolValue:(BOOL)a3 atURL:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v5, "URLByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v15);
    v9 = v15;

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    v11 = objc_msgSend(v10, "writeToURL:options:error:", v5, 0, &v14);
    v12 = v14;

    if ((v11 & 1) == 0)
    {
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[FPDDomainIndexerState setBoolValue:atURL:].cold.1(v12);

    }
  }
  else
  {
    objc_msgSend(v6, "removeItemAtURL:error:", v5, 0);
    v12 = 0;
  }

}

- (void)setNeedsIndexing:(BOOL)a3
{
  if (self->_needsIndexing != a3)
  {
    -[FPDDomainIndexerState setBoolValue:atURL:](self, "setBoolValue:atURL:");
    self->_needsIndexing = a3;
  }
}

- (void)setDroppedIndex:(BOOL)a3
{
  if (self->_droppedIndex != a3)
  {
    -[FPDDomainIndexerState setBoolValue:atURL:](self, "setBoolValue:atURL:");
    self->_droppedIndex = a3;
  }
}

- (void)setNeedsAuth:(BOOL)a3
{
  if (self->_needsAuth != a3)
  {
    -[FPDDomainIndexerState setBoolValue:atURL:](self, "setBoolValue:atURL:");
    self->_needsAuth = a3;
  }
}

- (BOOL)needsIndexing
{
  return self->_needsIndexing;
}

- (BOOL)droppedIndex
{
  return self->_droppedIndex;
}

- (BOOL)needsAuth
{
  return self->_needsAuth;
}

- (unint64_t)timesIndexWasDropSinceLastStart
{
  return self->_timesIndexWasDropSinceLastStart;
}

- (void)setTimesIndexWasDropSinceLastStart:(unint64_t)a3
{
  self->_timesIndexWasDropSinceLastStart = a3;
}

- (unint64_t)lastDropReason
{
  return self->_lastDropReason;
}

- (void)setLastDropReason:(unint64_t)a3
{
  self->_lastDropReason = a3;
}

- (NSDate)lastDropDate
{
  return self->_lastDropDate;
}

- (void)setLastDropDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastDropDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDropDate, 0);
  objc_storeStrong((id *)&self->_lastDropDataURL, 0);
  objc_storeStrong((id *)&self->_droppedIndexURL, 0);
  objc_storeStrong((id *)&self->_needsAuthURL, 0);
  objc_storeStrong((id *)&self->_needsIndexingURL, 0);
}

- (void)unarchiveLastDropData:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] [Indexer] Can't load index drop reason, error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)recordIndexDropReason:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] [Indexer] Can't persist index drop reason, error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)setBoolValue:(void *)a1 atURL:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] [Indexer] Can't persist BOOL value, error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
