@implementation MIOLog

+ (void)recheckDebugEnabled
{
  void *v2;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.movstreamio.framework"));
  sMIOLogDebugEnabled = objc_msgSend(v2, "BOOLForKey:", CFSTR("DEBUG_LOG"));

  objc_sync_exit(obj);
}

+ (BOOL)debugEnabled
{
  if (debugEnabled_onceToken != -1)
    dispatch_once(&debugEnabled_onceToken, &__block_literal_global_2);
  return sMIOLogDebugEnabled;
}

uint64_t __22__MIOLog_debugEnabled__block_invoke()
{
  return +[MIOLog recheckDebugEnabled](MIOLog, "recheckDebugEnabled");
}

+ (OS_os_log)defaultLog
{
  if (defaultLog_onceToken != -1)
    dispatch_once(&defaultLog_onceToken, &__block_literal_global_3);
  return (OS_os_log *)(id)defaultLog_log;
}

void __20__MIOLog_defaultLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.movstreamio.defaultlog", "MOVStreamIO");
  v1 = (void *)defaultLog_log;
  defaultLog_log = (uint64_t)v0;

}

@end
