@implementation _HKZipArchiveExtractor

- (_HKZipArchiveExtractor)init
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

- (id)_initWithData:(id)a3 fileHandle:(id)a4 path:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  _HKZipArchiveExtractor *v15;
  _HKZipArchiveExtractor *v16;
  uint64_t v17;
  NSString *pathname;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10 || v11 || v12)
  {
    v14 = v11 == 0;
    if (!v12)
      v14 = v11 != 0;
    if (v10 || !v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKZipArchiveExtractor.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("((data != nil) && (fileHandle == nil) && (path == nil)) || ((data == nil) && (fileHandle != nil) && (path == nil)) || ((data == nil) && (fileHandle == nil) && (path != nil))"));

    }
  }
  v21.receiver = self;
  v21.super_class = (Class)_HKZipArchiveExtractor;
  v15 = -[_HKZipArchiveExtractor init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_archive = 0;
    objc_storeStrong((id *)&v15->_archiveData, a3);
    objc_storeStrong((id *)&v16->_fileHandle, a4);
    v17 = objc_msgSend(v13, "copy");
    pathname = v16->_pathname;
    v16->_pathname = (NSString *)v17;

    v16->_enumerationCount = 0;
  }

  return v16;
}

- (_HKZipArchiveExtractor)initWithPathname:(id)a3
{
  id v5;
  _HKZipArchiveExtractor *v6;
  void *v8;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "pathname");
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKZipArchiveExtractor.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[pathname length] > 0"));

  }
  v6 = -[_HKZipArchiveExtractor _initWithData:fileHandle:path:](self, "_initWithData:fileHandle:path:", 0, 0, v5);

  return v6;
}

- (_HKZipArchiveExtractor)initWithURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _HKZipArchiveExtractor *v8;
  void *v10;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "url");
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKZipArchiveExtractor.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(path != nil) && (path.length > 0)"));

  }
  v8 = -[_HKZipArchiveExtractor _initWithData:fileHandle:path:](self, "_initWithData:fileHandle:path:", 0, 0, v7);

  return v8;
}

- (_HKZipArchiveExtractor)initWithFileHandle:(id)a3
{
  id v4;
  _HKZipArchiveExtractor *v5;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "fileHandle");
  v5 = -[_HKZipArchiveExtractor _initWithData:fileHandle:path:](self, "_initWithData:fileHandle:path:", 0, v4, 0);

  return v5;
}

- (_HKZipArchiveExtractor)initWithData:(id)a3
{
  id v5;
  _HKZipArchiveExtractor *v6;
  void *v8;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "archiveData");
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKZipArchiveExtractor.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("archiveData.length > 0"));

  }
  v6 = -[_HKZipArchiveExtractor _initWithData:fileHandle:path:](self, "_initWithData:fileHandle:path:", v5, 0, 0);

  return v6;
}

- (id)description
{
  NSFileHandle *pathname;
  NSFileHandle *v4;
  NSFileHandle *v5;
  void *v6;

  pathname = (NSFileHandle *)self->_pathname;
  if (!pathname)
  {
    if (self->_archiveData)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ length %lu"), objc_opt_class(), -[NSData length](self->_archiveData, "length"));
      v4 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    pathname = self->_fileHandle;
    if (!pathname)
    {
      v5 = 0;
      goto LABEL_6;
    }
  }
  v4 = pathname;
LABEL_5:
  v5 = v4;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)enumerateEntriesWithError:(id *)a3 block:(id)a4
{
  void (**v7)(id, void *, _BYTE *);
  id v8;
  void *v9;
  NSData *archiveData;
  int open_memory;
  NSFileHandle *fileHandle;
  NSString *pathname;
  unsigned int next_header;
  void *v15;
  void *v16;
  _HKZipArchiveEntry *v17;
  _HKZipArchiveEntry *v18;
  BOOL v19;
  BOOL v20;
  char v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *, _BYTE *))a4;
  if (self->_isEnumeratingEntries)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("self"), objc_opt_class(), a2, CFSTR("Already enumerating this archive"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError(v8);
    }

    goto LABEL_27;
  }
  self->_isEnumeratingEntries = 1;
  ++self->_enumerationCount;
  self->_archive = (archive *)archive_read_new();
  if (!archive_read_support_format_zip() && !archive_read_support_filter_all())
  {
    archiveData = self->_archiveData;
    if (archiveData)
    {
      -[NSData bytes](archiveData, "bytes");
      -[NSData length](self->_archiveData, "length");
      open_memory = archive_read_open_memory();
LABEL_15:
      if (!open_memory)
      {
        v23 = 0;
        while (1)
        {
          next_header = archive_read_next_header();
          if (next_header)
            break;
          if (archive_entry_filetype() == 0x8000)
          {
            v22 = 0;
            v15 = (void *)MEMORY[0x19AEC7968]();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_entry_pathname());
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = [_HKZipArchiveEntry alloc];
            v18 = -[_HKZipArchiveEntry initWithExtractor:currentEntry:pathname:](v17, "initWithExtractor:currentEntry:pathname:", self, v23, v16);
            v7[2](v7, v18, &v22);
            v19 = -[_HKZipArchiveEntry didReadEntryData](v18, "didReadEntryData");

            objc_autoreleasePoolPop(v15);
            if (v22)
            {
              next_header = 0;
              break;
            }
            if (!v19)
            {
              next_header = archive_read_data_skip();
              if (next_header)
                break;
            }
          }
        }
        if (next_header < 2)
        {
          v20 = 1;
          goto LABEL_28;
        }
      }
      goto LABEL_26;
    }
    fileHandle = self->_fileHandle;
    if (fileHandle)
    {
      -[NSFileHandle fileDescriptor](fileHandle, "fileDescriptor");
      open_memory = archive_read_open_fd();
      goto LABEL_15;
    }
    pathname = self->_pathname;
    if (pathname)
    {
      -[NSString UTF8String](pathname, "UTF8String");
      open_memory = archive_read_open_filename();
      goto LABEL_15;
    }
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 920, CFSTR("Unable to open/read data: %s"), archive_error_string());
LABEL_27:
  v20 = 0;
LABEL_28:
  if (self->_archive)
  {
    archive_read_free();
    self->_archive = 0;
  }
  if (self->_isEnumeratingEntries)
    self->_isEnumeratingEntries = 0;

  return v20;
}

- (id)numberOfEntriesWithError:(id *)a3
{
  NSNumber *numberOfEntries;
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  numberOfEntries = self->_numberOfEntries;
  if (numberOfEntries)
    return numberOfEntries;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51___HKZipArchiveExtractor_numberOfEntriesWithError___block_invoke;
  v9[3] = &unk_1E37EA558;
  v9[4] = &v10;
  if (-[_HKZipArchiveExtractor enumerateEntriesWithError:block:](self, "enumerateEntriesWithError:block:", a3, v9))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11[3]);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_numberOfEntries;
    self->_numberOfEntries = v6;

    v8 = self->_numberOfEntries;
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v8;
}

- (archive)archive
{
  return self->_archive;
}

- (int64_t)enumerationCount
{
  return self->_enumerationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfEntries, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_archiveData, 0);
  objc_storeStrong((id *)&self->_pathname, 0);
}

- (void)enumerateEntriesWithError:(uint64_t)a3 block:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  id v6;

  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  v6 = a1;
  _os_log_fault_impl(&dword_19A0E6000, a4, OS_LOG_TYPE_FAULT, "Caught exception in %{public}@: %{public}@", (uint8_t *)a3, 0x16u);

}

@end
