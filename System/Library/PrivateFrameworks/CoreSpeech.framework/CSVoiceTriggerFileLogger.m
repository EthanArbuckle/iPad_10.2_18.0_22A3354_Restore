@implementation CSVoiceTriggerFileLogger

- (CSVoiceTriggerFileLogger)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  CSVoiceTriggerFileLogger *v6;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileLoggingIsEnabled");
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CSVoiceTriggerFileLogger initWithSpeechManager:fileLoggingEnabled:geckoLoggingEnabled:](self, "initWithSpeechManager:fileLoggingEnabled:geckoLoggingEnabled:", 0, v4, objc_msgSend(v5, "geckoLoggingLevel") > 0);

  return v6;
}

- (CSVoiceTriggerFileLogger)initWithSpeechManager:(id)a3 fileLoggingEnabled:(BOOL)a4 geckoLoggingEnabled:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  CSVoiceTriggerFileLogger *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  CSSpeechManager *v12;
  CSSpeechManager *speechManager;
  objc_super v15;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSVoiceTriggerFileLogger;
  v9 = -[CSVoiceTriggerFileLogger init](&v15, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("VoiceTrigger audio logging queue", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    if (v8)
    {
      v12 = (CSSpeechManager *)v8;
    }
    else
    {
      +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
      v12 = (CSSpeechManager *)objc_claimAutoreleasedReturnValue();
    }
    speechManager = v9->_speechManager;
    v9->_speechManager = v12;

    -[CSVoiceTriggerFileLogger setFileLoggingEnabled:](v9, "setFileLoggingEnabled:", v6);
    -[CSVoiceTriggerFileLogger setGeckoLoggingEnabled:](v9, "setGeckoLoggingEnabled:", v5);
  }

  return v9;
}

- (id)_audioLogDirectory
{
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;
  char v6;
  void *v7;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voiceTriggerAudioLogDirectory");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "fileExistsAtPath:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v11 = 0;
    v6 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v11);
    v5 = v11;
    if ((v6 & 1) == 0)
    {
      v7 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v9 = v7;
        objc_msgSend(v5, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v13 = "-[CSVoiceTriggerFileLogger _audioLogDirectory]";
        v14 = 2114;
        v15 = v4;
        v16 = 2114;
        v17 = v10;
        _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@", buf, 0x20u);

      }
      v4 = CFSTR("/tmp");
    }
  }

  return v4;
}

- (id)_geckoLogDirectory
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "geckoAudioLogDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "fileExistsAtPath:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v19 = *MEMORY[0x1E0CB2AD8];
    v20[0] = *MEMORY[0x1E0CB2AB8];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v7 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, v6, &v12);
    v5 = v12;

    if ((v7 & 1) == 0)
    {
      v8 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v10 = v8;
        objc_msgSend(v5, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v14 = "-[CSVoiceTriggerFileLogger _geckoLogDirectory]";
        v15 = 2114;
        v16 = v4;
        v17 = 2114;
        v18 = v11;
        _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@", buf, 0x20u);

      }
      v4 = 0;
    }
  }

  return v4;
}

- (id)_timeStampString
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

- (id)_metaFilenameWithRootDir:(id)a3 prefix:(id)a4 deviceId:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a4;
  v11 = a3;
  -[CSVoiceTriggerFileLogger _timeStampString](self, "_timeStampString");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v8)
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@%@%@"), v12, v8, v10, CFSTR(".json"));
  else
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@%@"), v12, v10, CFSTR(".json"), v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_writeDictionary:(id)a3 toPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 3, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v8)
    {
      v9 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        objc_msgSend(v8, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v15 = "-[CSVoiceTriggerFileLogger _writeDictionary:toPath:]";
        v16 = 2114;
        v17 = v11;
        _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Error writing out event info meta: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v7, "writeToFile:atomically:", v6, 0);
    }

  }
  else
  {
    v12 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSVoiceTriggerFileLogger _writeDictionary:toPath:]";
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s No meta data to write, skip", buf, 0xCu);
    }
  }

}

- (BOOL)_shouldLogDeviceId:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19490]);

  return v4;
}

- (BOOL)_shouldSkipLogging:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19468]);

  return v4;
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (!-[CSVoiceTriggerFileLogger fileLoggingEnabled](self, "fileLoggingEnabled"))
  {
    v14 = v15;
LABEL_8:
    v15 = v14;
    -[CSVoiceTriggerFileLogger _logGeckoWithFilePrefix:WithResult:](self, "_logGeckoWithFilePrefix:WithResult:", CFSTR("-triggered"), v14);
    goto LABEL_9;
  }
  if (!-[CSVoiceTriggerFileLogger _shouldSkipLogging:](self, "_shouldSkipLogging:", v15))
  {
    v7 = -[CSVoiceTriggerFileLogger _shouldLogDeviceId:](self, "_shouldLogDeviceId:", v15);
    -[CSVoiceTriggerFileLogger _audioLogDirectory](self, "_audioLogDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v9 = v6;
    else
      v9 = 0;
    -[CSVoiceTriggerFileLogger _metaFilenameWithRootDir:prefix:deviceId:](self, "_metaFilenameWithRootDir:prefix:deviceId:", v8, CFSTR("-triggered"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".json"), CFSTR(".wav"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0D193F0]);
    v13 = v12;

    -[CSVoiceTriggerFileLogger _logVTResult:metaFilePath:audioFilePath:completion:](self, "_logVTResult:metaFilePath:audioFilePath:completion:", v13, v10, v11, &__block_literal_global_10656);
    -[CSVoiceTriggerFileLogger _clearOldLoggingFiles](self, "_clearOldLoggingFiles");

    v14 = v13;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_logVTResult:(id)a3 metaFilePath:(id)a4 audioFilePath:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D193E8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __79__CSVoiceTriggerFileLogger__logVTResult_metaFilePath_audioFilePath_completion___block_invoke;
  v21[3] = &unk_1E7C25728;
  v21[4] = self;
  v22 = v14;
  v23 = v10;
  v24 = v12;
  v25 = v11;
  v26 = v13;
  v16 = v13;
  v17 = v11;
  v18 = v12;
  v19 = v10;
  v20 = v14;
  dispatch_async(queue, v21);

}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[CSVoiceTriggerFileLogger _notifyFalseRejectFeedbackBanner:](self, "_notifyFalseRejectFeedbackBanner:", v15);
  if (!-[CSVoiceTriggerFileLogger fileLoggingEnabled](self, "fileLoggingEnabled"))
  {
    v14 = v15;
LABEL_8:
    v15 = v14;
    -[CSVoiceTriggerFileLogger _logGeckoWithFilePrefix:WithResult:](self, "_logGeckoWithFilePrefix:WithResult:", CFSTR("-almost"), v14);
    goto LABEL_9;
  }
  if (!-[CSVoiceTriggerFileLogger _shouldSkipLogging:](self, "_shouldSkipLogging:", v15))
  {
    v7 = -[CSVoiceTriggerFileLogger _shouldLogDeviceId:](self, "_shouldLogDeviceId:", v15);
    -[CSVoiceTriggerFileLogger _audioLogDirectory](self, "_audioLogDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v9 = v6;
    else
      v9 = 0;
    -[CSVoiceTriggerFileLogger _metaFilenameWithRootDir:prefix:deviceId:](self, "_metaFilenameWithRootDir:prefix:deviceId:", v8, CFSTR("-almost"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".json"), CFSTR(".wav"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0D193F0]);
    v13 = v12;

    -[CSVoiceTriggerFileLogger _logVTResult:metaFilePath:audioFilePath:completion:](self, "_logVTResult:metaFilePath:audioFilePath:completion:", v13, v10, v11, &__block_literal_global_35);
    -[CSVoiceTriggerFileLogger _clearOldLoggingFiles](self, "_clearOldLoggingFiles");

    v14 = v13;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_logGeckoWithFilePrefix:(id)a3 WithResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (((CSIsIOS() & 1) != 0 || CSIsHorseman())
    && -[CSVoiceTriggerFileLogger geckoLoggingEnabled](self, "geckoLoggingEnabled")
    && !-[CSVoiceTriggerFileLogger _shouldSkipLogging:](self, "_shouldSkipLogging:", v7))
  {
    -[CSVoiceTriggerFileLogger _geckoLogDirectory](self, "_geckoLogDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[CSVoiceTriggerFileLogger _metaFilenameWithRootDir:prefix:deviceId:](self, "_metaFilenameWithRootDir:prefix:deviceId:", v8, v6, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".json"), CFSTR(".wav"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v11, "setObject:forKey:", v10, *MEMORY[0x1E0D193F0]);
      v12 = v11;

      -[CSVoiceTriggerFileLogger _logVTResult:metaFilePath:audioFilePath:completion:](self, "_logVTResult:metaFilePath:audioFilePath:completion:", v12, v9, v10, &__block_literal_global_36_10652);
      -[CSVoiceTriggerFileLogger _clearOldGeckoLoggingFiles](self, "_clearOldGeckoLoggingFiles");

      v7 = v12;
    }
    else
    {
      v13 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v14 = 136315138;
        v15 = "-[CSVoiceTriggerFileLogger _logGeckoWithFilePrefix:WithResult:]";
        _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s Failed to get Gecko log directory", (uint8_t *)&v14, 0xCu);
      }
    }

  }
}

- (void)voiceTriggerDidDetectSpeakerReject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  -[CSVoiceTriggerFileLogger _notifyFalseRejectFeedbackBanner:](self, "_notifyFalseRejectFeedbackBanner:");
  if (!-[CSVoiceTriggerFileLogger fileLoggingEnabled](self, "fileLoggingEnabled"))
  {
    v9 = v10;
    goto LABEL_5;
  }
  if (!-[CSVoiceTriggerFileLogger _shouldSkipLogging:](self, "_shouldSkipLogging:", v10))
  {
    -[CSVoiceTriggerFileLogger _audioLogDirectory](self, "_audioLogDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSVoiceTriggerFileLogger _metaFilenameWithRootDir:prefix:deviceId:](self, "_metaFilenameWithRootDir:prefix:deviceId:", v4, CFSTR("-rejected"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".json"), CFSTR(".wav"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v7, "setObject:forKey:", v6, *MEMORY[0x1E0D193F0]);
    v8 = v7;

    -[CSVoiceTriggerFileLogger _logVTResult:metaFilePath:audioFilePath:completion:](self, "_logVTResult:metaFilePath:audioFilePath:completion:", v8, v5, v6, &__block_literal_global_37);
    -[CSVoiceTriggerFileLogger _clearOldLoggingFiles](self, "_clearOldLoggingFiles");

    v9 = v8;
LABEL_5:
    v10 = v9;
    -[CSVoiceTriggerFileLogger _logGeckoWithFilePrefix:WithResult:](self, "_logGeckoWithFilePrefix:WithResult:", CFSTR("-rejected"), v9);
  }

}

- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  CSVoiceTriggerFileLogger *v18;
  id v19;
  id v20;
  id v21;

  v5 = a4;
  if (-[CSVoiceTriggerFileLogger fileLoggingEnabled](self, "fileLoggingEnabled")
    && !-[CSVoiceTriggerFileLogger _shouldSkipLogging:](self, "_shouldSkipLogging:", v5))
  {
    -[CSVoiceTriggerFileLogger _audioLogDirectory](self, "_audioLogDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSVoiceTriggerFileLogger _metaFilenameWithRootDir:prefix:deviceId:](self, "_metaFilenameWithRootDir:prefix:deviceId:", v6, CFSTR("-selfTrigger"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".json"), CFSTR(".wav"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D193E8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v10, "setObject:forKey:", v8, *MEMORY[0x1E0D193F0]);
    v11 = v10;

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__CSVoiceTriggerFileLogger_selfTriggerDetector_didDetectSelfTrigger___block_invoke;
    block[3] = &unk_1E7C25790;
    v17 = v11;
    v18 = self;
    v19 = v9;
    v20 = v8;
    v21 = v7;
    v13 = v7;
    v14 = v8;
    v15 = v9;
    v5 = v11;
    dispatch_async(queue, block);
    -[CSVoiceTriggerFileLogger _clearOldLoggingFiles](self, "_clearOldLoggingFiles");

  }
}

- (void)_clearOldLoggingFiles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D18FE8];
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pruneNumberOfLogFilesTo:", objc_msgSend(v3, "maxNumLoggingFiles"));

  v4 = (void *)MEMORY[0x1E0D18FE8];
  objc_msgSend(MEMORY[0x1E0D19090], "daysBeforeRemovingLogFiles");
  objc_msgSend(v4, "removeLogFilesOlderThanNDays:");
  v5 = (void *)MEMORY[0x1E0D18FE8];
  objc_msgSend(MEMORY[0x1E0D19090], "daysBeforeRemovingLogFiles");
  objc_msgSend(v5, "removeRemoteP2PLogFilesOlderThanNDays:");
}

- (void)_clearOldGeckoLoggingFiles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0D19260];
  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geckoAudioLogDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19090], "daysBeforeRemovingLogFiles");
  objc_msgSend(v2, "removeLogFilesInDirectory:matchingPattern:beforeDays:", v5, CFSTR(".*"));

}

- (void)_notifyFalseRejectFeedbackBanner:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  BOOL v6;
  int v7;
  int v8;
  uint64_t v9;
  double v10;
  id v11;

  v3 = *MEMORY[0x1E0D19778];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D19590]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(v11, "floatValue");
    v8 = v7;
    v9 = objc_msgSend(v5, "unsignedIntValue");
    LODWORD(v10) = v8;
    +[CSSiriDebugConnection launchSiriDebugFeedbackBannerFalseRejectBannerWithTriggerScore:withTriggeredPhraseId:](CSSiriDebugConnection, "launchSiriDebugFeedbackBannerFalseRejectBannerWithTriggerScore:withTriggeredPhraseId:", v9, v10);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
  objc_storeStrong((id *)&self->_speechManager, a3);
}

- (BOOL)fileLoggingEnabled
{
  return self->_fileLoggingEnabled;
}

- (void)setFileLoggingEnabled:(BOOL)a3
{
  self->_fileLoggingEnabled = a3;
}

- (BOOL)geckoLoggingEnabled
{
  return self->_geckoLoggingEnabled;
}

- (void)setGeckoLoggingEnabled:(BOOL)a3
{
  self->_geckoLoggingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __69__CSVoiceTriggerFileLogger_selfTriggerDetector_didDetectSelfTrigger___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = *MEMORY[0x1E0D193E0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D193E0]);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v2),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "unsignedIntegerValue"),
        v5,
        v4,
        v6 == 1))
  {
    objc_msgSend(*(id *)(a1 + 40), "speechManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioTapProvider");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "speechManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioProviderWithUUID:", *(_QWORD *)(a1 + 48));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (id)v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19788]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "saveRecordingBufferToEndFrom:toURL:", v10, v11);

  objc_msgSend(*(id *)(a1 + 40), "_writeDictionary:toPath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
}

void __63__CSVoiceTriggerFileLogger_voiceTriggerDidDetectSpeakerReject___block_invoke()
{
  id v0;

  if ((CSIsIOS() & 1) != 0 || CSIsHorseman())
  {
    +[CSP2PService sharedInstance](CSP2PService, "sharedInstance");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "sendVTNearMissGradingDataToCompanion");

  }
}

void __63__CSVoiceTriggerFileLogger__logGeckoWithFilePrefix_WithResult___block_invoke()
{
  id v0;

  if ((CSIsIOS() & 1) != 0 || CSIsHorseman())
  {
    +[CSP2PService sharedInstance](CSP2PService, "sharedInstance");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "sendGeckoSpeechLogsToCompanion");

  }
}

void __67__CSVoiceTriggerFileLogger_voiceTriggerDidDetectNearMiss_deviceId___block_invoke()
{
  id v0;

  if ((CSIsIOS() & 1) != 0 || CSIsHorseman())
  {
    +[CSP2PService sharedInstance](CSP2PService, "sharedInstance");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "sendVTNearMissGradingDataToCompanion");

  }
}

void __79__CSVoiceTriggerFileLogger__logVTResult_metaFilePath_audioFilePath_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "speechManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioProviderWithUUID:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D196D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D196C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveRecordingBufferFrom:to:toURL:", v4, v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "_writeDictionary:toPath:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v8 = *(_QWORD *)(a1 + 72);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

void __66__CSVoiceTriggerFileLogger_voiceTriggerDidDetectKeyword_deviceId___block_invoke()
{
  id v0;

  if ((CSIsIOS() & 1) != 0 || CSIsHorseman())
  {
    +[CSP2PService sharedInstance](CSP2PService, "sharedInstance");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "sendVTNearMissGradingDataToCompanion");

  }
}

@end
