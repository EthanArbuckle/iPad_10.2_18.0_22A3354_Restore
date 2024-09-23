@implementation BGSystemTaskWorkload

+ (id)logger
{
  if (logger_onceToken != -1)
    dispatch_once(&logger_onceToken, &__block_literal_global);
  return (id)logger_log;
}

void __30__BGSystemTaskWorkload_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackgroundSystemTasks", "BGSTFramework");
  v1 = (void *)logger_log;
  logger_log = (uint64_t)v0;

}

+ (BOOL)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 error:(id *)a5
{
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  id v13;
  int v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[BGSystemTaskWorkload logger](BGSystemTaskWorkload, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218240;
    v15 = a3;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_1D13A5000, v8, OS_LOG_TYPE_DEFAULT, "Received system workload %lu for category %lu", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D1D928], "sharedScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "reportSystemWorkload:ofCategory:error:", a3, a4, a5);

  if (a5)
  {
    +[BGSystemTaskWorkload logger](BGSystemTaskWorkload, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *a5;
      v14 = 138412802;
      v15 = (unint64_t)v13;
      v16 = 2048;
      v17 = a3;
      v18 = 2048;
      v19 = a4;
      _os_log_error_impl(&dword_1D13A5000, v11, OS_LOG_TYPE_ERROR, "Error:%@ reporting system workload %lu for category %lu", (uint8_t *)&v14, 0x20u);
    }

  }
  return v10;
}

@end
