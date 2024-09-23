@implementation AVOutputDeviceFrecencyManager

+ (double)frecencyScoreForDeviceID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v4 = (void *)objc_msgSend(a1, "_frecentsReaderAfterMigrationIfNecessary");
  if (a3)
  {
    if (v4)
    {
      v5 = (void *)objc_msgSend(v4, "frecencyInfoForDeviceWithID:", a3);
      if (v5)
      {
        v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FrecencyScore"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "doubleValue");
          return result;
        }
        if (dword_1ECDECED8)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
  }
  return 0.0;
}

+ (id)_frecentsReaderAfterMigrationIfNecessary
{
  AVOutputDeviceFrecentsReader *v3;
  AVOutputDeviceFrecentsReader *v4;
  id v5;
  void *v6;
  id v8;

  if (objc_msgSend((id)objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier"), "isEqualToString:", CFSTR("AVPlatformIdentifierMacOS")))
  {
    v3 = (AVOutputDeviceFrecentsReader *)objc_msgSend(a1, "_frecentsFilePath");
    if (v3)
    {
      v4 = v3;
      v8 = 0;
      v3 = -[AVOutputDeviceFrecentsReader initWithFrecentsFilePath:error:]([AVOutputDeviceFrecentsReader alloc], "initWithFrecentsFilePath:error:", v3, &v8);
      if (!v3)
      {
        v5 = v8;
        if (v8
          && (v6 = (void *)objc_msgSend(v8, "domain"),
              objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
          && objc_msgSend(v5, "code") == 260
          && objc_msgSend(a1, "_migrateFrecentsFromCFPreferencesToFrecentsFilePath:", v4))
        {
          v3 = -[AVOutputDeviceFrecentsReader initWithFrecentsFilePath:error:]([AVOutputDeviceFrecentsReader alloc], "initWithFrecentsFilePath:error:", v4, &v8);
        }
        else
        {
          v3 = 0;
        }
      }
    }
    return v3;
  }
  else
  {
    if (_frecentsReaderAfterMigrationIfNecessary_loggingOnce != -1)
      dispatch_once(&_frecentsReaderAfterMigrationIfNecessary_loggingOnce, &__block_literal_global_20);
    return +[AVOutputDeviceLegacyFrecentsReader defaultFrecentsReader](AVOutputDeviceLegacyFrecentsReader, "defaultFrecentsReader");
  }
}

void __73__AVOutputDeviceFrecencyManager__frecentsReaderAfterMigrationIfNecessary__block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

+ (void)updateFrecencyListForDeviceID:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v23;
  char v24;
  void *v25;
  double v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id obj;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  os_log_type_t type;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_msgSend(a1, "_frecentsReaderAfterMigrationIfNecessary");
  v36 = (void *)objc_msgSend(a1, "_frecentsWriter");
  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend(v6, "deviceIDs"));
    if ((objc_msgSend(v7, "containsObject:", a3) & 1) == 0)
      objc_msgSend(v7, "addObject:", a3);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v35 = *(_QWORD *)v41;
      v11 = 0.0;
      v33 = a3;
      obj = v7;
      while (1)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v41 != v35)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v14 = (void *)objc_msgSend(v6, "frecencyInfoForDeviceWithID:", v13);
          v15 = 1.0;
          if (!v14)
            goto LABEL_17;
          v16 = v14;
          v17 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("FrecencyScore"));
          v18 = objc_msgSend(v16, "objectForKey:", CFSTR("LastUsedTimestamp"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v17, "doubleValue");
              v20 = v19;
              objc_msgSend(v5, "timeIntervalSinceDate:", v18);
              v15 = v20 * exp2(v21 / 86400.0 * -0.5) + 1.0;
              goto LABEL_18;
            }
            if (dword_1ECDECED8)
            {
LABEL_16:
              v39 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              a3 = v33;
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          else if (dword_1ECDECED8)
          {
            goto LABEL_16;
          }
LABEL_17:
          v18 = 0;
LABEL_18:
          v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15, v29, v31);
          if (v11 == 0.0)
          {
            v10 = v13;
            v11 = v15;
          }
          v24 = objc_msgSend(v13, "isEqualToString:", a3);
          if (v11 > v15)
            v25 = v13;
          else
            v25 = v10;
          if (v11 > v15)
            v26 = v15;
          else
            v26 = v11;
          if ((v24 & 1) != 0)
            v27 = v5;
          else
            v27 = (void *)v18;
          if ((v24 & 1) == 0)
          {
            v10 = v25;
            v11 = v26;
          }
          if (v27)
          {
            objc_msgSend(v36, "setFrecencyInfo:forDeviceID:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v23, v26, CFSTR("FrecencyScore"), v27, CFSTR("LastUsedTimestamp"), 0), v13);
          }
          else
          {
            if (dword_1ECDECED8)
            {
              v39 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              a3 = v33;
            }
            objc_msgSend(v36, "removeFrecencyInfoForDeviceID:", v13, v26, v30, v32);
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (!v9)
          goto LABEL_40;
      }
    }
    v10 = 0;
LABEL_40:
    if (objc_msgSend(v36, "numberOfKeysToBeSet") >= 51 && (objc_msgSend(v10, "isEqualToString:", a3) & 1) == 0)
    {
      if (v10)
        objc_msgSend(v36, "removeFrecencyInfoForDeviceID:", v10);
    }
    v37 = 0;
    objc_msgSend(v36, "persistToDiskReturningError:", &v37);
  }
}

+ (id)_applicationSupportPath
{
  uint64_t started;
  _BYTE v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  started = sysdir_start_search_path_enumeration_private();
  if (MEMORY[0x19403475C](started, v4))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v4, 30);
  else
    return 0;
}

+ (id)_frecentsContainerPath
{
  id result;
  void *v3;
  uint64_t v4;

  result = (id)objc_msgSend(a1, "_applicationSupportPath");
  if (result)
  {
    v3 = (void *)objc_msgSend((id)objc_msgSend(result, "stringByAppendingPathComponent:", CFSTR("com.apple.avfoundation")), "stringByAppendingPathComponent:", CFSTR("Frecents"));
    v4 = 0;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v4))return v3;
    else
      return 0;
  }
  return result;
}

+ (id)_frecentsFilePath
{
  void *v2;
  _QWORD block[5];

  v2 = (void *)objc_msgSend(a1, "_frecentsContainerPath");
  if (v2)
  {
    v2 = (void *)objc_msgSend(v2, "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), CFSTR("com.apple.avfoundation.frecents")));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__AVOutputDeviceFrecencyManager__frecentsFilePath__block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = v2;
    if (_frecentsFilePath_pathLoggingOnce != -1)
      dispatch_once(&_frecentsFilePath_pathLoggingOnce, block);
  }
  return v2;
}

uint64_t __50__AVOutputDeviceFrecencyManager__frecentsFilePath__block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;

  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

+ (BOOL)_migrateFrecentsFromCFPreferencesToFrecentsFilePath:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v5;
  id v6;
  AVOutputDeviceFrecentsWriter *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  char v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  os_log_type_t type;
  int v24;
  _BYTE v25[128];
  _QWORD v26[17];

  v26[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    v24 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = +[AVOutputDeviceLegacyFrecentsReader defaultFrecentsReader](AVOutputDeviceLegacyFrecentsReader, "defaultFrecentsReader", v16, v17);
  v6 = +[AVOutputDeviceLegacyFrecentsWriter defaultFrecentsWriter](AVOutputDeviceLegacyFrecentsWriter, "defaultFrecentsWriter");
  v7 = -[AVOutputDeviceFrecentsWriter initWithFrecentsFilePath:]([AVOutputDeviceFrecentsWriter alloc], "initWithFrecentsFilePath:", a3);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (void *)objc_msgSend(v5, "deviceIDs");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[AVOutputDeviceFrecentsWriter setFrecencyInfo:forDeviceID:](v7, "setFrecencyInfo:forDeviceID:", objc_msgSend(v5, "frecencyInfoForDeviceWithID:", v13), v13);
        objc_msgSend(v6, "removeFrecencyInfoForDeviceID:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v10);
  }
  v26[0] = 0;
  if (-[AVOutputDeviceFrecentsWriter persistToDiskReturningError:](v7, "persistToDiskReturningError:", v26))
  {
    v18 = 0;
    v14 = objc_msgSend(v6, "persistToDiskReturningError:", &v18);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_frecentsWriter
{
  AVOutputDeviceFrecentsWriter *v3;

  if (!objc_msgSend((id)objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier"), "isEqualToString:", CFSTR("AVPlatformIdentifierMacOS")))return +[AVOutputDeviceLegacyFrecentsWriter defaultFrecentsWriter](AVOutputDeviceLegacyFrecentsWriter, "defaultFrecentsWriter");
  v3 = (AVOutputDeviceFrecentsWriter *)objc_msgSend(a1, "_frecentsFilePath");
  if (v3)
    v3 = -[AVOutputDeviceFrecentsWriter initWithFrecentsFilePath:]([AVOutputDeviceFrecentsWriter alloc], "initWithFrecentsFilePath:", v3);
  return v3;
}

@end
