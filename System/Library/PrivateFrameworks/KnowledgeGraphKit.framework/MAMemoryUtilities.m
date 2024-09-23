@implementation MAMemoryUtilities

+ (id)humanReadableMemorySizeWithSize:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;

  if (a3 >= 0x100000)
  {
    v6 = 0;
    v7 = a3;
    do
    {
      a3 = v7 >> 10;
      v5 = v6 + 1;
      if (v6 > 4)
        break;
      v8 = v7 >> 30;
      v7 >>= 10;
      ++v6;
    }
    while (v8);
  }
  else
  {
    v5 = 0;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld %s"), a3, off_1E83E4278[v5], v3, v4);
}

+ (id)humanReadableResidentMemory
{
  __CFString *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[8];
  uint64_t v8;

  v8 = 0;
  if (report_memory(&v8, 0, 0))
  {
    objc_msgSend(a1, "humanReadableMemorySizeWithSize:", v8);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MALogging sharedLogging](MALogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1CA0A5000, v5, OS_LOG_TYPE_ERROR, "failed to calculate resident memory", v7, 2u);
    }

    v3 = CFSTR("0");
  }
  return v3;
}

+ (id)humanReadableMemoryFootprint
{
  __CFString *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[8];
  uint64_t v8;

  v8 = 0;
  if (report_memory(0, (unint64_t)&v8, 0))
  {
    objc_msgSend(a1, "humanReadableMemorySizeWithSize:", v8);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MALogging sharedLogging](MALogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1CA0A5000, v5, OS_LOG_TYPE_ERROR, "failed to calculate memory footprint", v7, 2u);
    }

    v3 = CFSTR("0");
  }
  return v3;
}

+ (id)humanReadablePeakMemoryFootprint
{
  __CFString *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[8];
  uint64_t v8;

  v8 = 0;
  if (report_memory(0, 0, (unint64_t)&v8))
  {
    objc_msgSend(a1, "humanReadableMemorySizeWithSize:", v8);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MALogging sharedLogging](MALogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1CA0A5000, v5, OS_LOG_TYPE_ERROR, "failed to calculate peak memory footprint", v7, 2u);
    }

    v3 = CFSTR("0");
  }
  return v3;
}

+ (unint64_t)footprintBytes
{
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  unint64_t v6;

  v6 = 0;
  if (report_memory(0, (unint64_t)&v6, 0))
    return v6;
  +[MALogging sharedLogging](MALogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1CA0A5000, v4, OS_LOG_TYPE_ERROR, "failed to calculate memory footprint", v5, 2u);
  }

  return 0;
}

+ (unint64_t)peakFootprintBytes
{
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  unint64_t v6;

  v6 = 0;
  if (report_memory(0, 0, (unint64_t)&v6))
    return v6;
  +[MALogging sharedLogging](MALogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1CA0A5000, v4, OS_LOG_TYPE_ERROR, "failed to calculate peak memory footprint", v5, 2u);
  }

  return 0;
}

+ (unint64_t)residentBytes
{
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  unint64_t v6;

  v6 = 0;
  if (report_memory(&v6, 0, 0))
    return v6;
  +[MALogging sharedLogging](MALogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1CA0A5000, v4, OS_LOG_TYPE_ERROR, "failed to calculate resident memory", v5, 2u);
  }

  return 0;
}

@end
