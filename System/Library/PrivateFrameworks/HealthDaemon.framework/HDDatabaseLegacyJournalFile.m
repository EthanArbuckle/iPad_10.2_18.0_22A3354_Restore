@implementation HDDatabaseLegacyJournalFile

- (HDDatabaseLegacyJournalFile)init
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

- (HDDatabaseLegacyJournalFile)initWithURL:(id)a3
{
  id v5;
  HDDatabaseLegacyJournalFile *v6;
  HDDatabaseLegacyJournalFile *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDatabaseLegacyJournalFile;
  v6 = -[HDDatabaseLegacyJournalFile init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    v7->_version = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[HDDatabaseLegacyJournalFile close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)HDDatabaseLegacyJournalFile;
  -[HDDatabaseLegacyJournalFile dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDDatabaseLegacyJournalFile _fullPath]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDDatabaseLegacyJournalFile isOpen](self, "isOpen");
  v6 = CFSTR("closed");
  if (v5)
    v6 = CFSTR("open");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)_fullPath
{
  if (a1)
  {
    objc_msgSend(a1[1], "path");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (NSString)name
{
  return -[NSURL lastPathComponent](self->_URL, "lastPathComponent");
}

- (NSString)journalPath
{
  void *v2;
  void *v3;

  -[NSURL path](self->_URL, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isOpen
{
  return self->_fileHandle != 0;
}

- (int64_t)size
{
  NSURL *URL;
  id v4;

  URL = self->_URL;
  v4 = 0;
  -[NSURL getResourceValue:forKey:error:](URL, "getResourceValue:forKey:error:", &v4, *MEMORY[0x1E0C99998], 0);
  return objc_msgSend(v4, "integerValue");
}

- (double)modificationTime
{
  NSURL *URL;
  double v3;
  double v4;
  void *v5;
  double v6;
  id v8;

  URL = self->_URL;
  v8 = 0;
  -[NSURL getResourceValue:forKey:error:](URL, "getResourceValue:forKey:error:", &v8, *MEMORY[0x1E0C998D8], 0);
  if (v8)
  {
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    return v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v4 = v6;

  }
  return v4;
}

- (BOOL)openForReadingWithError:(id *)a3
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  id v16;

  if (-[HDDatabaseLegacyJournalFile isOpen](self, "isOpen"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseLegacyJournalFile.m"), 101, CFSTR("Cannot open %@ because it is already open"), self);

  }
  -[HDDatabaseLegacyJournalFile name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseLegacyJournalFile journalPath](self, "journalPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_opt_self();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3608];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v10, "fileHandleForReadingFromURL:error:", v11, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  if (!v12)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a3, 102, CFSTR("Error opening journal file"), v13);

  if (v12)
    objc_storeStrong((id *)&self->_fileHandle, v12);

  return v12 != 0;
}

- (void)close
{
  NSFileHandle *fileHandle;
  NSFileHandle *v3;

  fileHandle = self->_fileHandle;
  self->_fileHandle = 0;
  v3 = fileHandle;

  -[NSFileHandle closeFile](v3, "closeFile");
}

- (BOOL)removeWithError:(id *)a3
{
  void *v5;
  void *v6;

  -[NSURL removeAllCachedResourceValues](self->_URL, "removeAllCachedResourceValues");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseLegacyJournalFile _fullPath]((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "removeItemAtPath:error:", v6, a3);

  return (char)a3;
}

- (unsigned)readVersionWithError:(id *)a3
{
  unsigned int *p_version;
  unsigned int version;
  NSFileHandle *fileHandle;
  BOOL v8;
  id v9;
  id v11;

  p_version = &self->_version;
  version = self->_version;
  if (version)
    return version;
  if (!-[HDDatabaseLegacyJournalFile isOpen](self, "isOpen"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Cannot read journal version if journal file is not open"));
    return 0;
  }
  if (!-[NSFileHandle seekToOffset:error:](self->_fileHandle, "seekToOffset:error:", 0, a3))
    return 0;
  fileHandle = self->_fileHandle;
  v11 = 0;
  v8 = -[NSFileHandle hk_readValue:ofSize:error:](fileHandle, "hk_readValue:ofSize:error:", p_version, 4, &v11);
  v9 = v11;
  if (v8)
  {
    version = *p_version;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a3, 100, CFSTR("Failed to read journal version"), v9);
    version = 0;
  }

  return version;
}

- (unsigned)enumerateEntriesWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  NSFileHandle *fileHandle;
  id v15;
  id v16;
  NSFileHandle *v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int *v30;
  NSObject *v31;
  NSFileHandle *v32;
  id v33;
  BOOL v34;
  id v35;
  id v36;
  uint64_t v37;
  BOOL v38;
  id v39;
  NSFileHandle *v40;
  NSObject *v41;
  void *v42;
  NSObject *v44;
  int v45;
  int *v46;
  char *v47;
  id v48;
  id v49;
  uint64_t v50;
  NSFileHandle *v51;
  uint8_t *v52;
  void *v53;
  off_t st_size;
  id v55;
  uint64_t v56;
  id v57;
  NSFileHandle *v58;
  id v59;
  id v60;
  stat v61;
  id v62;
  unsigned __int8 v63;
  uint8_t buf[8];
  __int128 v65;
  void *v66;
  id v67;
  stat v68;
  char *v69;
  uint64_t v70;
  uint8_t v71[8];
  __int16 v72;
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (-[HDDatabaseLegacyJournalFile isOpen](self, "isOpen"))
  {
    v11 = -[HDDatabaseLegacyJournalFile readVersionWithError:](self, "readVersionWithError:", a5);
    if (v11)
    {
      v12 = v11;
      -[HDDatabaseLegacyJournalFile _fullPath]((id *)&self->super.isa);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      fileHandle = self->_fileHandle;
      v15 = v13;
      v16 = v9;
      v17 = fileHandle;
      v60 = v10;
      v18 = objc_opt_self();
      if (-[NSFileHandle seekToOffset:error:](v17, "seekToOffset:error:", 4, a5))
      {
        memset(&v61, 0, sizeof(v61));
        v19 = -[NSFileHandle fileDescriptor](v17, "fileDescriptor");
        if ((fstat(v19, &v61) & 0x80000000) == 0)
        {
          v59 = v16;
          v20 = mmap(0, v61.st_size, 1, 2, v19, 0);
          if (v20 == (void *)-1)
          {
            _HKInitializeLogging();
            v21 = (void *)*MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              v44 = v21;
              v45 = *__error();
              v46 = __error();
              v47 = strerror(*v46);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v45;
              LOWORD(v65) = 2080;
              *(_QWORD *)((char *)&v65 + 2) = v47;
              _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "Journal file could not be mapped: %d: %s", buf, 0x12u);

            }
            v20 = 0;
          }
          v56 = (uint64_t)v20;
          st_size = v61.st_size;
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v65 = 3221225472;
          *((_QWORD *)&v65 + 1) = __92__HDDatabaseLegacyJournalFile__processJournalFile_profile_fileHandle_version_error_handler___block_invoke;
          v66 = &unk_1E6CF34F0;
          v22 = v60;
          v68 = v61;
          v67 = v22;
          v69 = sel__processJournalFile_profile_fileHandle_version_error_handler_;
          v70 = v18;
          v55 = v15;
          v57 = v16;
          v58 = v17;
          v23 = buf;
          objc_opt_self();
          if (v12 - 1 < 2)
          {
            _HKInitializeLogging();
            v31 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v71 = 67109378;
              *(_DWORD *)&v71[4] = v12;
              v72 = 2114;
              v27 = v55;
              v73 = v55;
              _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "Ignoring version %u journal %{public}@", v71, 0x12u);
              v26 = 2;
              v25 = (void *)v56;
            }
            else
            {
              v26 = 2;
              v27 = v55;
              v25 = (void *)v56;
            }
          }
          else
          {
            if (v12 - 3 < 2)
            {
              v24 = v57;
              v25 = (void *)v56;
              v26 = +[HDDatabaseLegacyJournalFile _processOkemoJournalWithVersion:fileHandle:mapping:size:headerLength:profile:error:handler:]((uint64_t)HDDatabaseLegacyJournalFile, v58, v56, st_size, 4, v57, (uint64_t)a5, v23);
              v27 = v55;
LABEL_30:

              if (v25)
                munmap(v25, v61.st_size);

              goto LABEL_33;
            }
            if (v12 == 5)
            {
              v32 = v58;
              v33 = v57;
              v52 = v23;
              v50 = objc_opt_self();
              v63 = 0;
              *(_QWORD *)v71 = 0;
              v34 = -[NSFileHandle hk_readValue:ofSize:error:](v32, "hk_readValue:ofSize:error:", &v63, 1, v71);
              v35 = *(id *)v71;
              v51 = v32;
              v53 = v33;
              if (v34)
              {
                v36 = objc_alloc(MEMORY[0x1E0C99DF0]);
                v49 = objc_retainAutorelease((id)objc_msgSend(v36, "initWithCapacity:", v63));
                v37 = objc_msgSend(v49, "mutableBytes");
                v62 = v35;
                v38 = -[NSFileHandle hk_readValue:ofSize:error:](v32, "hk_readValue:ofSize:error:", v37, v63, &v62);
                v39 = v62;

                v48 = v39;
                if (v38)
                {
                  v40 = v32;
                  v25 = (void *)v56;
                  v26 = +[HDDatabaseLegacyJournalFile _processOkemoJournalWithVersion:fileHandle:mapping:size:headerLength:profile:error:handler:](v50, v40, v56, st_size, v63 + 5, v53, (uint64_t)a5, v52);
                  v16 = v59;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a5, 100, CFSTR("Unable to read build number from journal file"), v39);
                  v26 = 2;
                  v16 = v59;
                  v25 = (void *)v56;
                }
                v24 = v57;

                v27 = v55;
                v42 = v48;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a5, 100, CFSTR("Unable to read build length from journal file"), v35);
                v26 = 2;
                v42 = v35;
                v16 = v59;
                v27 = v55;
                v25 = (void *)v56;
                v24 = v57;
              }

              goto LABEL_30;
            }
            _HKInitializeLogging();
            v41 = *MEMORY[0x1E0CB52B0];
            v27 = v55;
            v25 = (void *)v56;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v71 = 67109378;
              *(_DWORD *)&v71[4] = v12;
              v72 = 2112;
              v73 = v55;
              _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "Unexpected journal version %u at path %@", v71, 0x12u);
            }
            v26 = 2;
          }
          v24 = v57;
          goto LABEL_30;
        }
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *__error();
        v30 = __error();
        objc_msgSend(v28, "hk_assignError:code:format:", a5, 102, CFSTR("Journal file fstat failed: %d: %s"), v29, strerror(*v30));
      }
      v26 = 0;
LABEL_33:

      goto LABEL_34;
    }
    v26 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 100, CFSTR("Journal is not open"));
    v26 = 0;
  }
LABEL_34:

  return v26;
}

+ (id)_loadJournalEntry:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v2, 0);

  objc_msgSend(v3, "setClass:forClassName:", objc_opt_class(), CFSTR("_UserDefaultUpdatedJournalEntry"));
  objc_msgSend(v3, "setClass:forClassName:", objc_opt_class(), CFSTR("_UserDefaultRemovedJournalEntry"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_msgSend(v3, "error"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      v8 = v6;
      objc_msgSend(v3, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_fault_impl(&dword_1B7802000, v8, OS_LOG_TYPE_FAULT, "Error occurred while decoding journal entry: %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }

  return v4;
}

uint64_t __92__HDDatabaseLegacyJournalFile__processJournalFile_profile_fileHandle_version_error_handler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (*(uint64_t (**)(void))(a1[4] + 16))();
  if ((_DWORD)v2 == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[23];
    v5 = a1[24];
    HDStringFromJournalProcessingResult(4u);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v6, v5, CFSTR("HDDatabaseLegacyJournalFile.m"), 329, CFSTR("%@ does not support %@"), v5, v7);

  }
  return v2;
}

+ (uint64_t)_processOkemoJournalWithVersion:(uint64_t)a1 fileHandle:(void *)a2 mapping:(uint64_t)a3 size:(uint64_t)a4 headerLength:(uint64_t)a5 profile:(void *)a6 error:(uint64_t)a7 handler:(void *)a8
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v10 = a2;
  v11 = a6;
  v12 = a8;
  objc_opt_self();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 3;
  v15 = v10;
  v16 = v12;
  HKWithAutoreleasePool();
  v13 = *((unsigned int *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return v13;
}

uint64_t __122__HDDatabaseLegacyJournalFile__processOkemoJournalWithVersion_fileHandle_mapping_size_headerLength_profile_error_handler___block_invoke(_QWORD *a1, _QWORD *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  os_log_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  os_log_t v39;
  NSObject *v40;
  double v41;
  double v42;
  uint64_t v43;
  os_log_t v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  os_log_t v51;
  NSObject *v52;
  double v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  os_log_t v57;
  id v58;
  os_log_t v59;
  NSObject *v60;
  double v61;
  NSObject *v63;
  double v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  _QWORD *v71;
  uint64_t *v72;
  _QWORD *v73;
  _QWORD *v74;
  id v75;
  id v76;
  uint8_t buf[4];
  _BYTE v78[18];
  __int16 v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v5 = v4;
  v6 = a1[7];
  v7 = (os_log_t *)MEMORY[0x1E0CB52B0];
  if (v6)
  {
    v8 = a1[9];
    v9 = a1[10];
    v10 = objc_opt_self();
    v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = (unsigned int *)(v9 + v6);
    v12 = v8 + v6;
    v13 = v8 + v6 - 4;
    v68 = v6;
    if ((unint64_t)v11 >= v13)
    {
      v33 = 0;
    }
    else
    {
      v67 = v8;
      v69 = v5;
      v71 = a2;
      v73 = a1;
      while (1)
      {
        v14 = v11 + 1;
        v15 = *v11;
        v11 = (unsigned int *)((char *)v11 + v15 + 4);
        if ((unint64_t)v11 > v12)
          break;
        v16 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v14, v15, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          +[HDDatabaseLegacyJournalFile _loadJournalEntry:](v10, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v75, "addObject:", v18);
          }
          else
          {
            _HKInitializeLogging();
            v19 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v78 = v15;
              *(_WORD *)&v78[4] = 2048;
              *(_QWORD *)&v78[6] = (char *)v14 - v68;
              _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "Failed to load journal entry (%d bytes at offset %lu); skipping.",
                buf,
                0x12u);
            }
          }

        }
        objc_autoreleasePoolPop(v16);
        if ((unint64_t)v11 >= v13)
        {
          v33 = 0;
          goto LABEL_25;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("*** Journal file too short for expected data, Offset: %lu Length: %d, fileSize: %ld"), (char *)v14 - v68, v15, v67);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14;
LABEL_25:
      a2 = v71;
      a1 = v73;
      v7 = (os_log_t *)MEMORY[0x1E0CB52B0];
      v5 = v69;
    }
    _HKInitializeLogging();
    v34 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v78 = ((unint64_t)v11 - v68) >> 10;
      _os_log_debug_impl(&dword_1B7802000, v34, OS_LOG_TYPE_DEBUG, "Processed file size %luK.", buf, 0xCu);
    }
    v35 = objc_retainAutorelease(v75);
    v36 = v33;
    if (v36)
    {
      v37 = v36;
      if (a2)
        *a2 = objc_retainAutorelease(v36);
      else
        _HKLogDroppedError();

      v38 = v35;
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
      _HKInitializeLogging();
      v44 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      v40 = v44;
      objc_msgSend(v5, "timeIntervalSinceNow");
      v46 = -v45;
      v47 = objc_msgSend(v38, "count");
      v48 = *a2;
      *(_DWORD *)buf = 134218498;
      *(double *)v78 = v46;
      *(_WORD *)&v78[8] = 2048;
      *(_QWORD *)&v78[10] = v47;
      v79 = 2114;
      v80 = v48;
      _os_log_error_impl(&dword_1B7802000, v40, OS_LOG_TYPE_ERROR, "Map load time: %0.2f, entries: %ld, error: %{public}@", buf, 0x20u);
    }
    else
    {

      v38 = v35;
      _HKInitializeLogging();
      v39 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_45;
      v40 = v39;
      objc_msgSend(v5, "timeIntervalSinceNow");
      v42 = -v41;
      v43 = objc_msgSend(v38, "count");
      *(_DWORD *)buf = 134218240;
      *(double *)v78 = v42;
      *(_WORD *)&v78[8] = 2048;
      *(_QWORD *)&v78[10] = v43;
      _os_log_debug_impl(&dword_1B7802000, v40, OS_LOG_TYPE_DEBUG, "Map load time: %0.2f, entries: %ld", buf, 0x16u);
    }

  }
  else
  {
    v20 = (void *)a1[4];
    if (!v20)
    {
      v38 = 0;
      goto LABEL_45;
    }
    v70 = v4;
    v72 = a2;
    v74 = a1;
    v21 = v20;
    v22 = objc_opt_self();
    v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0;
    while (1)
    {
      v24 = (void *)MEMORY[0x1BCCACAC4]();
      objc_msgSend(v21, "readDataOfLength:", 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "length") != 4)
        break;
      v26 = objc_retainAutorelease(v25);
      v27 = *(unsigned int *)objc_msgSend(v26, "bytes");
      objc_msgSend(v21, "readDataOfLength:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "length") == v27)
      {
        +[HDDatabaseLegacyJournalFile _loadJournalEntry:](v22, v28);
        v29 = objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v30 = (void *)v29;
          objc_msgSend(v76, "addObject:", v29);
          v31 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Unknown journal entry (%lu bytes at offset %llu)"), objc_msgSend(v28, "length"), objc_msgSend(v21, "offsetInFile") - objc_msgSend(v28, "length"));
          v32 = objc_claimAutoreleasedReturnValue();

          v30 = 0;
          v31 = 0;
          v23 = (void *)v32;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Journal file too short for expected data, Offset: %lu Length: %ld, fileSize: %llu"), objc_msgSend(v28, "length"), v27, objc_msgSend(v21, "offsetInFile") - objc_msgSend(v28, "length"));
        v31 = 0;
        v30 = v23;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_autoreleasePoolPop(v24);
      if ((v31 & 1) == 0)
        goto LABEL_39;
    }

    objc_autoreleasePoolPop(v24);
LABEL_39:
    _HKInitializeLogging();
    v7 = (os_log_t *)MEMORY[0x1E0CB52B0];
    v49 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
    {
      v63 = v49;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v78 = (unint64_t)objc_msgSend(v21, "offsetInFile") >> 10;
      _os_log_debug_impl(&dword_1B7802000, v63, OS_LOG_TYPE_DEBUG, "Processed file size %lluK.", buf, 0xCu);

    }
    v50 = objc_retainAutorelease(v76);

    v38 = v50;
    a1 = v74;
    v5 = v70;
    if (v23)
    {
      *(_DWORD *)(*(_QWORD *)(v74[6] + 8) + 24) = 2;
      _HKInitializeLogging();
      v51 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      v52 = v51;
      objc_msgSend(v70, "timeIntervalSinceNow");
      v54 = -v53;
      v55 = objc_msgSend(v38, "count");
      v56 = *v72;
      *(_DWORD *)buf = 134218498;
      *(double *)v78 = v54;
      *(_WORD *)&v78[8] = 2048;
      *(_QWORD *)&v78[10] = v55;
      v79 = 2114;
      v80 = v56;
      _os_log_error_impl(&dword_1B7802000, v52, OS_LOG_TYPE_ERROR, "Load time: %0.2f, entries: %ld, error: %{public}@", buf, 0x20u);
    }
    else
    {
      _HKInitializeLogging();
      v57 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_45;
      v52 = v57;
      objc_msgSend(v70, "timeIntervalSinceNow");
      v65 = -v64;
      v66 = objc_msgSend(v38, "count");
      *(_DWORD *)buf = 134218240;
      *(double *)v78 = v65;
      *(_WORD *)&v78[8] = 2048;
      *(_QWORD *)&v78[10] = v66;
      _os_log_debug_impl(&dword_1B7802000, v52, OS_LOG_TYPE_DEBUG, "Load time: %0.2f, entries: %ld", buf, 0x16u);
    }

  }
LABEL_45:
  if (objc_msgSend(v38, "count"))
  {
    v58 = objc_alloc_init(MEMORY[0x1E0C99D68]);

    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();
    _HKInitializeLogging();
    v59 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
    {
      v60 = v59;
      objc_msgSend(v58, "timeIntervalSinceNow");
      *(_DWORD *)buf = 134217984;
      *(double *)v78 = -v61;
      _os_log_debug_impl(&dword_1B7802000, v60, OS_LOG_TYPE_DEBUG, "Merge time: %0.2f", buf, 0xCu);

    }
  }
  else
  {
    v58 = v5;
  }

  return 1;
}

- (BOOL)createAndOpenForWritingWithError:(id *)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3328, CFSTR("HDDatabaseLegacyJournalFile does not support writing"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v4);
    else
      _HKLogDroppedError();
  }

  return v4 == 0;
}

- (BOOL)canAppendData:(id)a3
{
  return 0;
}

- (BOOL)appendData:(id)a3 entryClass:(Class)a4 error:(id *)a5
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3328, CFSTR("HDDatabaseLegacyJournalFile does not support writing"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError();
  }

  return v6 == 0;
}

- (BOOL)flushDataToDisk:(id *)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3328, CFSTR("HDDatabaseLegacyJournalFile does not support writing"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v4);
    else
      _HKLogDroppedError();
  }

  return v4 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
