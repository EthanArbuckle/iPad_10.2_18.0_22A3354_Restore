@implementation BiometricSupportTools

+ (id)dateFromNanoTime:(unint64_t)a3 nanoseconds:(unsigned int *)a4
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)a3 / 1000000000.0);
  if (a4)
    *a4 = a3 % 0x3B9ACA00;
  return result;
}

+ (void)analyticsOSLogNSDictionary:(id)a3 forEvent:(id)a4
{
  +[BiometricSupportTools analyticsOSLogNSDictionary:forEvent:toLogPath:withPrefix:](BiometricSupportTools, "analyticsOSLogNSDictionary:forEvent:toLogPath:withPrefix:", a3, a4, CFSTR("/private/var/tmp/"), CFSTR("PearlAWD"));
}

+ (void)analyticsOSLogNSDictionary:(id)a3 forEvent:(id)a4 toLogPath:(id)a5 withPrefix:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *queue;
  unint64_t v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  id v38;
  _BYTE *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  _BYTE v45[20];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v33 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");
  v42 = 0;
  v40 = 0;
  v41 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  queue = dispatch_queue_create("com.apple.biometrickit.analyticsFileLog", 0);
  if (!queue)
  {
    v27 = (__osLog ? __osLog : MEMORY[0x1E0C81028]);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "analyticsDispatchQueue";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v44 = (uint64_t (*)(uint64_t, uint64_t))&unk_1AF575226;
      *(_WORD *)v45 = 2080;
      *(_QWORD *)&v45[2] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      *(_WORD *)&v45[10] = 1024;
      *(_DWORD *)&v45[12] = 936;
      _os_log_impl(&dword_1AF533000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (!v11)
  {
    v28 = (__osLog ? __osLog : MEMORY[0x1E0C81028]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "prefix";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v44 = (uint64_t (*)(uint64_t, uint64_t))&unk_1AF575226;
      *(_WORD *)v45 = 2080;
      *(_QWORD *)&v45[2] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      *(_WORD *)&v45[10] = 1024;
      *(_DWORD *)&v45[12] = 937;
      _os_log_impl(&dword_1AF533000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix__onceToken != -1)
    dispatch_once(&analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix__onceToken, &__block_literal_global_65);
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_52);
  if (isInternalBuild_isInternal && v10 && analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix__saveToFile)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v44 = __Block_byref_object_copy__1;
    *(_QWORD *)v45 = __Block_byref_object_dispose__1;
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSince1970");
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/%d_%@.plist"), v10, (int)v17, v33);
    *(_QWORD *)&v45[8] = objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__BiometricSupportTools_analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix___block_invoke_71;
    block[3] = &unk_1E5F84510;
    v39 = buf;
    v35 = v10;
    v36 = v33;
    v37 = v11;
    v38 = v9;
    dispatch_async(queue, block);

    _Block_object_dispose(buf, 8);
  }
  if (v13)
  {
    v18 = 0;
    do
    {
      objc_msgSend(v12, "getParagraphStart:end:contentsEnd:forRange:", &v42, &v41, &v40, v18, 0);
      objc_msgSend(v12, "substringWithRange:", v42, v40 - v42);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v19);

      v18 = v41;
    }
    while (v41 < v13);
  }
  v29 = v10;
  v30 = v9;
  v32 = objc_msgSend(v14, "count") / 0x19uLL + 1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v21 = 0;
    v22 = 1;
    do
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appendString:", v23);

      objc_msgSend(v20, "appendString:", CFSTR("\n"));
      if (v22 - 1 < v21 / 0x19)
      {
        if (__osLog)
          v24 = __osLog;
        else
          v24 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v33;
          *(_WORD *)&buf[22] = 2048;
          v44 = (uint64_t (*)(uint64_t, uint64_t))v22;
          *(_WORD *)v45 = 2048;
          *(_QWORD *)&v45[2] = v32;
          *(_WORD *)&v45[10] = 2112;
          *(_QWORD *)&v45[12] = v20;
          _os_log_impl(&dword_1AF533000, v24, OS_LOG_TYPE_DEBUG, "%@: sendEvent: %@ (print %ld of %ld): \n%@\n", buf, 0x34u);
        }
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v25 = objc_claimAutoreleasedReturnValue();

        ++v22;
        v20 = (void *)v25;
      }
      ++v21;
    }
    while (v21 < objc_msgSend(v14, "count"));
  }
  else
  {
    v22 = 1;
  }
  if (__osLog)
    v26 = __osLog;
  else
    v26 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v33;
    *(_WORD *)&buf[22] = 2048;
    v44 = (uint64_t (*)(uint64_t, uint64_t))v22;
    *(_WORD *)v45 = 2048;
    *(_QWORD *)&v45[2] = v32;
    *(_WORD *)&v45[10] = 2112;
    *(_QWORD *)&v45[12] = v20;
    _os_log_impl(&dword_1AF533000, v26, OS_LOG_TYPE_DEBUG, "%@: sendEvent: %@ (print %ld of %ld): \n%@\n", buf, 0x34u);
  }

}

void __82__BiometricSupportTools_analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix___block_invoke()
{
  id v0;

  +[BioUserDefaults sharedInstance](BioUserDefaults, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix__saveToFile = objc_msgSend(v0, "BOOLForKey:", CFSTR("analyticsSaveToFile"));

}

void __82__BiometricSupportTools_analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix___block_invoke_71(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%d_%@.plist"), v5, ((int)v7 + 1), *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  v11 = MEMORY[0x1E0C81028];
  if (__osLog)
    v12 = __osLog;
  else
    v12 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(const char **)(a1 + 48);
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138412802;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v15;
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEBUG, "%@: write event: %@ to file: %@\n", buf, 0x20u);
  }
  if ((objc_msgSend(*(id *)(a1 + 56), "writeToFile:atomically:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 1) & 1) == 0)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v11;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "[dict writeToFile:filePath atomically:__objc_yes]";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      v25 = 1024;
      v26 = 958;
      _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
}

@end
