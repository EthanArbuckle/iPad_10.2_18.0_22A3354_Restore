@implementation _CDDataCollection

- (_CDDataCollection)initWithStorage:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _CDDataCollection *v20;

  v6 = a3;
  v7 = a4;
  +[_CDPaths defaultSessionPathForDataCollection](_CDPaths, "defaultSessionPathForDataCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDPaths defaultDirectoryPathForDataCollection](_CDPaths, "defaultDirectoryPathForDataCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 1.0;
  if (!CRIsAppleInternal())
  {
    OSAGetDATaskingValue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "doubleValue");
        v11 = v13;
      }
      else
      {
        v11 = 0.0001;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "doubleValue");
        v11 = v14;
      }
    }
    else
    {
      v11 = 0.0001;
    }

  }
  +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[_CDDataCollection initWithStorage:activity:].cold.1();

  OSAGetDATaskingValue();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v17 = objc_msgSend(v16, "unsignedIntegerValue");
  else
    v17 = 7;
  OSAGetDATaskingValue();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v19 = objc_msgSend(v18, "unsignedIntegerValue");
  else
    v19 = 1000;
  v20 = -[_CDDataCollection initWithStorage:activity:sessionPath:dataDirectory:collectionDate:samplingRate:daysPerBatch:eventStreams:maxBatches:](self, "initWithStorage:activity:sessionPath:dataDirectory:collectionDate:samplingRate:daysPerBatch:eventStreams:maxBatches:", v6, v7, v8, v9, v10, v17, v11, 0, v19);

  return v20;
}

- (_CDDataCollection)initWithStorage:(id)a3 activity:(id)a4 sessionPath:(id)a5 dataDirectory:(id)a6 collectionDate:(id)a7 samplingRate:(double)a8 daysPerBatch:(unint64_t)a9 eventStreams:(id)a10 maxBatches:(unint64_t)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _CDDataCollection *v24;
  _CDDataCollection *v25;
  uint64_t v26;
  NSString *sessionPath;
  uint64_t v28;
  NSString *dataDirectory;
  uint64_t v30;
  NSDate *collectionDate;
  void *v32;
  _CDDataCollectionSession *v33;
  id v34;
  NSObject *v35;
  _CDDataCollectionSession *session;
  _CDDataCollectionSession *v37;
  id submissionBlock;
  _CDEventStreamsRegister *v39;
  _CDEventStreamsRegister *eventStreamsRegister;
  id v42;
  id v43;
  objc_super v44;

  v42 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a10;
  v44.receiver = self;
  v44.super_class = (Class)_CDDataCollection;
  v24 = -[_CDDataCollection init](&v44, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_storage, a3);
    objc_storeStrong((id *)&v25->_activity, a4);
    v26 = objc_msgSend(v20, "copy", v42);
    sessionPath = v25->_sessionPath;
    v25->_sessionPath = (NSString *)v26;

    v28 = objc_msgSend(v21, "copy");
    dataDirectory = v25->_dataDirectory;
    v25->_dataDirectory = (NSString *)v28;

    v30 = objc_msgSend(v22, "copy");
    collectionDate = v25->_collectionDate;
    v25->_collectionDate = (NSDate *)v30;

    v25->_samplingRate = a8;
    v25->_daysPerBatch = a9;
    v25->_maxBatches = a11;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v25->_sessionPath, 0, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v43 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v32, &v43);
      v33 = (_CDDataCollectionSession *)objc_claimAutoreleasedReturnValue();
      v34 = v43;
      if (v34)
      {
        +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[_CDDataCollection initWithStorage:activity:sessionPath:dataDirectory:collectionDate:samplingRate:daysPerBatch:eventStreams:maxBatches:].cold.1();

      }
    }
    else
    {
      v33 = 0;
    }
    session = v25->_session;
    v25->_session = v33;
    v37 = v33;

    *(_WORD *)&v25->_selectedForDataCollection = 256;
    submissionBlock = v25->_submissionBlock;
    v25->_submissionBlock = &__block_literal_global_80;

    v39 = (_CDEventStreamsRegister *)-[_CDEventStreamsRegister initWithEventStreams:]([_CDEventStreamsRegister alloc], v23);
    eventStreamsRegister = v25->_eventStreamsRegister;
    v25->_eventStreamsRegister = v39;

  }
  return v25;
}

- (void)execute
{
  -[_CDDataCollection _execute]((uint64_t)self);
  -[_CDDataCollection cleanup]((uint64_t)self);
}

- (void)_execute
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Selected for data collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)cleanup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error remove previous session file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setSession:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (id)truncatedFileHandle
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  if (!a1)
    return 0;
  -[_CDDataCollection dataPath](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v10);
  v4 = v10;

  if (v4)
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_CDDataCollection truncatedFileHandle].cold.1();

    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createFileAtPath:contents:attributes:", v1, v8, 0);

    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)submitDataForCollection
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL8 v12;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  id v19;
  stat v20;
  _BYTE v21[8192];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[_CDDataCollection submitDataForCollection].cold.3();

  -[_CDDataCollection dataPath](a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("tar.gz"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  objc_msgSend(v5, "lastPathComponent");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "fileSystemRepresentation");

  v8 = objc_retainAutorelease(v4);
  objc_msgSend(v8, "fileSystemRepresentation");
  archive_write_new();
  if (!archive_write_add_filter_gzip()
    && !archive_write_set_format_pax_restricted()
    && !archive_write_open_filename())
  {
    memset(&v20, 0, sizeof(v20));
    stat(v6, &v20);
    archive_entry_new();
    archive_entry_set_size();
    archive_entry_set_filetype();
    archive_entry_set_perm();
    archive_entry_set_pathname();
    if (!archive_write_header())
    {
      v14 = open(v6, 0);
      while (read(v14, v21, 0x2000uLL))
        archive_write_data();
      close(v14);
      archive_entry_free();
      archive_write_close();
      archive_write_free();
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v8, 8, &v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v19;
      v12 = v16 == 0;
      if (v16)
      {
        +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[_CDDataCollection submitDataForCollection].cold.1();
      }
      else
      {
        objc_msgSend(v8, "lastPathComponent");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "submissionBlock");
        v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, NSObject *, void *))v18)[2](v18, v17, v15);

      }
      goto LABEL_12;
    }
    archive_entry_free();
  }
  v9 = archive_errno();
  v10 = archive_error_string();
  +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[_CDCloudFamilyDataCollectionTask submitDataForCollection].cold.2(v9, v10, v11);

  archive_write_close();
  archive_write_free();
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)dataPath
{
  id *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;

  v1 = a1;
  if (a1)
  {
    if (a1[8])
    {
      v2 = a1[8];
      if (v2)
        v3 = (void *)v2[1];
      else
        v3 = 0;
      v4 = (void *)MEMORY[0x1E0CB37E8];
      v5 = a1[8];
      if (v5)
        v6 = v5[5];
      else
        v6 = 0;
      v7 = v5;
      v8 = v3;
      v9 = v2;
      objc_msgSend(v4, "numberWithUnsignedInteger:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(".%@.json"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v1[5], "stringByAppendingPathComponent:", v11);
      v1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (_DKKnowledgeQuerying)storage
{
  return self->_storage;
}

- (id)submissionBlock
{
  return self->_submissionBlock;
}

- (void)setSubmissionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStreamsRegister, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_collectionDate, 0);
  objc_storeStrong((id *)&self->_sessionPath, 0);
  objc_storeStrong((id *)&self->_dataDirectory, 0);
  objc_storeStrong(&self->_submissionBlock, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)initWithStorage:activity:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "Sampling Rate: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)initWithStorage:activity:sessionPath:dataDirectory:collectionDate:samplingRate:daysPerBatch:eventStreams:maxBatches:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error unarchiving data collection session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)truncatedFileHandle
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error creating directory for data collection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)submitDataForCollection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Compressing data collection json file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
