@implementation LogDumpUtility

+ (id)logFilename:(int)a3 dumpID:(id)a4 logNameType:(int)a5 prefix:(id)a6 suffix:(id)a7
{
  __CFString *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v17;
  id v18[4];

  v18[3] = *(id *)MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18[0] = (id)0xAAAAAAAAAAAAAAAALL;
    v11 = CFSTR("/var/mobile/tmp/com.apple.audiomxd/AudioCapture/AVC/");
    if ((objc_msgSend(v12, "fileExistsAtPath:", CFSTR("/var/mobile/tmp/com.apple.audiomxd/AudioCapture/AVC/")) & 1) == 0
      && (objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/tmp/com.apple.audiomxd/AudioCapture/AVC/"), 1, 0, v18) & 1) == 0&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[LogDumpUtility logFilename:dumpID:logNameType:prefix:suffix:].cold.1(v13, v18, v14);
      v11 = CFSTR("/var/mobile/tmp/com.apple.audiomxd/AudioCapture/AVC/");
    }
  }
  else if (a3)
  {
    v11 = &stru_1E9E58EE0;
  }
  else
  {
    v11 = (__CFString *)objc_msgSend(MEMORY[0x1E0CF2698], "getDefaultLogDumpPath");
  }
  if (a5 == 1)
  {
    memset(v18, 170, 20);
    VRLogfile_CreateTimeAndDateString((char *)v18, 20);
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%@-%@%@"), v18, a4, a6, a7);
  }
  else
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@%@"), a4, a6, a7, v17);
  }
  return (id)-[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v15);
}

+ (id)createFileListSortedByTimestamp:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, &v21);
  if (v21)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v17 = objc_msgSend(v21, "localizedDescription");
        *(_DWORD *)buf = 136316162;
        v28 = v5;
        v29 = 2080;
        v30 = "+[LogDumpUtility createFileListSortedByTimestamp:]";
        v31 = 1024;
        v32 = 401;
        v33 = 2112;
        v34 = a3;
        v35 = 2112;
        v36 = v17;
        _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d failed to read directory %@ (%@)", buf, 0x30u);
      }
    }
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v19 = *MEMORY[0x1E0CB2B28];
    v20 = *MEMORY[0x1E0CB2B18];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
        if (v11)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), a3, v11);
          v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", v12, &v21);
          if (!v21)
          {
            v14 = v13;
            if (objc_msgSend(v13, "objectForKeyedSubscript:", v20) == v19)
            {
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v11, v14, 0);
              objc_msgSend(v18, "addObject:", v15);

            }
          }

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v8);
  }
  objc_msgSend(v18, "sortUsingComparator:", &__block_literal_global_97);
  return v18;
}

uint64_t __50__LogDumpUtility_createFileListSortedByTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a2, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
  return objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A88]), "compare:", objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A88]));
}

+ (void)removeFilesInDirectory:(id)a3 olderThan:(id)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t j;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  int ErrorLogLevelForModule;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  uint32_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  unint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  int v67;
  __int16 v68;
  unint64_t v69;
  _BYTE v70[128];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "createFileListSortedByTimestamp:", a3);
    if (v6)
    {
      v7 = (void *)v6;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v55 = v8;
          v56 = 2080;
          v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
          v58 = 1024;
          v59 = 433;
          v60 = 2112;
          v61 = (unint64_t)a3;
          v62 = 2048;
          v63 = objc_msgSend(v7, "count");
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d directory=%@, fileList.count=%lu", buf, 0x30u);
        }
      }
      v47 = a3;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
      v11 = (uint64_t *)MEMORY[0x1E0CB2AF0];
      if (v10)
      {
        v12 = v10;
        v13 = 0;
        v14 = *(_QWORD *)v77;
        v15 = *MEMORY[0x1E0CB2AF0];
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v77 != v14)
              objc_enumerationMutation(v7);
            v13 += objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "objectAtIndexedSubscript:", 1), "objectForKeyedSubscript:", v15), "integerValue");
          }
          v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
        }
        while (v12);
      }
      else
      {
        v13 = 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v55 = v17;
          v56 = 2080;
          v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
          v58 = 1024;
          v59 = 439;
          v60 = 2048;
          v61 = v13;
          _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Total size: %llu", buf, 0x26u);
        }
      }
      v53 = 0;
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("(.*)(\\d{10})(-.*)$"), 0, &v53);
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v52 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v70, 16);
      if (v52)
      {
        v19 = 0;
        v50 = *MEMORY[0x1E0CB2A88];
        v51 = *(_QWORD *)v72;
        v48 = *v11;
        v46 = a4;
        do
        {
          for (j = 0; j != v52; ++j)
          {
            v21 = v19;
            if (*(_QWORD *)v72 != v51)
              objc_enumerationMutation(v7);
            v22 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
            v23 = (void *)objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
            v24 = (void *)objc_msgSend((id)objc_msgSend(v22, "objectAtIndexedSubscript:", 1), "objectForKeyedSubscript:", v50);
            v25 = (uint64_t)v24;
            if (!a4 || objc_msgSend(v24, "compare:", a4) == -1)
            {
              v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "objectAtIndexedSubscript:", 1), "objectForKeyedSubscript:", v48), "integerValue");
              v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v23);
              objc_msgSend(v49, "replaceMatchesInString:options:range:withTemplate:", v30, 0, 0, objc_msgSend(v23, "length"), CFSTR("$2"));
              if (v30)
                v19 = objc_msgSend(v30, "integerValue");
              else
                v19 = 0;

              if (v13 <= 0xF4240 && v19 && (!v21 || v19 != v21))
                goto LABEL_53;
              v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), v47, v23);
              if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v31) & 1) != 0)
              {
                v32 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v31, &v53);
                ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
                if (v32)
                {
                  if (ErrorLogLevelForModule >= 7)
                  {
                    v34 = VRTraceErrorLogLevelToCSTR();
                    v35 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136316930;
                      v55 = v34;
                      v56 = 2080;
                      v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
                      v58 = 1024;
                      v59 = 462;
                      v60 = 2112;
                      v61 = (unint64_t)v23;
                      v62 = 2112;
                      v63 = v25;
                      v64 = 2048;
                      v65 = v29;
                      v66 = 1024;
                      v67 = v19;
                      v68 = 2048;
                      v69 = v13;
                      v36 = v35;
                      v37 = " [%s] %s:%d removed %@ (%@, %llu bytes, dumpID %u) - %llu bytes remaining";
                      v38 = 74;
                      goto LABEL_44;
                    }
                  }
                }
                else if (ErrorLogLevelForModule >= 3)
                {
                  v41 = VRTraceErrorLogLevelToCSTR();
                  v42 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  {
                    v43 = objc_msgSend(v53, "localizedDescription");
                    *(_DWORD *)buf = 136316162;
                    v55 = v41;
                    v56 = 2080;
                    v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
                    v58 = 1024;
                    v59 = 464;
                    v60 = 2112;
                    v61 = (unint64_t)v31;
                    v62 = 2112;
                    v63 = v43;
                    _os_log_error_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_ERROR, " [%s] %s:%d failed to remove %@ (%@)", buf, 0x30u);
                  }
                }
              }
              else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v39 = VRTraceErrorLogLevelToCSTR();
                v40 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  v55 = v39;
                  v56 = 2080;
                  v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
                  v58 = 1024;
                  v59 = 460;
                  v60 = 2112;
                  v61 = (unint64_t)v31;
                  v36 = v40;
                  v37 = " [%s] %s:%d file no longer exists at %@";
                  v38 = 38;
LABEL_44:
                  _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, v38);
                }
              }

              v13 -= v29;
              a4 = v46;
              continue;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v26 = VRTraceErrorLogLevelToCSTR();
              v27 = *MEMORY[0x1E0CF2758];
              v28 = *MEMORY[0x1E0CF2758];
              if (*MEMORY[0x1E0CF2748])
              {
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  v55 = v26;
                  v56 = 2080;
                  v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
                  v58 = 1024;
                  v59 = 473;
                  v60 = 2112;
                  v61 = (unint64_t)v23;
                  v62 = 2112;
                  v63 = v25;
                  _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping filename=%@, date=%@", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                v55 = v26;
                v56 = 2080;
                v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
                v58 = 1024;
                v59 = 473;
                v60 = 2112;
                v61 = (unint64_t)v23;
                v62 = 2112;
                v63 = v25;
                _os_log_debug_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Skipping filename=%@, date=%@", buf, 0x30u);
              }
            }
          }
          v52 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v70, 16);
        }
        while (v52);
      }
LABEL_53:

      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v44 = VRTraceErrorLogLevelToCSTR();
        v45 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v55 = v44;
          v56 = 2080;
          v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
          v58 = 1024;
          v59 = 478;
          v60 = 2048;
          v61 = v13;
          _os_log_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Completed: Total size: %llu", buf, 0x26u);
        }
      }
    }
  }
}

+ (BOOL)shouldCleanupFiles
{
  unint64_t v2;
  double v3;
  BOOL result;
  unint64_t v5;

  if (shouldCleanupFiles_initOnce != -1)
    dispatch_once(&shouldCleanupFiles_initOnce, &__block_literal_global_35_0);
  v2 = atomic_load((unint64_t *)&shouldCleanupFiles__lastCleanupTimeCache);
  v3 = micro();
  if ((uint64_t)((uint64_t)v3 - v2) < 15)
    return 0;
  while (1)
  {
    v5 = __ldaxr((unint64_t *)&shouldCleanupFiles__lastCleanupTimeCache);
    if (v5 != v2)
      break;
    if (!__stlxr((uint64_t)v3, (unint64_t *)&shouldCleanupFiles__lastCleanupTimeCache))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

void __36__LogDumpUtility_shouldCleanupFiles__block_invoke()
{
  shouldCleanupFiles__lastCleanupTimeCache = 0;
}

+ (int64_t)fileCleanupDispatchQueuePriority
{
  return -32768;
}

+ (void)removeOldFilesInDefaultLogDumpPath
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue(+[LogDumpUtility fileCleanupDispatchQueuePriority](LogDumpUtility, "fileCleanupDispatchQueuePriority"), 0);
  dispatch_async(global_queue, &__block_literal_global_36_0);
}

uint64_t __52__LogDumpUtility_removeOldFilesInDefaultLogDumpPath__block_invoke()
{
  uint64_t result;
  id v1;
  id v2;
  uint64_t v3;

  result = +[LogDumpUtility shouldCleanupFiles](LogDumpUtility, "shouldCleanupFiles");
  if ((_DWORD)result)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v2, "setDay:", -1);
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"), "dateByAddingComponents:toDate:options:", v2, v1, 0);

    return +[LogDumpUtility removeFilesInDirectory:olderThan:](LogDumpUtility, "removeFilesInDirectory:olderThan:", objc_msgSend(MEMORY[0x1E0CF2698], "getDefaultLogDumpPath"), v3);
  }
  return result;
}

+ (void)logFilename:(NSObject *)a3 dumpID:logNameType:prefix:suffix:.cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(CFSTR("/var/mobile/tmp/com.apple.audiomxd/AudioCapture/AVC/"), "UTF8String");
  v7 = objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  v8 = 136316162;
  v9 = a1;
  v10 = 2080;
  v11 = "+[LogDumpUtility logFilename:dumpID:logNameType:prefix:suffix:]";
  v12 = 1024;
  v13 = 371;
  v14 = 2080;
  v15 = v6;
  v16 = 2080;
  v17 = v7;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Error in creating directory path=%s error=%s ", (uint8_t *)&v8, 0x30u);
  OUTLINED_FUNCTION_9_1();
}

@end
