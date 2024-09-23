@implementation AMFIFMKLog

+ (id)generic
{
  if (generic_sLogInit != -1)
    dispatch_once(&generic_sLogInit, &__block_literal_global);
  return (id)generic_sLog;
}

void __21__AMFIFMKLog_generic__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MobileFileIntegrity.framework", "default");
  v1 = (void *)generic_sLog;
  generic_sLog = (uint64_t)v0;

}

@end
