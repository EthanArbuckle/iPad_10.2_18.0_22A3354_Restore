@implementation _HKZipArchiveEntry

- (_HKZipArchiveEntry)initWithExtractor:(id)a3 currentEntry:(archive_entry *)a4 pathname:(id)a5
{
  id v8;
  id v9;
  _HKZipArchiveEntry *v10;
  _HKZipArchiveEntry *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_HKZipArchiveEntry;
  v10 = -[_HKZipArchiveEntry init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_extractor, v8);
    v11->_entry = a4;
    objc_storeStrong((id *)&v11->_pathname, a5);
    v11->_enumerationCount = objc_msgSend(v8, "enumerationCount");
  }

  return v11;
}

- (id)dataWithError:(id *)a3
{
  return -[_HKZipArchiveEntry dataWithMaxSizeBytes:error:](self, "dataWithMaxSizeBytes:error:", 0, a3);
}

- (id)dataWithMaxSizeBytes:(unint64_t)a3 error:(id *)a4
{
  NSData *data;
  unint64_t v8;
  NSData *v9;
  NSObject *v11;
  NSData *v12;
  NSData *v13;
  NSData *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[_HKZipArchiveEntry _isExtractorStateValidWithError:](self, "_isExtractorStateValidWithError:", a4))
    return 0;
  if (!self->_didReadEntryData)
  {
    data = self->_data;
    self->_data = 0;

    if (archive_entry_size_is_set())
    {
      v8 = archive_entry_size();
      if (v8)
      {
        if (a3 && v8 > a3)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 11, CFSTR("Entry size %ld is larger than specified max size %ld"), v8, a3);
          v9 = self->_data;
          self->_data = 0;
        }
        else
        {
          -[_HKZipArchiveEntry _getDataWithSize:error:](self, "_getDataWithSize:error:", v8, a4);
          v14 = (NSData *)objc_claimAutoreleasedReturnValue();
          v9 = self->_data;
          self->_data = v14;
        }

        goto LABEL_15;
      }
      _HKInitializeLogging();
      HKLogInfrastructure();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v16 = archive_entry_pathname();
        _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "archive entry data zero bytes: %{public}s", buf, 0xCu);
      }

    }
    -[_HKZipArchiveEntry _getDataWithBufferingWithMaxSizeBytes:error:](self, "_getDataWithBufferingWithMaxSizeBytes:error:", a3, a4);
    v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    v13 = self->_data;
    self->_data = v12;

LABEL_15:
    self->_didReadEntryData = 1;
  }
  return self->_data;
}

- (BOOL)enumerateLinesWithError:(id *)a3 block:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSData *data;
  BOOL v12;
  id v13;
  BOOL v14;
  id v16;

  v7 = a4;
  if (!-[_HKZipArchiveEntry _isExtractorStateValidWithError:](self, "_isExtractorStateValidWithError:", a3))
    goto LABEL_16;
  if (self->_didReadEntryData)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("self"), objc_opt_class(), a2, CFSTR("Data has already been read for this entry"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (a3)
      {
        v10 = objc_retainAutorelease(v8);
LABEL_14:
        *a3 = v10;
        goto LABEL_15;
      }
      _HKLogDroppedError(v8);
    }
LABEL_15:

LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  data = self->_data;
  self->_data = 0;

  self->_didReadEntryData = 1;
  v16 = 0;
  v12 = -[_HKZipArchiveEntry _enumerateLinesInCurrentEntryWithError:block:](self, "_enumerateLinesInCurrentEntryWithError:block:", &v16, v7);
  v13 = v16;
  if (!v12)
  {
    if (v13)
    {
      v9 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 122, CFSTR("Archive entry line enumeration failed without setting an error"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_15;
    }
    if (!a3)
    {
      _HKLogDroppedError(v9);
      goto LABEL_15;
    }
    v10 = objc_retainAutorelease(v9);
    v9 = v10;
    goto LABEL_14;
  }

  v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)_isExtractorStateValidWithError:(id *)a3
{
  _HKZipArchiveExtractor **p_extractor;
  id WeakRetained;
  id v7;
  uint64_t v8;
  int64_t enumerationCount;
  void *v11;
  void *v12;

  p_extractor = &self->_extractor;
  WeakRetained = objc_loadWeakRetained((id *)&self->_extractor);
  if (objc_msgSend(WeakRetained, "archive"))
  {
    v7 = objc_loadWeakRetained((id *)p_extractor);
    v8 = objc_msgSend(v7, "enumerationCount");
    enumerationCount = self->_enumerationCount;

    if (v8 == enumerationCount)
      return 1;
  }
  else
  {

  }
  v11 = (void *)MEMORY[0x1E0CB35C8];
  NSStringFromSelector(sel_enumerateEntriesWithError_block_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_assignError:code:format:", a3, 119, CFSTR("%@ is invalid outside of '%@' block"), self, v12);

  return 0;
}

- (id)_getDataWithSize:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;

  v7 = malloc_type_malloc(a3, 0xA5B5F056uLL);
  WeakRetained = objc_loadWeakRetained((id *)&self->_extractor);
  v9 = objc_msgSend(WeakRetained, "archive");

  if (archive_read_data() < 0)
  {
    objc_msgSend((id)objc_opt_class(), "_assignReadError:archive:", a4, v9);
    free(v7);
    v10 = 0;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v7, a3, 1);
  }
  return v10;
}

- (id)_getDataWithBufferingWithMaxSizeBytes:(unint64_t)a3 error:(id *)a4
{
  id WeakRetained;
  uint64_t v7;
  id v8;
  uint64_t data;
  unint64_t v10;
  void *v11;
  _BYTE v13[8192];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_extractor);
  v7 = objc_msgSend(WeakRetained, "archive");

  v8 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  data = archive_read_data();
  if (data >= 1)
  {
    v10 = 0;
    while (1)
    {
      v10 += data;
      if (a3)
      {
        if (v10 > a3)
          break;
      }
      objc_msgSend(v8, "appendBytes:length:", v13);
      data = archive_read_data();
      if (data <= 0)
        goto LABEL_6;
    }

    v8 = 0;
    goto LABEL_9;
  }
LABEL_6:
  if ((data & 0x8000000000000000) == 0)
  {
LABEL_9:
    v8 = v8;
    v11 = v8;
    goto LABEL_10;
  }
  objc_msgSend((id)objc_opt_class(), "_assignReadError:archive:", a4, v7);
  v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)_enumerateLinesInCurrentEntryWithError:(id *)a3 block:(id)a4
{
  _HKZipArchiveExtractor **p_extractor;
  id v7;
  id WeakRetained;
  uint64_t v9;
  _QWORD v11[6];

  p_extractor = &self->_extractor;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_extractor);
  v9 = objc_msgSend(WeakRetained, "archive");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67___HKZipArchiveEntry__enumerateLinesInCurrentEntryWithError_block___block_invoke;
  v11[3] = &unk_1E37EA580;
  v11[4] = self;
  v11[5] = v9;
  LOBYTE(a3) = +[HKLineEnumerator enumerateUTF8LinesWithError:dataProvider:lineHandler:](HKLineEnumerator, "enumerateUTF8LinesWithError:dataProvider:lineHandler:", a3, v11, v7);

  return (char)a3;
}

+ (BOOL)_assignReadError:(id *)a3 archive:(archive *)a4
{
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 920, CFSTR("Unable to read entry data: %s"), archive_error_string());
  return 1;
}

- (NSString)pathname
{
  return self->_pathname;
}

- (BOOL)didReadEntryData
{
  return self->_didReadEntryData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathname, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_extractor);
}

- (void)dataWithMaxSizeBytes:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
}

@end
