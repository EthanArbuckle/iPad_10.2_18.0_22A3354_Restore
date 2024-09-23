@implementation OSLogPersistence

- (void)_openLocalPersistenceDir
{
  unint64_t options;
  _OSLogCollectionReference *v4;
  _OSLogCollectionReference *oslcr;
  _OSLogVersioning *v6;
  _OSLogVersioning *version;
  FILE *v8;
  FILE *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  off_t v13;
  void *v14;
  _OSLogIndex *v15;
  _OSLogIndex *index;
  NSDate *v17;
  NSDate *startDate;
  NSDate *v19;
  NSDate *endDate;
  _OSLogChunkMemory *v21;

  options = self->_options;
  if ((~LODWORD(self->_options) & 0xCLL) != 0)
  {
    +[_OSLogCollectionReference localDBRefWithError:](_OSLogCollectionReference, "localDBRefWithError:", 0);
    v4 = (_OSLogCollectionReference *)objc_claimAutoreleasedReturnValue();
    oslcr = self->_oslcr;
    self->_oslcr = v4;

    v6 = -[_OSLogVersioning initWithCollection:error:]([_OSLogVersioning alloc], "initWithCollection:error:", self->_oslcr, 0);
    version = self->_version;
    self->_version = v6;

    v8 = tmpfile();
    if (v8)
    {
      v9 = v8;
      v10 = 2;
      if ((options & 8) == 0)
        v10 = 3;
      if ((options & 4) != 0)
        v11 = 1;
      else
        v11 = v10;
      v12 = fileno(v8);
      v21 = 0;
      if (OSLogCaptureInflightBuffersToFile(v12, v11, 0))
      {
        v13 = lseek(v12, 0, 2);
        v14 = mmap(0, v13, 1, 2, v12, 0);
        if (v14 == (void *)-1)
          v21 = 0;
        else
          v21 = -[_OSLogChunkMemory initWithBytes:size:deallocator:]([_OSLogChunkMemory alloc], "initWithBytes:size:deallocator:", v14, v13, &__block_literal_global_874);
      }
      fclose(v9);
      v15 = -[_OSLogIndex initWithCollection:buildLocalIndex:]([_OSLogIndex alloc], "initWithCollection:buildLocalIndex:", self->_oslcr, (options & 4) == 0);
      index = self->_index;
      self->_index = v15;

      if (v21)
        -[_OSLogIndex insertChunkStore:](self->_index, "insertChunkStore:", v21);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
      startDate = self->_startDate;
      self->_startDate = v17;

      objc_storeStrong((id *)&self->_sparseDataStart, self->_startDate);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
      endDate = self->_endDate;
      self->_endDate = v19;

    }
  }
}

- (void)_openPath:(id)a3
{
  void *v4;
  uint64_t v5;
  _OSLogCollectionReference *v6;
  _OSLogCollectionReference *oslcr;
  _OSLogVersioning *v8;
  _OSLogVersioning *version;
  void *v10;
  _OSLogCollectionReference *v11;
  _OSLogCollectionReference *v12;
  _OSLogIndex *v13;
  _OSLogIndex *index;
  uint64_t v15;
  _OSLogChunkFile *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  NSDate *v20;
  NSDate *startDate;
  unint64_t v22;
  NSDate *v23;
  NSDate *endDate;
  int v25;
  uint64_t v26;
  id v27;

  v27 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v27, "hasSuffix:", CFSTR(".logarchive"));
  -[_OSLogCollectionReference close](self->_oslcr, "close");
  +[_OSLogCollectionReference referenceWithURL:error:](_OSLogCollectionReference, "referenceWithURL:error:", v4, 0);
  v6 = (_OSLogCollectionReference *)objc_claimAutoreleasedReturnValue();
  oslcr = self->_oslcr;
  self->_oslcr = v6;

  v8 = -[_OSLogVersioning initWithCollection:error:]([_OSLogVersioning alloc], "initWithCollection:error:", self->_oslcr, 0);
  version = self->_version;
  self->_version = v8;

  if (-[_OSLogVersioning state](self->_version, "state") == 3)
    -[_OSLogVersioning performDestructiveUpdates:](self->_version, "performDestructiveUpdates:", 0);
  if (-[_OSLogVersioning state](self->_version, "state") != 1)
    goto LABEL_15;
  -[_OSLogCollectionReference timesyncReference](self->_oslcr, "timesyncReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[_OSLogCollectionReference close](self->_oslcr, "close");
    +[_OSLogCollectionReference referenceWithURL:error:](_OSLogCollectionReference, "referenceWithURL:error:", v4, 0);
    v11 = (_OSLogCollectionReference *)objc_claimAutoreleasedReturnValue();
    v12 = self->_oslcr;
    self->_oslcr = v11;

  }
  v13 = -[_OSLogIndex initWithCollection:buildLocalIndex:]([_OSLogIndex alloc], "initWithCollection:buildLocalIndex:", self->_oslcr, v5);
  index = self->_index;
  self->_index = v13;

  if ((v5 & 1) != 0)
  {
LABEL_11:
    v17 = -[_OSLogIndex persistStartWalltime](self->_index, "persistStartWalltime");
    v18 = -[_OSLogIndex specialStartWalltime](self->_index, "specialStartWalltime");
    if (v17 >= v18)
      v19 = v18;
    else
      v19 = v17;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(v19 / 0x3B9ACA00));
    v20 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startDate = self->_startDate;
    self->_startDate = v20;

    objc_storeStrong((id *)&self->_sparseDataStart, self->_startDate);
    v22 = -[_OSLogIndex endWalltime](self->_index, "endWalltime");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(v22 / 0x3B9ACA00));
    v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v23;

LABEL_15:
    return;
  }
  v15 = open((const char *)objc_msgSend(objc_retainAutorelease(v27), "fileSystemRepresentation"), 0);
  v16 = -[_OSLogChunkFile initWithFileDescriptor:error:]([_OSLogChunkFile alloc], "initWithFileDescriptor:error:", v15, 0);
  if (v16)
    -[_OSLogIndex insertChunkStore:](self->_index, "insertChunkStore:", v16);
  if (close(v15) != -1)
  {
LABEL_10:

    goto LABEL_11;
  }
  v25 = *__error();
  v26 = *__error();
  if (v25 != 9)
  {
    _os_assumes_log();
    goto LABEL_10;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v26;
  __break(1u);
}

- (void)_openFiles
{
  void *v3;
  NSURL *logFile;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (_os_trace_shared_paths_init_once != -1)
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  objc_msgSend(v3, "stringWithUTF8String:", _os_trace_persist_path);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  logFile = self->_logFile;
  if (!logFile && !self->_logArchive)
    goto LABEL_8;
  -[NSURL path](logFile, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v12))
  {

LABEL_8:
    -[OSLogPersistence _openLocalPersistenceDir](self, "_openLocalPersistenceDir");
    goto LABEL_13;
  }
  -[NSURL path](self->_logArchive, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v12);

  if (v7)
    goto LABEL_8;
  -[NSURL path](self->_logArchive, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[NSURL path](self->_logFile, "path");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  -[OSLogPersistence _openPath:](self, "_openPath:", v11);
LABEL_13:

}

- (OSLogPersistence)init
{
  OSLogPersistence *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OSLogPersistence;
  result = -[OSLogPersistence init](&v3, sel_init);
  if (result)
  {
    result->_batchSize = 1000;
    result->_verbose = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[_OSLogCollectionReference close](self->_oslcr, "close");
  v3.receiver = self;
  v3.super_class = (Class)OSLogPersistence;
  -[OSLogPersistence dealloc](&v3, sel_dealloc);
}

- (void)setLogFile:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  char v14;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if ((objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    -[OSLogPersistence _openFiles](self, "_openFiles");
    goto LABEL_7;
  }
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("tracev3"));

  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File name does not end with .tracev3 (%@)"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("Invalid file provided");
    goto LABEL_11;
  }
  if ((objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v14) & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Log file named '%@' not found."), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("File not Found");
    goto LABEL_11;
  }
  if (v14)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Log file named '%@' is not a regular file."), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("File is not a regular file.");
LABEL_11:
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v12, v11, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
  objc_storeStrong((id *)&self->_logFile, a3);
  -[OSLogPersistence _openFiles](self, "_openFiles");

LABEL_7:
}

- (void)setLogArchive:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  char v14;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (objc_msgSend(v5, "isFileURL"))
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("logarchive"));

    if ((v9 & 1) != 0)
    {
      if ((objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v14) & 1) != 0)
      {
        if (v14)
        {
          objc_storeStrong((id *)&self->_logArchive, a3);
          -[OSLogPersistence _openFiles](self, "_openFiles");

          goto LABEL_6;
        }
        v10 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Log archive named '%@' is not a package."), v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("Log archive is not a package.");
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Log archive named '%@' not found."), v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("File not Found");
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File name does not end with .logarchive (%@)"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("Invalid archive provided");
    }
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v12, v11, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
LABEL_6:

}

- (void)setPredicate:(id)a3
{
  _OSLogPredicateMapper *v4;
  _OSLogLegacyPredicateMapper *v5;
  void *v6;
  _OSLogLegacyPredicateMapper *v7;
  void *v8;
  NSCompoundPredicate *v9;
  NSCompoundPredicate *predicate;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (v15)
  {
    v4 = -[_OSLogPredicateMapper initWithPredicate:andValidate:]([_OSLogPredicateMapper alloc], "initWithPredicate:andValidate:", v15, 0);
    v5 = [_OSLogLegacyPredicateMapper alloc];
    -[_OSLogPredicateMapper mappedPredicate](v4, "mappedPredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_OSLogPredicateMapper initWithPredicate:](v5, "initWithPredicate:", v6);

    -[_OSLogPredicateMapper mappedPredicate](v7, "mappedPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      -[_OSLogPredicateMapper validationErrors](v7, "validationErrors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "exceptionWithName:reason:userInfo:", CFSTR("OSLogInvalidPredicateException"), v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(objc_retainAutorelease(v14));
    }
    -[_OSLogPredicateMapper mappedPredicate](v7, "mappedPredicate");
    v9 = (NSCompoundPredicate *)objc_claimAutoreleasedReturnValue();
    predicate = self->_predicate;
    self->_predicate = v9;

    if ((-[_OSLogPredicateMapper flags](v4, "flags") & 2) != 0)
      self->_options |= 1uLL;
    if ((-[_OSLogPredicateMapper flags](v4, "flags") & 1) != 0)
      self->_options |= 3uLL;

  }
  else
  {
    v4 = (_OSLogPredicateMapper *)self->_predicate;
    self->_predicate = 0;
  }

}

- (BOOL)allowSensitive
{
  if ((self->_options & 0x40000000) != 0)
    return 0;
  if (geteuid() && !self->_logArchive)
    return self->_logFile != 0;
  return 1;
}

- (int64_t)archiveVersion
{
  _OSLogVersioning *version;

  version = self->_version;
  if (version)
    return -[_OSLogVersioning version](version, "version");
  else
    return -1;
}

- (int64_t)archiveState
{
  int64_t result;
  unint64_t v3;

  result = (int64_t)self->_version;
  if (result)
  {
    v3 = objc_msgSend((id)result, "state");
    if (v3 > 3)
      return 2;
    else
      return qword_19EA7F138[v3];
  }
  return result;
}

- (BOOL)streamChunks:(id)a3 andEntries:(id)a4 flags:(unsigned int)a5
{
  id v8;
  id v9;
  _OSLogIndex *index;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _OWORD v17[6];
  __int128 v18;

  v8 = a3;
  v9 = a4;
  v18 = 0u;
  memset(v17, 0, sizeof(v17));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  *__error() = 3;
  _chunk_support_context_init((uint64_t)v17);
  *(_QWORD *)&v18 = v9;
  *((_QWORD *)&v18 + 1) = v8;
  LODWORD(v17[0]) = a5;
  index = self->_index;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__OSLogPersistence_streamChunks_andEntries_flags___block_invoke;
  v12[3] = &unk_1E4156FF8;
  v12[4] = &v13;
  v12[5] = v17;
  -[_OSLogIndex enumerateFilesUsingBlock:](index, "enumerateFilesUsingBlock:", v12);
  _chunk_support_context_clear((uint64_t)v17);
  LOBYTE(a5) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return a5;
}

- (void)enumerateFromStartDate:(id)a3 toEndDate:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  unint64_t v16;
  _BOOL4 v18;
  unint64_t options;
  unsigned int v20;
  uint64_t v21;
  _OSLogIndex *index;
  id v23;
  _QWORD v24[5];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "timeIntervalSince1970");
  if (v11 <= 0.0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v8, "timeIntervalSince1970");
    v13 = (unint64_t)(v12 * 1000000000.0);
  }
  objc_msgSend(v9, "timeIntervalSince1970");
  if (v14 <= 0.0)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v9, "timeIntervalSince1970");
    v16 = (unint64_t)(v15 * 1000000000.0);
  }
  if (!self->_index)
    -[OSLogPersistence _openFiles](self, "_openFiles");
  if (v16 < v13 || v16 == 0)
    v16 = -1;
  v18 = -[OSLogPersistence allowSensitive](self, "allowSensitive");
  options = self->_options;
  v20 = !v18 & 0xFFFFFFFD | (2 * (options & 1));
  if ((options & 3) != 0)
    v21 = v20 | 4;
  else
    v21 = v20;
  index = self->_index;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __63__OSLogPersistence_enumerateFromStartDate_toEndDate_withBlock___block_invoke;
  v24[3] = &unk_1E4157020;
  v24[4] = self;
  v25 = v10;
  v23 = v10;
  -[_OSLogIndex enumerateEntriesFrom:to:options:usingBlock:](index, "enumerateEntriesFrom:to:options:usingBlock:", v13, v16, v21, v24);

}

- (void)enumerateFromLastBootWithBlock:(id)a3
{
  id v4;
  _BOOL4 v5;
  unint64_t options;
  int v7;
  uint64_t v8;
  _OSLogIndex *index;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (!self->_index)
    -[OSLogPersistence _openFiles](self, "_openFiles");
  v5 = -[OSLogPersistence allowSensitive](self, "allowSensitive");
  options = self->_options;
  if ((options & 3) != 0)
    v7 = !v5 & 0xFFFFFFFD | (2 * (options & 1)) | 4;
  else
    v7 = !v5 & 0xFFFFFFFD | (2 * (options & 1));
  v8 = v7 & 0xFFFFFFBF | (((options >> 5) & 1) << 6);
  index = self->_index;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__OSLogPersistence_enumerateFromLastBootWithBlock___block_invoke;
  v11[3] = &unk_1E4157020;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[_OSLogIndex enumerateEntriesFromLastBootWithOptions:usingBlock:](index, "enumerateEntriesFromLastBootWithOptions:usingBlock:", v8, v11);

}

- (void)fetchFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__838;
    v17 = __Block_byref_object_dispose__839;
    v18 = (id)objc_opt_new();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__OSLogPersistence_fetchFromStartDate_toEndDate___block_invoke;
    v10[3] = &unk_1E4157048;
    v12 = &v13;
    v10[4] = self;
    v9 = WeakRetained;
    v11 = v9;
    -[OSLogPersistence enumerateFromStartDate:toEndDate:withBlock:](self, "enumerateFromStartDate:toEndDate:withBlock:", v6, v7, v10);
    if (objc_msgSend((id)v14[5], "count"))
      objc_msgSend(v9, "persistence:results:error:", self, v14[5], 0);
    objc_msgSend(v9, "persistenceDidFinishReadingForStartDate:endDate:", v6, v7);

    _Block_object_dispose(&v13, 8);
  }

}

- (_os_timesync_db_s)timesync
{
  return -[_OSLogIndex timesync](self->_index, "timesync");
}

- (NSDictionary)statistics
{
  char *i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[7];
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;
  rb_tree_t v33;
  _QWORD v34[3];
  char v35;
  _QWORD v36[4];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[9];
  _QWORD v40[9];
  _QWORD v41[8];
  _QWORD v42[10];

  v42[8] = *MEMORY[0x1E0C80C00];
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x6010000000;
  v32 = &unk_19EA88A4A;
  memset(&v33, 0, sizeof(v33));
  rb_tree_init(&v33, (const rb_tree_ops_t *)&statistics_ops);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __30__OSLogPersistence_statistics__block_invoke;
  v28[3] = &unk_1E41570D8;
  v28[4] = v36;
  v28[5] = v34;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __30__OSLogPersistence_statistics__block_invoke_2;
  v27[3] = &unk_1E4157100;
  v27[4] = &v29;
  v27[5] = v34;
  v27[6] = v36;
  -[OSLogPersistence streamChunks:andEntries:flags:](self, "streamChunks:andEntries:flags:", v28, v27, 0);
  if (rb_tree_count((rb_tree_t *)(v30 + 4)))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", rb_tree_count((rb_tree_t *)(v30 + 4)));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", rb_tree_count((rb_tree_t *)(v30 + 4)));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = (char *)rb_tree_iterate((rb_tree_t *)(v30 + 4), 0, 1u);
          i;
          i = (char *)rb_tree_iterate((rb_tree_t *)(v30 + 4), i, 1u))
    {
      if (*((_QWORD *)i + 133))
      {
        v41[0] = CFSTR("uuid");
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", i + 24);
        v42[0] = v4;
        v41[1] = CFSTR("path");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", i + 40);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v42[1] = v5;
        v41[2] = CFSTR("activityCreationCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", **((_QWORD **)i + 133));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v42[2] = v6;
        v41[3] = CFSTR("userActionCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*((_QWORD *)i + 133) + 24));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v42[3] = v7;
        v41[4] = CFSTR("logMessageCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*((_QWORD *)i + 133) + 16));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v42[4] = v8;
        v41[5] = CFSTR("traceMessageCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*((_QWORD *)i + 133) + 8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v42[5] = v9;
        v41[6] = CFSTR("totalProcessPublicSize");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*((_QWORD *)i + 133) + 56));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v42[6] = v10;
        v41[7] = CFSTR("totalProcessPrivateSize");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*((_QWORD *)i + 133) + 64));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v42[7] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v12);

      }
      v39[0] = CFSTR("uuid");
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", i + 24);
      v40[0] = v26;
      v39[1] = CFSTR("path");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", i + 40);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v13;
      v39[2] = CFSTR("activityCreationCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)i + 134));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2] = v14;
      v39[3] = CFSTR("userActionCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)i + 137));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v40[3] = v15;
      v39[4] = CFSTR("logMessageCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)i + 136));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40[4] = v16;
      v39[5] = CFSTR("traceMessageCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)i + 135));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v40[5] = v17;
      v39[6] = CFSTR("tracePublicSize");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)i + 138));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v40[6] = v18;
      v39[7] = CFSTR("logPublicSize");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)i + 139));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v40[7] = v19;
      v39[8] = CFSTR("logPrivateSize");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)i + 140));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v40[8] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v21);

    }
    v37[0] = CFSTR("perProcessStatistics");
    v37[1] = CFSTR("perSenderStatistics");
    v38[0] = v24;
    v38[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  return (NSDictionary *)v22;
}

- (NSURL)logFile
{
  return self->_logFile;
}

- (NSURL)logArchive
{
  return self->_logArchive;
}

- (OSLogPersistenceDelegate)delegate
{
  return (OSLogPersistenceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSCompoundPredicate)predicate
{
  return self->_predicate;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSString)currentFile
{
  return self->_currentFile;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)sparseDataStart
{
  return self->_sparseDataStart;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)decodeFailures
{
  return self->_decodeFailures;
}

- (unint64_t)messagesFiltered
{
  return self->_messagesFiltered;
}

- (unint64_t)logMessageCount
{
  return self->_logMessageCount;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_sparseDataStart, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_currentFile, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logArchive, 0);
  objc_storeStrong((id *)&self->_logFile, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_oslcr, 0);
}

uint64_t __30__OSLogPersistence_statistics__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 64))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return 1;
}

uint64_t __30__OSLogPersistence_statistics__block_invoke_2(_QWORD *a1, uint64_t a2)
{
  _QWORD *node;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  const unsigned __int8 *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  node = rb_tree_find_node((rb_tree_t *)(*(_QWORD *)(a1[4] + 8) + 32), *(const void **)(a2 + 24));
  if (node)
  {
    v5 = (uint64_t)node;
    v6 = (_QWORD *)node[133];
  }
  else
  {
    v5 = _os_trace_calloc();
    if (*(_QWORD *)(a2 + 32))
      __strlcpy_chk();
    else
      uuid_unparse_upper(*(const unsigned __int8 **)(a2 + 24), (char *)(v5 + 40));
    uuid_copy((unsigned __int8 *)(v5 + 24), *(const unsigned __int8 **)(a2 + 24));
    rb_tree_insert_node((rb_tree_t *)(*(_QWORD *)(a1[4] + 8) + 32), (void *)v5);
    v6 = (_QWORD *)_os_trace_calloc();
    *(_QWORD *)(v5 + 1064) = v6;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v7 = v6[8];
    v6[7] += **(unsigned __int16 **)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 64);
    v6[8] = v7 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 80);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
  v8 = *(const unsigned __int8 **)(a2 + 80);
  if (v8)
  {
    if (uuid_compare(v8, *(const unsigned __int8 **)(a2 + 24)))
    {
      v5 = (uint64_t)rb_tree_find_node((rb_tree_t *)(*(_QWORD *)(a1[4] + 8) + 32), *(const void **)(a2 + 80));
      if (!v5)
      {
        v5 = _os_trace_calloc();
        __strlcpy_chk();
        if (!*(_BYTE *)(v5 + 40))
          uuid_unparse_upper(*(const unsigned __int8 **)(a2 + 80), (char *)(v5 + 40));
        uuid_copy((unsigned __int8 *)(v5 + 24), *(const unsigned __int8 **)(a2 + 80));
        rb_tree_insert_node((rb_tree_t *)(*(_QWORD *)(a1[4] + 8) + 32), (void *)v5);
      }
    }
  }
  v9 = *(_DWORD *)a2;
  if (*(int *)a2 > 767)
  {
    if (v9 == 768)
    {
      ++*(_QWORD *)(v5 + 1080);
      *(_QWORD *)(v5 + 1104) += *(_QWORD *)(a2 + 160);
      ++v6[1];
      v11 = *(_QWORD *)(a2 + 160);
      v6 += 4;
      goto LABEL_25;
    }
    if (v9 == 1024)
    {
      *(_QWORD *)(v5 + 1112) += *(_QWORD *)(a2 + 160);
      *(_QWORD *)(v5 + 1120) += *(_QWORD *)(a2 + 176);
      ++*(_QWORD *)(v5 + 1088);
      v10 = v6[6];
      v6[5] += *(_QWORD *)(a2 + 160);
      v6[6] = v10 + *(_QWORD *)(a2 + 176);
      v6 += 2;
      goto LABEL_23;
    }
  }
  else
  {
    if (v9 == 513)
    {
      ++*(_QWORD *)(v5 + 1072);
      goto LABEL_23;
    }
    if (v9 == 515)
    {
      ++*(_QWORD *)(v5 + 1096);
      v6 += 3;
LABEL_23:
      v11 = 1;
LABEL_25:
      *v6 += v11;
    }
  }
  return 1;
}

uint64_t __49__OSLogPersistence_fetchFromStartDate_toEndDate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", a2);
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    result = objc_msgSend(*(id *)(a1 + 40), "persistence:results:error:");
    if (!(_DWORD)result)
      return result;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeAllObjects");
  }
  return 1;
}

uint64_t __51__OSLogPersistence_enumerateFromLastBootWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  +[OSActivityEvent activityEventFromStreamEntry:](OSActivityEvent, "activityEventFromStreamEntry:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v4 && (objc_msgSend(v4, "evaluateWithObject:", v3) & 1) == 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
    v5 = 1;
  }
  else
  {
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  return v5;
}

uint64_t __63__OSLogPersistence_enumerateFromStartDate_toEndDate_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  BOOL v5;
  uint64_t v6;

  +[OSActivityEvent activityEventFromStreamEntry:](OSActivityEvent, "activityEventFromStreamEntry:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "evaluateWithObject:", v3);
  if ((v4 & 1) != 0)
  {
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
    v6 = 1;
  }

  return v6;
}

uint64_t __50__OSLogPersistence_streamChunks_andEntries_flags___block_invoke(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  _QWORD v12[2];
  unsigned int (*v13)(_QWORD *);
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v7 = 0;
  v8 = *(_QWORD *)(a1 + 40);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 1;
  *(_DWORD *)(v8 + 4) = a2;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v13 = (unsigned int (*)(_QWORD *))___os_activity_stream_mapped_file_block_invoke;
  v14 = &unk_1E4157A98;
  v15 = &v18;
  v16 = a3;
  v17 = v8;
  do
  {
    if (a4 - v7 < 0x10)
      break;
    v9 = *(_QWORD *)(a3 + v7 + 8);
    if (a4 - v7 - 16 < v9)
      break;
    if (!v13(v12))
      break;
    v7 = (v7 + v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  }
  while (v7 - 1 < a4);
  *(_DWORD *)(v8 + 4) = -1;
  v10 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10;
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

uint64_t __44__OSLogPersistence__openLocalPersistenceDir__block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

@end
