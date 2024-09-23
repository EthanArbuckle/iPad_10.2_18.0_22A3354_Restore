@implementation CDMLogging

+ (void)CDMLogInitIfNeeded
{
  if (+[CDMLogging CDMLogInitIfNeeded]::once != -1)
    dispatch_once(&+[CDMLogging CDMLogInitIfNeeded]::once, &__block_literal_global_42);
}

+ (BOOL)debugEnabled
{
  return os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG);
}

void __32__CDMLogging_CDMLogInitIfNeeded__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)CDMLoggingSubsystem, (const char *)CDMLoggingCategory);
  v1 = (void *)CDMLogContext;
  CDMLogContext = (uint64_t)v0;

}

@end
