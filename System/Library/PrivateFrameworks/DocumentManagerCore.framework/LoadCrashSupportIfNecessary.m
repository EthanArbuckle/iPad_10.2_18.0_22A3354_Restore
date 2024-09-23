@implementation LoadCrashSupportIfNecessary

void __LoadCrashSupportIfNecessary_block_invoke()
{
  void *v0;
  NSObject *v1;

  v0 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport"), "fileSystemRepresentation"), 1);
  LoadCrashSupportIfNecessary___CrashReportHandle = (uint64_t)v0;
  if (v0)
  {
    DOCSimulateCrash = dlsym(v0, "SimulateCrash");
  }
  else
  {
    v1 = docLogHandle;
    if (!docLogHandle)
    {
      if (DOCInitLogging_once != -1)
        dispatch_once(&DOCInitLogging_once, &__block_literal_global_0);
      v1 = docLogHandle;
    }
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __LoadCrashSupportIfNecessary_block_invoke_cold_1(v1);
  }
}

void __LoadCrashSupportIfNecessary_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2090A2000, log, OS_LOG_TYPE_ERROR, "Unable to load CrashReporterSupport framework.", v1, 2u);
}

@end
