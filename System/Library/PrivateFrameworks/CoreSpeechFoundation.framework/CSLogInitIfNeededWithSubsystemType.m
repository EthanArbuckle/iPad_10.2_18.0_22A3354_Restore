@implementation CSLogInitIfNeededWithSubsystemType

void __CSLogInitIfNeededWithSubsystemType_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;
  os_log_t v3;
  void *v4;
  os_log_t v5;
  void *v6;
  os_log_t v7;
  void *v8;
  os_log_t v9;
  void *v10;
  os_log_t v11;
  void *v12;
  os_log_t v13;
  void *v14;
  os_log_t v15;
  void *v16;
  os_log_t v17;
  void *v18;
  os_log_t v19;
  void *v20;
  os_log_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v0 = (const char *)CSLoggingSubsystem;
  v1 = os_log_create((const char *)CSLoggingSubsystem, (const char *)kCSLoggingContextFramework);
  v2 = (void *)CSLogContextFacilityCoreSpeech;
  CSLogContextFacilityCoreSpeech = (uint64_t)v1;

  v3 = os_log_create(v0, (const char *)kCSLoggingCategoryVT);
  v4 = (void *)CSLogCategoryVT;
  CSLogCategoryVT = (uint64_t)v3;

  v5 = os_log_create(v0, (const char *)kCSLoggingCategoryEP);
  v6 = (void *)CSLogCategoryEP;
  CSLogCategoryEP = (uint64_t)v5;

  v7 = os_log_create(v0, (const char *)kCSLoggingCategorySDSD);
  v8 = (void *)CSLogCategorySDSD;
  CSLogCategorySDSD = (uint64_t)v7;

  v9 = os_log_create(v0, (const char *)kCSLoggingCategoryAsset);
  v10 = (void *)CSLogCategoryAsset;
  CSLogCategoryAsset = (uint64_t)v9;

  v11 = os_log_create(v0, (const char *)kCSLoggingCategoryRequest);
  v12 = (void *)CSLogCategoryRequest;
  CSLogCategoryRequest = (uint64_t)v11;

  v13 = os_log_create(v0, (const char *)kCSLoggingCategoryAudio);
  v14 = (void *)CSLogCategoryAudio;
  CSLogCategoryAudio = (uint64_t)v13;

  v15 = os_log_create(v0, (const char *)kCSLoggingCategoryASV);
  v16 = (void *)CSLogCategoryASV;
  CSLogCategoryASV = (uint64_t)v15;

  v17 = os_log_create(v0, (const char *)kCSLoggingCategoryAdBlocker);
  v18 = (void *)CSLogCategoryAdBlocker;
  CSLogCategoryAdBlocker = (uint64_t)v17;

  v19 = os_log_create(v0, (const char *)kCSLoggingCategorySpkrId);
  v20 = (void *)CSLogCategorySpkrId;
  CSLogCategorySpkrId = (uint64_t)v19;

  v21 = os_log_create(v0, (const char *)kCSLoggingCategoryAttending);
  v22 = (void *)CSLogCategoryAttending;
  CSLogCategoryAttending = (uint64_t)v21;

  v23 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v24 = (void *)_dateFormatter;
  _dateFormatter = (uint64_t)v23;

  v25 = (void *)_dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLocale:", v26);

  objc_msgSend((id)_dateFormatter, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
  v27 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136315394;
    v29 = "CSLogInitIfNeededWithSubsystemType_block_invoke";
    v30 = 2080;
    v31 = "Unknown";
    _os_log_impl(&dword_1B502E000, v27, OS_LOG_TYPE_DEFAULT, "%s ::: CoreSpeech logging initialized (%s)", (uint8_t *)&v28, 0x16u);
  }
}

@end
