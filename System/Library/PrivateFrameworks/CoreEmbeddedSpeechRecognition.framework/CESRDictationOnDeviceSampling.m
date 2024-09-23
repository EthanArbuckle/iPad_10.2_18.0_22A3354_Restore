@implementation CESRDictationOnDeviceSampling

- (CESRDictationOnDeviceSampling)init
{
  CESRDictationOnDeviceSampling *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *fileQueue;
  uint64_t v6;
  NSMutableDictionary *dictationSamplingVariables;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  NSDate *samplingDate;
  void *v12;
  void *v13;
  void *v14;
  char isDeviceSampledFromConfig;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CESRDictationOnDeviceSampling;
  v2 = -[CESRDictationOnDeviceSampling init](&v17, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("CESRDictationOnDeviceSampling file queue", v3);
    fileQueue = v2->_fileQueue;
    v2->_fileQueue = (OS_dispatch_queue *)v4;

    objc_msgSend((id)objc_opt_class(), "_readDictationSampledPlist");
    v6 = objc_claimAutoreleasedReturnValue();
    dictationSamplingVariables = v2->_dictationSamplingVariables;
    v2->_dictationSamplingVariables = (NSMutableDictionary *)v6;

    v2->_isDeviceSampledFromConfig = 1;
    if (-[NSMutableDictionary count](v2->_dictationSamplingVariables, "count"))
    {
      v8 = v2->_dictationSamplingVariables;
      objc_msgSend(MEMORY[0x1E0CFE898], "sampledCurrentSamplingDateKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      samplingDate = v2->_samplingDate;
      v2->_samplingDate = (NSDate *)v10;

      -[NSMutableDictionary objectForKey:](v2->_dictationSamplingVariables, "objectForKey:", CFSTR("numberOfRequestsTillNow"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_numberOfRequestsTillNow = objc_msgSend(v12, "integerValue");

      -[NSMutableDictionary objectForKey:](v2->_dictationSamplingVariables, "objectForKey:", CFSTR("isDeviceSampledFromConfig"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        isDeviceSampledFromConfig = objc_msgSend(v13, "BOOLValue");
      else
        isDeviceSampledFromConfig = v2->_isDeviceSampledFromConfig;
      v2->_isDeviceSampledFromConfig = isDeviceSampledFromConfig;

    }
    else
    {
      -[CESRDictationOnDeviceSampling _setSamplingDateToCurrentDate](v2, "_setSamplingDateToCurrentDate");
      -[CESRDictationOnDeviceSampling _setRequestCount:](v2, "_setRequestCount:", 0);
    }
  }
  return v2;
}

- (void)incrementSampledRequestCount
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ++self->_numberOfRequestsTillNow;
  -[CESRDictationOnDeviceSampling _setRequestCount:](self, "_setRequestCount:");
  -[CESRDictationOnDeviceSampling _updateDictationSampledPlist](self, "_updateDictationSampledPlist");
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[CESRDictationOnDeviceSampling incrementSampledRequestCount]";
    _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s Dictation Sampling: Incremented the count of sampled requests by 1.", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)isRequestSelectedForSamplingFromConfigForLanguage:(id)a3
{
  void *v5;
  NSObject *v6;
  _BOOL4 isDeviceSampledFromConfig;
  NSObject *v8;
  BOOL v9;
  const char *v10;
  int64_t numberOfRequestsTillNow;
  signed int v12;
  _BOOL4 v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!+[CESRDictationOnDeviceSampling _isSamplingAllowed](CESRDictationOnDeviceSampling, "_isSamplingAllowed"))return 0;
  if (a3
    && (!self->_numberOfRequestsTillNow
     || !-[CESRDictationOnDeviceSampling _isSamplingDateCurrent](self, "_isSamplingDateCurrent")))
  {
    self->_isDeviceSampledFromConfig = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictationSamplingVariables, "setObject:forKeyedSubscript:", v5, CFSTR("isDeviceSampledFromConfig"));

    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      isDeviceSampledFromConfig = self->_isDeviceSampledFromConfig;
      v18 = 136315394;
      v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
      v20 = 1024;
      v21 = isDeviceSampledFromConfig;
      _os_log_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_INFO, "%s Dictation Sampling: isDeviceSampledFromConfig = %d", (uint8_t *)&v18, 0x12u);
    }
  }
  if (!self->_isDeviceSampledFromConfig
    && !+[CESRDictationOnDeviceSampling _isInternalInstall](CESRDictationOnDeviceSampling, "_isInternalInstall"))
  {
    v14 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
      v15 = "%s Dictation Sampling: Device is not participating in sampling today.";
      v16 = v14;
LABEL_25:
      _os_log_impl(&dword_1B3E5F000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v18, 0xCu);
    }
    return 0;
  }
  if (!-[CESRDictationOnDeviceSampling _isSamplingDateCurrent](self, "_isSamplingDateCurrent"))
  {
    -[CESRDictationOnDeviceSampling _setSamplingDateToCurrentDate](self, "_setSamplingDateToCurrentDate");
    -[CESRDictationOnDeviceSampling _setRequestCount:](self, "_setRequestCount:", 0);
  }
  if (+[CESRDictationOnDeviceSampling _isInternalInstall](CESRDictationOnDeviceSampling, "_isInternalInstall"))
  {
    v8 = *MEMORY[0x1E0CFE6C0];
    v9 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
      v10 = "%s Dictation Sampling: Selected for sampling. Sampling from an internal install.";
LABEL_22:
      _os_log_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v18, 0xCu);
      return v9;
    }
    return v9;
  }
  numberOfRequestsTillNow = self->_numberOfRequestsTillNow;
  if (numberOfRequestsTillNow)
  {
    v12 = arc4random_uniform(numberOfRequestsTillNow + 1) + 1;
    v8 = *MEMORY[0x1E0CFE6C0];
    v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO);
    if (v12 <= 1)
    {
      if (!v13)
        return 1;
      v18 = 136315138;
      v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
      v10 = "%s Dictation Sampling: Selected for sampling.";
      v9 = 1;
      goto LABEL_22;
    }
    if (v13)
    {
      v18 = 136315138;
      v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
      v15 = "%s Dictation Sampling: Not selected for sampling.";
      v16 = v8;
      goto LABEL_25;
    }
    return 0;
  }
  v8 = *MEMORY[0x1E0CFE6C0];
  v9 = 1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v18 = 136315138;
    v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
    v10 = "%s Dictation Sampling: Selected for sampling. The count of sampled requests was 0.";
    goto LABEL_22;
  }
  return v9;
}

- (void)_updateDictationSampledPlist
{
  void *v3;
  NSObject *fileQueue;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = (void *)-[NSMutableDictionary copy](self->_dictationSamplingVariables, "copy");
  fileQueue = self->_fileQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CESRDictationOnDeviceSampling__updateDictationSampledPlist__block_invoke;
  block[3] = &unk_1E6734990;
  v7 = v3;
  v5 = v3;
  dispatch_async(fileQueue, block);

}

- (void)_setRequestCount:(int64_t)a3
{
  id v4;

  self->_numberOfRequestsTillNow = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictationSamplingVariables, "setObject:forKeyedSubscript:", v4, CFSTR("numberOfRequestsTillNow"));

}

- (void)_setSamplingDateToCurrentDate
{
  NSDate *v3;
  NSDate *samplingDate;
  NSMutableDictionary *dictationSamplingVariables;
  NSDate *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  samplingDate = self->_samplingDate;
  self->_samplingDate = v3;

  v6 = self->_samplingDate;
  dictationSamplingVariables = self->_dictationSamplingVariables;
  objc_msgSend(MEMORY[0x1E0CFE898], "sampledCurrentSamplingDateKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](dictationSamplingVariables, "setObject:forKeyedSubscript:", v6, v7);

}

- (BOOL)_isSamplingDateCurrent
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isDateInToday:", self->_samplingDate);

  return (char)self;
}

- (int64_t)numberOfRequestsTillNow
{
  return self->_numberOfRequestsTillNow;
}

- (void)setNumberOfRequestsTillNow:(int64_t)a3
{
  self->_numberOfRequestsTillNow = a3;
}

- (NSDate)samplingDate
{
  return self->_samplingDate;
}

- (void)setSamplingDate:(id)a3
{
  objc_storeStrong((id *)&self->_samplingDate, a3);
}

- (NSMutableDictionary)dictationSamplingVariables
{
  return self->_dictationSamplingVariables;
}

- (void)setDictationSamplingVariables:(id)a3
{
  objc_storeStrong((id *)&self->_dictationSamplingVariables, a3);
}

- (BOOL)isDeviceSampledFromConfig
{
  return self->_isDeviceSampledFromConfig;
}

- (void)setIsDeviceSampledFromConfig:(BOOL)a3
{
  self->_isDeviceSampledFromConfig = a3;
}

- (OS_dispatch_queue)fileQueue
{
  return self->_fileQueue;
}

- (void)setFileQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fileQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileQueue, 0);
  objc_storeStrong((id *)&self->_dictationSamplingVariables, 0);
  objc_storeStrong((id *)&self->_samplingDate, 0);
}

void __61__CESRDictationOnDeviceSampling__updateDictationSampledPlist__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
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
  objc_msgSend(MEMORY[0x1E0CFE898], "createSamplingDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CFE898], "sampledPlistFileName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v7 = objc_msgSend(v5, "writeToURL:error:", v6, &v14);
    v8 = v14;

    v9 = *MEMORY[0x1E0CFE6C0];
    v10 = *MEMORY[0x1E0CFE6C0];
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[CESRDictationOnDeviceSampling _updateDictationSampledPlist]_block_invoke";
        v17 = 2112;
        v18 = v4;
        _os_log_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_INFO, "%s Dictation Sampling: Wrote updated sampling variables to plist: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = v9;
      objc_msgSend(v8, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v16 = "-[CESRDictationOnDeviceSampling _updateDictationSampledPlist]_block_invoke";
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v13;
      _os_log_error_impl(&dword_1B3E5F000, v12, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Failed to write sampling variables to plist: %@, error: %@", buf, 0x20u);

    }
  }
  else
  {
    v11 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CESRDictationOnDeviceSampling _updateDictationSampledPlist]_block_invoke";
      _os_log_error_impl(&dword_1B3E5F000, v11, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Failed to create the sampling directory.", buf, 0xCu);
    }
  }

}

+ (id)sharedManager
{
  if (sharedManager_onceToken_723 != -1)
    dispatch_once(&sharedManager_onceToken_723, &__block_literal_global_724);
  return (id)sharedManager_sharedMyManager_725;
}

+ (BOOL)_isInternalInstall
{
  if (_isInternalInstall_onceToken != -1)
    dispatch_once(&_isInternalInstall_onceToken, &__block_literal_global_7);
  return _isInternalInstall_isInternalInstall;
}

+ (BOOL)_isSamplingAllowed
{
  void *v2;
  NSObject *v3;
  const char *v4;
  BOOL v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isDictationOnDeviceSamplingDisabled"))
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "+[CESRDictationOnDeviceSampling _isSamplingAllowed]";
      v4 = "%s Dictation Sampling: Not sampling. Sampling is explicitly disabled.";
LABEL_11:
      _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v7, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v2, "isDictationHIPAACompliant"))
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "+[CESRDictationOnDeviceSampling _isSamplingAllowed]";
      v4 = "%s Dictation Sampling: Not sampling. Request is HIPAA compliant.";
      goto LABEL_11;
    }
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v2, "siriDataSharingOptInStatus") != 1)
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "+[CESRDictationOnDeviceSampling _isSamplingAllowed]";
      v4 = "%s Dictation Sampling: Not sampling. User is not opted-in.";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v5 = 1;
LABEL_13:

  return v5;
}

+ (id)_readDictationSampledPlist
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CFE898], "sampledLibraryDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFE898], "sampledPlistFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "dictionaryWithContentsOfURL:error:", v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (v8)
  {
    v9 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "+[CESRDictationOnDeviceSampling _readDictationSampledPlist]";
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v8;
      _os_log_error_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Failed to read plist at path: %@, error: %@", buf, 0x20u);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_msgSend(v7, "mutableCopy");
  }
  v11 = (void *)v10;

  return v11;
}

uint64_t __51__CESRDictationOnDeviceSampling__isInternalInstall__block_invoke()
{
  uint64_t result;

  result = AFIsInternalInstall();
  _isInternalInstall_isInternalInstall = result;
  return result;
}

void __46__CESRDictationOnDeviceSampling_sharedManager__block_invoke()
{
  CESRDictationOnDeviceSampling *v0;
  void *v1;

  v0 = objc_alloc_init(CESRDictationOnDeviceSampling);
  v1 = (void *)sharedManager_sharedMyManager_725;
  sharedManager_sharedMyManager_725 = (uint64_t)v0;

}

@end
