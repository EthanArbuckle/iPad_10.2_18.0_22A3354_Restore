@implementation CSAudioFileLog

- (CSAudioFileLog)init
{
  char *v2;
  id v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSAudioFileLog;
  v2 = -[CSAudioFileLog init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    v6 = *((_QWORD *)v2 + 1);
    dispatch_get_global_queue(17, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v6, v7);

    objc_msgSend(MEMORY[0x1E0D190F8], "utteranceFileASBD");
    *(_OWORD *)(v2 + 24) = v9;
    *(_OWORD *)(v2 + 40) = v10;
    *((_QWORD *)v2 + 7) = v11;
  }
  return (CSAudioFileLog *)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CSAudioFileLog _closeAudioFile](self, "_closeAudioFile");
  v3.receiver = self;
  v3.super_class = (Class)CSAudioFileLog;
  -[CSAudioFileLog dealloc](&v3, sel_dealloc);
}

- (void)_closeAudioFile
{
  OpaqueExtAudioFile *audioFile;
  OSStatus v4;
  OSStatus v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  OSStatus v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  audioFile = self->_audioFile;
  if (audioFile)
  {
    v4 = ExtAudioFileDispose(audioFile);
    if (v4)
    {
      v5 = v4;
      v6 = *MEMORY[0x1E0D18F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
      {
        v7 = 136315394;
        v8 = "-[CSAudioFileLog _closeAudioFile]";
        v9 = 1026;
        v10 = v5;
        _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Failure disposing audio file %{public}d", (uint8_t *)&v7, 0x12u);
      }
    }
    self->_audioFile = 0;
  }
}

- (void)startRecording
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CSAudioFileLog_startRecording__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)appendAudioData:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CSAudioFileLog_appendAudioData___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)stopRecording
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CSAudioFileLog_stopRecording__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_audioLogDirectory
{
  if (_audioLogDirectory_onceToken != -1)
    dispatch_once(&_audioLogDirectory_onceToken, &__block_literal_global_8_10239);
  return (id)_audioLogDirectory_logPath;
}

- (id)_getOrCreateAudioLogDirectory
{
  __CFString *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CSAudioFileLog _audioLogDirectory](self, "_audioLogDirectory");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, 0);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v12);
    v5 = v12;

    if ((v7 & 1) == 0)
    {
      v8 = (void *)*MEMORY[0x1E0D18F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
      {
        v10 = v8;
        objc_msgSend(v5, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v14 = "-[CSAudioFileLog _getOrCreateAudioLogDirectory]";
        v15 = 2114;
        v16 = v2;
        v17 = 2114;
        v18 = v11;
        _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Couldn't create CoreSpeech log directory at path %{public}@ %{public}@", buf, 0x20u);

      }
      v2 = CFSTR("/tmp");
    }
  }

  return v2;
}

- (id)_nowString
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_makeTimestampedAudioLogFilenameWithPrefix:(id)a3 suffix:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  -[CSAudioFileLog _getOrCreateAudioLogDirectory](self, "_getOrCreateAudioLogDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioFileLog _nowString](self, "_nowString");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = &stru_1E7C296E8;
  if (v10)
    v12 = (const __CFString *)v10;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@%@%@"), v9, v8, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __36__CSAudioFileLog__audioLogDirectory__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "baseDir");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Logs/CrashReporter/CoreSpeech/audio/"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_audioLogDirectory_logPath;
  _audioLogDirectory_logPath = v1;

}

uint64_t __31__CSAudioFileLog_stopRecording__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 64);
    LODWORD(v3) = *(_DWORD *)(v3 + 72);
    v6 = 136315650;
    v7 = "-[CSAudioFileLog stopRecording]_block_invoke";
    v8 = 2114;
    v9 = v4;
    v10 = 1026;
    v11 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Closing file at URL %{public}@, audio size: %{public}u", (uint8_t *)&v6, 0x1Cu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_closeAudioFile");
}

void __34__CSAudioFileLog_appendAudioData___block_invoke(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  uint64_t v4;
  unsigned int v5;
  UInt32 v6;
  OSStatus v7;
  OSStatus v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  OSStatus v14;
  AudioBufferList ioData;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "length");
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = *(_DWORD *)(v4 + 48);
    LODWORD(v4) = *(_DWORD *)(v4 + 52);
    *(_QWORD *)&ioData.mNumberBuffers = 1;
    ioData.mBuffers[0].mNumberChannels = v4;
    v6 = v2 / v5 / v4;
    ioData.mBuffers[0].mDataByteSize = objc_msgSend(v3, "length");
    ioData.mBuffers[0].mData = (void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
    v7 = ExtAudioFileWrite(*(ExtAudioFileRef *)(*(_QWORD *)(a1 + 32) + 16), v6, &ioData);
    if (v7)
    {
      v8 = v7;
      v9 = *MEMORY[0x1E0D18F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
      {
        v11 = 136315394;
        v12 = "-[CSAudioFileLog appendAudioData:]_block_invoke";
        v13 = 1026;
        v14 = v8;
        _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Failed writing audio file %{public}d", (uint8_t *)&v11, 0x12u);
      }
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) += objc_msgSend(*(id *)(a1 + 40), "length");
  }
  else
  {
    v10 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
    {
      ioData.mNumberBuffers = 136315138;
      *(_QWORD *)(&ioData.mNumberBuffers + 1) = "-[CSAudioFileLog appendAudioData:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s No audio file to append data", (uint8_t *)&ioData, 0xCu);
    }
  }
}

void __32__CSAudioFileLog_startRecording__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  OSStatus v11;
  OSStatus v12;
  os_log_t v13;
  _QWORD *v14;
  uint64_t v15;
  OpaqueExtAudioFile *v16;
  OSStatus v17;
  OSStatus v18;
  os_log_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  OSStatus v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (os_log_t *)MEMORY[0x1E0D18F38];
  if (v2[2])
  {
    v4 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
    {
      v24 = 136315138;
      v25 = "-[CSAudioFileLog startRecording]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Audio file already configured, closing first", (uint8_t *)&v24, 0xCu);
      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "_closeAudioFile");
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_makeTimestampedAudioLogFilenameWithPrefix:suffix:", &stru_1E7C296E8, CFSTR("-input.wav"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 64);
  *(_QWORD *)(v7 + 64) = v6;

  v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v24 = 136315394;
    v25 = "-[CSAudioFileLog startRecording]_block_invoke";
    v26 = 2114;
    v27 = v10;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Creating audio file at URL %{public}@", (uint8_t *)&v24, 0x16u);
  }
  v11 = ExtAudioFileCreateWithURL(*(CFURLRef *)(*(_QWORD *)(a1 + 32) + 64), 0x57415645u, (const AudioStreamBasicDescription *)(*(_QWORD *)(a1 + 32) + 24), 0, 1u, (ExtAudioFileRef *)(*(_QWORD *)(a1 + 32) + 16));
  if (v11)
  {
    v12 = v11;
    v13 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v24 = 136315650;
    v25 = "-[CSAudioFileLog startRecording]_block_invoke";
    v26 = 2114;
    v27 = v23;
    v28 = 1026;
    v29 = v12;
    v20 = "%s Failed creating audio file at url %{public}@ %{public}d";
    v21 = v13;
    v22 = 28;
    goto LABEL_17;
  }
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(OpaqueExtAudioFile **)(v15 + 16);
  if (!v16)
    goto LABEL_15;
  v17 = ExtAudioFileSetProperty(v16, 0x63666D74u, 0x28u, (const void *)(v15 + 24));
  if (!v17)
    goto LABEL_15;
  v18 = v17;
  v19 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
  {
    v24 = 136315394;
    v25 = "-[CSAudioFileLog startRecording]_block_invoke";
    v26 = 1026;
    LODWORD(v27) = v18;
    v20 = "%s Error setting input format %{public}d";
    v21 = v19;
    v22 = 18;
LABEL_17:
    _os_log_error_impl(&dword_1C2614000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v24, v22);
  }
LABEL_9:
  v14 = *(_QWORD **)(a1 + 32);
  if (v14[2])
    objc_msgSend(v14, "_closeAudioFile");
LABEL_15:
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10259 != -1)
    dispatch_once(&sharedInstance_onceToken_10259, &__block_literal_global_10260);
  return (id)sharedInstance_sSharedInstance;
}

void __32__CSAudioFileLog_sharedInstance__block_invoke()
{
  CSAudioFileLog *v0;
  void *v1;

  v0 = objc_alloc_init(CSAudioFileLog);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

@end
