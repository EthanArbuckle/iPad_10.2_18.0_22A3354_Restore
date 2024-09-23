@implementation CSUncompressedAudioLogging

- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 asrId:(id)a4 dictationInteractionId:(id)a5 languageCode:(id)a6 task:(id)a7 isSamplingForDictation:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  CSUncompressedAudioLogging *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  id v21;
  id v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  id obj;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v31 = a6;
  v30 = a7;
  v32.receiver = self;
  v32.super_class = (Class)CSUncompressedAudioLogging;
  v18 = -[CSUncompressedAudioLogging init](&v32, sel_init);
  if (v18)
  {
    v19 = dispatch_queue_create("CSUncompressedAudioLogging", 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v19;

    obj = a6;
    v21 = v17;
    v22 = v15;
    v23 = v18->_queue;
    dispatch_get_global_queue(17, 0);
    v29 = v16;
    v24 = a8;
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v23;
    v15 = v22;
    v17 = v21;
    dispatch_set_target_queue(v26, v25);

    objc_storeStrong((id *)&v18->_asrId, a4);
    objc_storeStrong((id *)&v18->_requestId, a3);
    objc_storeStrong((id *)&v18->_dictationInteractionId, a5);
    objc_storeStrong((id *)&v18->_languageCode, obj);
    objc_storeStrong((id *)&v18->_task, a7);
    v18->_isSamplingForDictation = v24;
    v16 = v29;
  }

  return v18;
}

- (CSUncompressedAudioLogging)initWithDictationInteractionId:(id)a3 languageCode:(id)a4 task:(id)a5
{
  return -[CSUncompressedAudioLogging initWithRequestId:asrId:dictationInteractionId:languageCode:task:isSamplingForDictation:](self, "initWithRequestId:asrId:dictationInteractionId:languageCode:task:isSamplingForDictation:", 0, 0, a3, a4, a5, 1);
}

- (CSUncompressedAudioLogging)initWithDictationInteractionId:(id)a3 asrId:(id)a4 languageCode:(id)a5 task:(id)a6
{
  return -[CSUncompressedAudioLogging initWithRequestId:asrId:dictationInteractionId:languageCode:task:isSamplingForDictation:](self, "initWithRequestId:asrId:dictationInteractionId:languageCode:task:isSamplingForDictation:", 0, a4, a3, a5, a6, 1);
}

- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 languageCode:(id)a4 task:(id)a5
{
  return -[CSUncompressedAudioLogging initWithRequestId:asrId:dictationInteractionId:languageCode:task:isSamplingForDictation:](self, "initWithRequestId:asrId:dictationInteractionId:languageCode:task:isSamplingForDictation:", a3, 0, 0, a4, a5, 0);
}

- (CSUncompressedAudioLogging)initWithRequestId:(id)a3 asrId:(id)a4 languageCode:(id)a5 task:(id)a6
{
  return -[CSUncompressedAudioLogging initWithRequestId:asrId:dictationInteractionId:languageCode:task:isSamplingForDictation:](self, "initWithRequestId:asrId:dictationInteractionId:languageCode:task:isSamplingForDictation:", a3, a4, 0, a5, a6, 0);
}

- (void)prepareLogging:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__CSUncompressedAudioLogging_prepareLogging___block_invoke;
  v12[3] = &unk_1E6881048;
  v13 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x1B5E468D0](v12);
  queue = self->_queue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __45__CSUncompressedAudioLogging_prepareLogging___block_invoke_2;
  block[3] = &unk_1E6881160;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, block);

}

- (BOOL)_prepareFileForLogging:(id *)a3
{
  uint64_t v5;
  BOOL v6;
  NSFileHandle *v7;
  NSFileHandle *audioFileHandle;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSString *tmpAudioFilePath;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = -[CSUncompressedAudioLogging _createFileDescriptor:protectionClass:](self, "_createFileDescriptor:protectionClass:", self->_tmpAudioFilePath, +[CSUncompressedAudioLogging loggingFileProtectionClass](CSUncompressedAudioLogging, "loggingFileProtectionClass"));
  if ((int)v5 <= 0)
  {
    v10 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      -[CSUncompressedAudioLogging samplingString](self, "samplingString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      tmpAudioFilePath = self->_tmpAudioFilePath;
      v15 = 136315650;
      v16 = "-[CSUncompressedAudioLogging _prepareFileForLogging:]";
      v17 = 2114;
      v18 = v12;
      v19 = 2114;
      v20 = tmpAudioFilePath;
      _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s %{public}@: Unable to create FD on audioFilePath : (%{public}@)", (uint8_t *)&v15, 0x20u);

      if (!a3)
        return 0;
    }
    else if (!a3)
    {
      return 0;
    }
    v9 = 2355;
    goto LABEL_8;
  }
  v6 = 1;
  v7 = (NSFileHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v5, 1);
  audioFileHandle = self->_audioFileHandle;
  self->_audioFileHandle = v7;

  if (!self->_audioFileHandle)
  {
    if (a3)
    {
      v9 = 2356;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), v9, 0);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    return 0;
  }
  return v6;
}

- (BOOL)_setupFilePath:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  NSString *samplingDate;
  NSString *v12;
  NSString *samplingTimestamp;
  NSString *v14;
  NSString *samplingTimestampDetail;
  NSString *samplingDirectory;
  id *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  void *v23;
  char v24;
  void *v25;
  NSString *v26;
  char v27;
  id v28;
  NSString *v29;
  NSString *tmpDirectory;
  uint64_t v31;
  id v32;
  NSString *v33;
  void *v34;
  NSString *v35;
  NSString *tmpAudioFilePath;
  NSString *v37;
  void *v38;
  NSString *v39;
  NSString *audioFilePath;
  NSString *v41;
  void *v42;
  NSString *v43;
  NSString *plistFilePath;
  NSObject *v45;
  BOOL v46;
  NSObject *v47;
  void *v48;
  void *v49;
  NSString *v51;
  NSObject *v52;
  NSString *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  NSString *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocale:", v7);

  objc_msgSend(v6, "setDateFormat:", CFSTR("yyyyMMdd"));
  objc_msgSend(v5, "timeIntervalSince1970");
  v9 = v8;
  objc_msgSend(v6, "stringFromDate:", v5);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  samplingDate = self->_samplingDate;
  self->_samplingDate = v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f"), v9);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  samplingTimestamp = self->_samplingTimestamp;
  self->_samplingTimestamp = v12;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.6f"), v9);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  samplingTimestampDetail = self->_samplingTimestampDetail;
  self->_samplingTimestampDetail = v14;

  samplingDirectory = self->_samplingDirectory;
  self->_samplingDirectory = 0;

  v17 = (id *)0x1E0CFE808;
  if (self->_isSamplingForDictation)
    v17 = (id *)0x1E0CFE8A0;
  objc_msgSend(*v17, "createSamplingDirectory");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  v19 = self->_samplingDirectory;
  self->_samplingDirectory = v18;

  v20 = self->_samplingDirectory;
  if (!v20)
  {
    v47 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[CSUncompressedAudioLogging _setupFilePath:]";
      v60 = 2112;
      v61 = 0;
      _os_log_error_impl(&dword_1B502E000, v47, OS_LOG_TYPE_ERROR, "%s Failed to get SamplingDirectory : %@", buf, 0x16u);
      if (!a3)
        goto LABEL_22;
    }
    else if (!a3)
    {
LABEL_22:
      v46 = 0;
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2351, 0);
    v46 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  -[NSString stringByAppendingPathComponent:](v20, "stringByAppendingPathComponent:", self->_samplingDate);
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  v22 = self->_samplingDirectory;
  self->_samplingDirectory = v21;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "fileExistsAtPath:", self->_samplingDirectory);

  if ((v24 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = self->_samplingDirectory;
    v55 = 0;
    v27 = objc_msgSend(v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 1, 0, &v55);
    v28 = v55;

    if ((v27 & 1) != 0)
    {

      goto LABEL_7;
    }
    v48 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v52 = v48;
      -[CSUncompressedAudioLogging samplingString](self, "samplingString");
      v53 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedDescription");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v59 = "-[CSUncompressedAudioLogging _setupFilePath:]";
      v60 = 2112;
      v61 = v53;
      v62 = 2112;
      v63 = v54;
      _os_log_error_impl(&dword_1B502E000, v52, OS_LOG_TYPE_ERROR, "%s %@: Failed to create directory : %@", buf, 0x20u);

      if (a3)
        goto LABEL_17;
    }
    else if (a3)
    {
LABEL_17:
      if (v28)
      {
        v56 = *MEMORY[0x1E0CB3388];
        v57 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2352, v49);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_22;
  }
LABEL_7:
  NSTemporaryDirectory();
  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  tmpDirectory = self->_tmpDirectory;
  self->_tmpDirectory = v29;

  v31 = 32;
  if (!self->_isSamplingForDictation)
    v31 = 24;
  v32 = *(id *)((char *)&self->super.isa + v31);
  v33 = self->_tmpDirectory;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@.pcm"), v32, self->_samplingDate, self->_samplingTimestamp);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](v33, "stringByAppendingPathComponent:", v34);
  v35 = (NSString *)objc_claimAutoreleasedReturnValue();
  tmpAudioFilePath = self->_tmpAudioFilePath;
  self->_tmpAudioFilePath = v35;

  v37 = self->_samplingDirectory;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@.pcm"), v32, self->_samplingDate, self->_samplingTimestamp);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](v37, "stringByAppendingPathComponent:", v38);
  v39 = (NSString *)objc_claimAutoreleasedReturnValue();
  audioFilePath = self->_audioFilePath;
  self->_audioFilePath = v39;

  v41 = self->_samplingDirectory;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@.plist"), v32, self->_samplingDate, self->_samplingTimestamp);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](v41, "stringByAppendingPathComponent:", v42);
  v43 = (NSString *)objc_claimAutoreleasedReturnValue();
  plistFilePath = self->_plistFilePath;
  self->_plistFilePath = v43;

  v45 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEBUG))
  {
    v51 = self->_audioFilePath;
    *(_DWORD *)buf = 136315394;
    v59 = "-[CSUncompressedAudioLogging _setupFilePath:]";
    v60 = 2112;
    v61 = v51;
    _os_log_debug_impl(&dword_1B502E000, v45, OS_LOG_TYPE_DEBUG, "%s CSUncompressedAudioLogging file path : %@", buf, 0x16u);
  }

  v46 = 1;
LABEL_23:

  return v46;
}

- (void)appendAudioData:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__CSUncompressedAudioLogging_appendAudioData___block_invoke;
    v7[3] = &unk_1E6880E88;
    v7[4] = self;
    v8 = v5;
    dispatch_async(queue, v7);

  }
}

- (void)cancelAudioLogging
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSUncompressedAudioLogging_cancelAudioLogging__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_removeTmpAudioFile
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CSUncompressedAudioLogging__removeTmpAudioFile__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_moveAudioLoggingToCollectionDirectory:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSUncompressedAudioLogging tmpAudioFilePath](self, "tmpAudioFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSUncompressedAudioLogging tmpAudioFilePath](self, "tmpAudioFilePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSUncompressedAudioLogging audioFilePath](self, "audioFilePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v11 = objc_msgSend(v8, "moveItemAtPath:toPath:error:", v9, v10, &v19);
    v12 = v19;

    if ((v11 & 1) == 0)
    {
      v13 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v16 = v13;
        -[CSUncompressedAudioLogging samplingString](self, "samplingString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v23 = "-[CSUncompressedAudioLogging _moveAudioLoggingToCollectionDirectory:]";
        v24 = 2112;
        v25 = v17;
        v26 = 2112;
        v27 = v18;
        _os_log_error_impl(&dword_1B502E000, v16, OS_LOG_TYPE_ERROR, "%s %@: Failed to move audio logging %@", buf, 0x20u);

        if (a3)
          goto LABEL_5;
      }
      else if (a3)
      {
LABEL_5:
        if (v12)
        {
          v20 = *MEMORY[0x1E0CB3388];
          v21 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2357, v14);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

    return v11;
  }
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2353, 0);
  v11 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v11;
}

- (void)endAudioWithCancellation:(BOOL)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__CSUncompressedAudioLogging_endAudioWithCancellation_completion___block_invoke;
  v15[3] = &unk_1E6881048;
  v16 = v6;
  v8 = v6;
  v9 = (void *)MEMORY[0x1B5E468D0](v15);
  queue = self->_queue;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __66__CSUncompressedAudioLogging_endAudioWithCancellation_completion___block_invoke_2;
  v12[3] = &unk_1E687ED98;
  v14 = a3;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(queue, v12);

}

- (int)_createFileDescriptor:(id)a3 protectionClass:(int)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[CSUncompressedAudioLogging samplingString](self, "samplingString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v14 = "-[CSUncompressedAudioLogging _createFileDescriptor:protectionClass:]";
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s %@: Creating logging file : %@", buf, 0x20u);

  }
  v10 = objc_retainAutorelease(v6);
  v11 = open_dprotected_np((const char *)objc_msgSend(v10, "UTF8String"), 514, a4, 0, 420);

  return v11;
}

- (BOOL)_writePlistFile:(id *)a3
{
  void *v5;
  void *v6;
  NSString *samplingTimestampDetail;
  NSString *languageCode;
  NSString *task;
  NSString *asrId;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  uint64_t *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_isSamplingForDictation)
  {
    if (!self->_dictationInteractionId)
      goto LABEL_6;
  }
  else if (!self->_requestId)
  {
    goto LABEL_6;
  }
  objc_msgSend(v5, "setObject:forKey:");
LABEL_6:
  samplingTimestampDetail = self->_samplingTimestampDetail;
  if (samplingTimestampDetail)
    objc_msgSend(v6, "setObject:forKey:", samplingTimestampDetail, CFSTR("samplingTimestamp"));
  languageCode = self->_languageCode;
  if (languageCode)
    objc_msgSend(v6, "setObject:forKey:", languageCode, CFSTR("language"));
  task = self->_task;
  if (task)
    objc_msgSend(v6, "setObject:forKey:", task, CFSTR("task"));
  asrId = self->_asrId;
  if (asrId)
    objc_msgSend(v6, "setObject:forKey:", asrId, CFSTR("asrSelfComponentIdentifier"));
  v11 = (void *)MEMORY[0x1E0CB37E8];
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("samplingRate"));

  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 100, 0, &v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v35;
  if (!v13)
  {
    v20 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v25 = v20;
      -[CSUncompressedAudioLogging samplingString](self, "samplingString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v41 = "-[CSUncompressedAudioLogging _writePlistFile:]";
      v42 = 2112;
      v43 = v26;
      v44 = 2114;
      v45 = v27;
      _os_log_error_impl(&dword_1B502E000, v25, OS_LOG_TYPE_ERROR, "%s %@: Failed to serialize plistRoot into plist : %{public}@", buf, 0x20u);

      if (!a3)
        goto LABEL_38;
    }
    else if (!a3)
    {
      goto LABEL_38;
    }
    if (v14)
    {
      v38 = *MEMORY[0x1E0CB3388];
      v39 = v14;
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = &v39;
      v23 = &v38;
LABEL_29:
      objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2358, v16);
      v18 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
LABEL_30:
    v16 = 0;
    goto LABEL_31;
  }
  v15 = -[CSUncompressedAudioLogging _createFileDescriptor:protectionClass:](self, "_createFileDescriptor:protectionClass:", self->_plistFilePath, +[CSUncompressedAudioLogging loggingFileProtectionClass](CSUncompressedAudioLogging, "loggingFileProtectionClass"));
  if ((int)v15 <= 0)
  {
    v24 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v31 = v24;
      -[CSUncompressedAudioLogging samplingString](self, "samplingString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v41 = "-[CSUncompressedAudioLogging _writePlistFile:]";
      v42 = 2112;
      v43 = v32;
      _os_log_error_impl(&dword_1B502E000, v31, OS_LOG_TYPE_ERROR, "%s %@: Failed to create FD for plist file", buf, 0x16u);

      if (a3)
      {
LABEL_27:
        if (v14)
        {
          v36 = *MEMORY[0x1E0CB3388];
          v37 = v14;
          v21 = (void *)MEMORY[0x1E0C99D80];
          v22 = &v37;
          v23 = &v36;
          goto LABEL_29;
        }
        goto LABEL_30;
      }
    }
    else if (a3)
    {
      goto LABEL_27;
    }
LABEL_38:
    v18 = 0;
    goto LABEL_39;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v15, 1);
  v34 = 0;
  objc_msgSend(v16, "writeData:error:", v13, &v34);
  v17 = v34;
  objc_msgSend(v16, "closeFile");
  v18 = v17 == 0;
  if (v17)
  {
    v19 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v28 = v19;
      -[CSUncompressedAudioLogging samplingString](self, "samplingString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v41 = "-[CSUncompressedAudioLogging _writePlistFile:]";
      v42 = 2112;
      v43 = v29;
      v44 = 2114;
      v45 = v30;
      _os_log_error_impl(&dword_1B502E000, v28, OS_LOG_TYPE_ERROR, "%s %@: Unable to writeData : %{public}@", buf, 0x20u);

      if (!a3)
        goto LABEL_20;
      goto LABEL_19;
    }
    if (a3)
    {
LABEL_19:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2356, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_20:

LABEL_32:
LABEL_39:

  return v18;
}

- (id)samplingString
{
  if (self->_isSamplingForDictation)
    return CFSTR("Dictation Sampling");
  else
    return CFSTR("Assistant Sampling");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (NSString)dictationInteractionId
{
  return self->_dictationInteractionId;
}

- (void)setDictationInteractionId:(id)a3
{
  objc_storeStrong((id *)&self->_dictationInteractionId, a3);
}

- (NSString)asrId
{
  return self->_asrId;
}

- (void)setAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_asrId, a3);
}

- (BOOL)isSamplingForDictation
{
  return self->_isSamplingForDictation;
}

- (void)setIsSamplingForDictation:(BOOL)a3
{
  self->_isSamplingForDictation = a3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (NSString)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NSString)samplingDate
{
  return self->_samplingDate;
}

- (void)setSamplingDate:(id)a3
{
  objc_storeStrong((id *)&self->_samplingDate, a3);
}

- (NSString)samplingTimestamp
{
  return self->_samplingTimestamp;
}

- (void)setSamplingTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_samplingTimestamp, a3);
}

- (NSString)samplingTimestampDetail
{
  return self->_samplingTimestampDetail;
}

- (void)setSamplingTimestampDetail:(id)a3
{
  objc_storeStrong((id *)&self->_samplingTimestampDetail, a3);
}

- (NSString)samplingDirectory
{
  return self->_samplingDirectory;
}

- (void)setSamplingDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_samplingDirectory, a3);
}

- (NSString)audioFilePath
{
  return self->_audioFilePath;
}

- (void)setAudioFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_audioFilePath, a3);
}

- (NSString)plistFilePath
{
  return self->_plistFilePath;
}

- (void)setPlistFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_plistFilePath, a3);
}

- (NSFileHandle)audioFileHandle
{
  return self->_audioFileHandle;
}

- (void)setAudioFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileHandle, a3);
}

- (NSString)tmpDirectory
{
  return self->_tmpDirectory;
}

- (void)setTmpDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_tmpDirectory, a3);
}

- (NSString)tmpAudioFilePath
{
  return self->_tmpAudioFilePath;
}

- (void)setTmpAudioFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_tmpAudioFilePath, a3);
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tmpAudioFilePath, 0);
  objc_storeStrong((id *)&self->_tmpDirectory, 0);
  objc_storeStrong((id *)&self->_audioFileHandle, 0);
  objc_storeStrong((id *)&self->_plistFilePath, 0);
  objc_storeStrong((id *)&self->_audioFilePath, 0);
  objc_storeStrong((id *)&self->_samplingDirectory, 0);
  objc_storeStrong((id *)&self->_samplingTimestampDetail, 0);
  objc_storeStrong((id *)&self->_samplingTimestamp, 0);
  objc_storeStrong((id *)&self->_samplingDate, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
  objc_storeStrong((id *)&self->_dictationInteractionId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __66__CSUncompressedAudioLogging_endAudioWithCancellation_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __66__CSUncompressedAudioLogging_endAudioWithCancellation_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void (*v14)(void);
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "audioFileHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeFile");

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0 || *(_BYTE *)(a1 + 48))
  {
    v3 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      objc_msgSend(v4, "samplingString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSUncompressedAudioLogging endAudioWithCancellation:completion:]_block_invoke_2";
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s %@: Request is cancelled remove logging", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_removeTmpAudioFile");
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v19 = 0;
    v8 = objc_msgSend(v7, "_moveAudioLoggingToCollectionDirectory:", &v19);
    v9 = v19;
    if ((v8 & 1) != 0)
    {
      v10 = *(void **)(a1 + 32);
      v18 = 0;
      v11 = objc_msgSend(v10, "_writePlistFile:", &v18);
      v12 = v18;
      if ((v11 & 1) != 0)
      {
        v13 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEBUG))
        {
          v15 = *(void **)(a1 + 32);
          v16 = v13;
          objc_msgSend(v15, "samplingString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v21 = "-[CSUncompressedAudioLogging endAudioWithCancellation:completion:]_block_invoke";
          v22 = 2112;
          v23 = v17;
          _os_log_debug_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEBUG, "%s %@: Done with audio logging", buf, 0x16u);

        }
        v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      }
      else
      {
        v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      }
      v14();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

void __49__CSUncompressedAudioLogging__removeTmpAudioFile__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tmpAudioFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tmpAudioFilePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v7 = objc_msgSend(v5, "removeItemAtPath:error:", v6, &v14);
    v8 = v14;

    if ((v7 & 1) == 0)
    {
      v9 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v10 = *(void **)(a1 + 32);
        v11 = v9;
        objc_msgSend(v10, "samplingString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v16 = "-[CSUncompressedAudioLogging _removeTmpAudioFile]_block_invoke";
        v17 = 2112;
        v18 = v12;
        v19 = 2112;
        v20 = v13;
        _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s %@: Failed to remove audio logging in the tmp : %@", buf, 0x20u);

      }
    }

  }
}

uint64_t __48__CSUncompressedAudioLogging_cancelAudioLogging__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "samplingString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[CSUncompressedAudioLogging cancelAudioLogging]_block_invoke";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s %@: Cancelling audio logging", (uint8_t *)&v7, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setIsCancelled:", 1);
}

void __46__CSUncompressedAudioLogging_appendAudioData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "audioFileHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  objc_msgSend(v2, "writeData:error:", v3, &v10);
  v4 = v10;

  if (v4)
  {
    v5 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v6 = *(void **)(a1 + 32);
      v7 = v5;
      objc_msgSend(v6, "samplingString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v12 = "-[CSUncompressedAudioLogging appendAudioData:]_block_invoke";
      v13 = 2112;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s %@: Unable to writeData : %{public}@", buf, 0x20u);

    }
  }

}

uint64_t __45__CSUncompressedAudioLogging_prepareLogging___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __45__CSUncompressedAudioLogging_prepareLogging___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void (*v14)(void);
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CFE980], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "siriDataSharingOptInStatus");

  if (v3 == 1)
  {
    v4 = *(void **)(a1 + 32);
    v20 = 0;
    v5 = objc_msgSend(v4, "_setupFilePath:", &v20);
    v6 = v20;
    if ((v5 & 1) != 0)
    {
      v7 = *(void **)(a1 + 32);
      v19 = 0;
      v8 = objc_msgSend(v7, "_prepareFileForLogging:", &v19);
      v9 = v19;
      if ((v8 & 1) != 0)
      {
        v10 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(void **)(a1 + 32);
          v12 = v10;
          objc_msgSend(v11, "samplingString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v22 = "-[CSUncompressedAudioLogging prepareLogging:]_block_invoke_2";
          v23 = 2112;
          v24 = v13;
          _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s %@: uncompressed audio logging will be enabled for this request", buf, 0x16u);

        }
        v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      }
      else
      {
        v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      }
      v14();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    v15 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(void **)(a1 + 32);
      v17 = v15;
      objc_msgSend(v16, "samplingString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSUncompressedAudioLogging prepareLogging:]_block_invoke";
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, "%s %@: uncompressed audio logging will be disabled for this request", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

+ (int)loggingFileProtectionClass
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    return 6;
  else
    return 3;
}

@end
